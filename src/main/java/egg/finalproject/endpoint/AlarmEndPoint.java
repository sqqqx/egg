package egg.finalproject.endpoint;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.Session;
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.JsonObject;

import egg.finalproject.configurator.SpringContext;
import egg.finalproject.configurator.WSConfig;
import egg.finalproject.member.MemberDTO;
import egg.finalproject.member.MemberService;
import egg.finalproject.notice.NoticeDTO;
import egg.finalproject.notice.NoticeService;

@ServerEndpoint(value = "/alarm", configurator = WSConfig.class)
public class AlarmEndPoint {
	// 모든 클라이언트의 session 값을 저장하는 저장소
	private static List<Session> clients = Collections.synchronizedList(new ArrayList<>());
	private static List<Session> admins = Collections.synchronizedList(new ArrayList<>()); // 어드민 모음
	private static Map<String, HttpSession> hMap = new HashMap<>(); // 로그인 유저만
	private static int totalUserCount; // 전체 접속자 수
	private static int loginUserCount; // 로그인 유저 수
	private boolean checkLogin; // 로그인 여부 확인
	private MemberDTO dto; 
	private HttpSession hsession;
	private MemberService mservice;

	// spring Container 내부에서 ChatService 클래스형 인스턴스를 찾아 반환해 멤버필드에 담는 작업
	private NoticeService service = SpringContext.getApplicationContext().getBean(NoticeService.class);

	@OnOpen // 클라이언트와 엔드포인트 간의 첫 접속이 이뤄졌을때
	// OnOpen이라는 어노테이션이 붙은 메서드가 실행 됨
	public void onConnect(Session session, EndpointConfig config) {
		// Session을 저장할 수 있는 List에 접속한 클라이언트들의
		// 연결정보를 저장
		clients.add(session);
		System.out.println("(웹소켓)서버 접속 완료");
		// 전체 접속자 수 +1
		totalUserCount++;
		// HTTP 세션 세팅
		this.hsession = (HttpSession) config.getUserProperties().get("hSession");
		// 로그인 판별
		checkLogin = false;
		if(hsession.getAttribute("loginSession") != null) {
			checkLogin = true;
			dto = (MemberDTO)(hsession.getAttribute("loginSession"));
		}
		// 세션 보관 여부 판별
		if(checkLogin && hMap.get(dto.getUser_id()) == null) {
			hMap.put(dto.getUser_id(), hsession);
			loginUserCount++; // 로그인 유저 수 +1
		}
		// 관리자 판별
		if(checkLogin && dto.getType() == 0) {
			admins.add(session);
		}
		// 접속자 수 확인
		this.getUserCount();
		// 로그인 유저 명단 확인
		this.getUserList();
	}

	@OnMessage // 클라이언트가 send한 메세지가 있으면 실행되는 메서드 부분
	public void onReceive(String message, Session session) {
		// 지금 접속한 클라이언트의 IP주소
		// String userID = (String)this.session.getAttribute("loginID");
		System.out.println("전송완료");
		String[] mg = message.split(",");
		
		// 알림 전송
		if(mg[0].equals("1")||mg[0].equals("2")||mg[0].equals("3")||mg[0].equals("4")) {
			int type = Integer.parseInt(mg[0]);
			int post_no = Integer.parseInt(mg[1]);
			String content = mg[2];
			String from_id = mg[3];
			String to_id = mg[4];

			// userID와 message를 json을 이용해 하나의 데이터로 합쳐주는 작업
			JsonObject obj = new JsonObject();
			obj.addProperty("type", type);
			obj.addProperty("post_no", post_no);
			obj.addProperty("content", content);
			obj.addProperty("from_id", from_id);
			obj.addProperty("to_id", to_id);

			synchronized (clients) { // 동기화 블럭
				// 이 동기화 블럭이 실행되는 동안 다른 쓰레드가 이 블럭 안으로 들어오는 것을 막아 줌
				// 즉 for문이 도는 중간에 onClose 메서드를 통해 clients list에 변화가 생겼다 하더라도
				// 즉각적으로 이 블럭안의 clients 리스트에 반영되지 않아 ConcurrentModification Exception 발생X
				for (Session client : clients) {
					// for문을 돌리면서 모든 클라이언트에게 지금 받은 메세지를 전송
					if (client != session) {
						try {// throws를 하게 되면 나머지 클라이언트가 메세지를 받지 못할 수 있음

							client.getBasicRemote().sendText(obj.toString());
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
			// 클라이언트로부터 받은 메세지를 데이터베이스에 저장하는 작업 -> NoticeService
			try {
				service.insert(new NoticeDTO(0, type, post_no, content, null, from_id, to_id));
				System.out.println("데이터 저장 완료");
			} catch (Exception e) {
				e.printStackTrace();
				return;
			}
		}
		
		// 강제 로그아웃
		if(mg[0].equals("deleteSession")) {
			hMap.get(mg[1]).removeAttribute("loginSession");
		}
		
	}

	@OnClose // 연결이 끊어지면 실행되는 메서드
	public void onClose(Session session) {
		clients.remove(session);
		System.out.println("(웹소켓)클라이언트의 접속이 끊어졌습니다.");
		totalUserCount--;
		
		// 세션 정리
		if(checkLogin && hMap.get(dto.getUser_id()) != null) {
			admins.remove(session);
			hMap.remove(dto.getUser_id());
			checkLogin = false;
			loginUserCount--; 
		}
		// 접속자 수 확인
		this.getUserCount();
		// 로그인 유저 명단 확인
		this.getUserList();
	}
	
	// 접속자 수 확인
	public void getUserCount() {
		// 패키징
		JsonObject obj = new JsonObject();
		obj.addProperty("type", "user_count");
		obj.addProperty("totalUserCount", totalUserCount);
		obj.addProperty("loginUserCount", loginUserCount);
//		obj.addProperty("totalUserCount", clients.size());
//		obj.addProperty("loginUserCount", hMap.size());
		sendMsg(obj);
	}
	
	// 로그인 유저 명단 확인
	public void getUserList() {
		// 로그인 유저 ID추출
		JsonObject obj = new JsonObject();
		obj.addProperty("type", "user_id");
		for(String key : hMap.keySet()){ 
			obj.addProperty(key, key);
		}
		sendMsg(obj);
	}
	
	// 관리자 전송
	public void sendMsg(JsonObject obj) {
		if(!admins.isEmpty()) {
			synchronized (admins) {
				for (Session admin : admins) {
					try {
						admin.getBasicRemote().sendText(obj.toString());
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

}