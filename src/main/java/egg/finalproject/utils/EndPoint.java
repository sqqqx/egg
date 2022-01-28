package egg.finalproject.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.JsonObject;

@ServerEndpoint(value = "/test", configurator = WSConfig.class)

public class EndPoint {

	// 모든 클라의 session값을 저장하는 저장소, 동기화 작업 2개를 세트처럼 할 것
	private static List<Session> clients = Collections.synchronizedList(new ArrayList<>());
	private HttpSession session;

	// 스프링 컨테이너 내부에서 ChatService클래스형 인스턴스를 찾아 반환해 멤버필드에 담는 작업
//	private ChatService service = SpringContext.getApplicationContext().getBean(ChatService.class);

	@OnOpen // 클라이언트와 엔드포인트 간의 첫 접속이 이뤄졌을때
	// OnOpen이란 어노테이션이 붙은 메서드가 실행 됨
	public void onConnect(Session session, EndpointConfig config) {
		// 기존의 HttpProtocol의 Session과 다르게, WebSocketProtocol 전용 세션임
		// 이 세션은 Client, Server간의 연결정보를 담고있는 객체라고 봐도 됨

		// Session을 저장할 수 있는 List에 접속한 클라이언트의 연결정보를 저장
		clients.add(session);
		System.out.println("접속 완료");

		this.session = (HttpSession) config.getUserProperties().get("hSession");
	}

	@OnMessage // 클라이언트가 send한 메세지가 있으면 실행되는 메서드 부분
	public void onReceive(String message, Session session) { // 이 session에는 현재 접속한 클라의 세션정보가 담김
		// 지금 접속한 클라이언트의 IP주소
		String userID = (String) this.session.getAttribute("loginID");

		// userID와 message를 json을 이용하여 하나의 데이터로 합쳐주는 작업
		JsonObject obj = new JsonObject();
		obj.addProperty("id", userID); // obj에 key,value식으로 넣겠다는 의미
		obj.addProperty("message", message);

		synchronized (clients) { // 동기화 블럭
			// 이 동기화 블럭이 실행되는 동안 다른 스레드가 이 블럭 안으로 들어오는 것을 막아 줌
			// 즉 for문이 도는 중간에 onClose 메서드를 통해 clients list에 변화가 생겼다 하더라도
			// 즉각적으로 이 블럭안의 clients 리스트에 반영되지 않아 ConcurrentModification Excetion 발생 X
			for (Session client : clients) {
				if (client != session) { // 모든 접속 클라중 본인은 제외하고 전송
					// for문을 돌면서 모든 클라에게 지금 받은 메세지 전송
					try { // for문에서 throws하면 죄다 던져버리기에, try catch로 처리해야 함
						client.getBasicRemote().sendText(obj.toString()); // json형식처럼 생긴 String값 전송
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}

		// 클라로부터 받은 메세지를 db에 저장하는 작업
//		try {
//			service.insert(new ChatDTO(userID, message));
//		} catch (Exception e) {
//			e.printStackTrace();
//			return;
//		}
	}

	@OnClose // 연결이 끊어지면 실행되는 메서드
	public void onClose(Session session) {
		clients.remove(session); // clients에 session과 동일한 놈이 있으면 제거해 줌
		System.out.println("클라이언트의 접속이 끊어졌습니다");
	}

}
