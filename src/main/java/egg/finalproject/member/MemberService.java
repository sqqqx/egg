package egg.finalproject.member;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberService {
	@Autowired
	private MemberDAO dao;
	
	// 아이디 중복확인
	public boolean idCheck(String id) throws Exception{
		if(dao.idCheck(id) == 1) { 
			return false;
		}else {
			return true;
		}
	}
	
	// 회원가입
	public int insertMember(String user_id, String password, String user_nickname, String email, String phone, String address, String profile_path) throws Exception{
		return dao.insertMember(user_id, password, user_nickname, email, phone, address, profile_path);
	}
	
	// 로그인
	public boolean isLoginOk(String user_id, String password) throws Exception{
		if(dao.isLoginOk(user_id, password) == 1) {
			return true;
		}else {
			return false;
		}
	}
	
	// 로그인시 세션에 아이디 값 담기위해
	public MemberDTO getMember(String user_id) throws Exception{
		return dao.getMember(user_id);
	}
	
	// 닉네임 중복검사
	public boolean nicknameCheck(String nickname) throws Exception{
		if(dao.nicknameCheck(nickname) == 1) { 
			return false;
		}else {
			return true;
		}
	}
	
	// 이메일 중복검사
	public boolean emailCheck(String email) throws Exception{
		if(dao.emailCheck(email) == 1) { 
			return false;
		}else {
			return true;
		}
	}
	
	// 아이디 찾기
	public String toIdFind(String phone) throws Exception {
		return dao.toIdFind(phone);
	}
	
	// 비밀번호 찾기(수정)
	public int toPwFind(String password, String user_id) throws Exception {
		return dao.toPwFind(password, user_id);
	}
	
	
	
	// (회원가입)문자인증
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		String api_key = "NCSXD81W4JNLDXP7";
		String api_secret = "QBTEJKEOK9RF7AN8XPV9OLPMNHFQNBPK";
		Message coolsms = new Message(api_key, api_secret);
		
		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", userPhoneNumber); // 수신전화번호 
		params.put("from", "01021819146"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨 
		params.put("type", "SMS");
		params.put("text", "[능력자들] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
		params.put("app_version", "test app 1.2"); // application name and version
		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}
	
	
	
/////↑↑↑↑↑↑회원가입 및 로그인↑↑↑↑↑↑/////////↓↓↓↓↓↓마이페이지↓↓↓↓↓↓/////////////////////////////
	
	// (마이페이지) ID로 회원정보 DTO 불러오기
	public MemberDTO getDTOById(String user_id) throws Exception {
		System.out.println("MemberService 회원정보 불러오기 user-id : " + user_id);
		return dao.getDTOById(user_id);
	}
	
	// (마이페이지) 회원탈퇴 요청
	public int withdrawal(String user_id) throws Exception {
		System.out.println("MemberService / 회원탈퇴 user_id - " + user_id); 
		return dao.withdrawal(user_id);
	}
	
	// (마이페이지) 회원정보 수정요청
	public int modify(MemberDTO dto) throws Exception {
		System.out.println("MemberService / 회원정보수정 dto - " + dto);
		//return dao.modify(dto);
		int rs = dao.modify(dto);
		System.out.println("service 실행완료");
		return rs;
	}
		
	// (마이페이지) 비밀번호 수정 요청
	public int modifyPassword(String user_id, String password) throws Exception {
		System.out.println("MemberService / 비밀번호수정 id & pw - " + user_id + " & " + password);
		return dao.modifyPassword(user_id, password);
	}
	
}