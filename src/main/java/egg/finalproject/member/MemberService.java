package egg.finalproject.member;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	
	// Email 로그인
	public boolean isEmailLoginOk(String user_id, String password) throws Exception {
		if(dao.isEmailLoginOk(user_id, password) == 1) {
			return true;
		}else {
			return false;
		}
	}
	
	// Email로그인 세션에 담기
	public MemberDTO getEmailMember(String user_id) throws Exception{
		return dao.getEmailMember(user_id);
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
		if(dao.emailCheck(email) >= 1) { 
			return false;
		}else {
			return true;
		}
	}
	
	// 휴대전화 중복검사
	public boolean phoneCheckSignup(String phone) throws Exception{
		if(dao.phoneCheckSignup(phone) >= 1) { 
			return false;
		}else {
			return true;
		}
	}
	
	// 아이디찾기 이메일 아이디 여부 체크
	public boolean getIdMailcheck(String email) throws Exception{
		if(dao.getIdMailcheck(email) == 1) {
			return true;
		}else {
			return false;
		}
	}
	
	// 아이디찾기 휴대전화 아이디 여부 체크
	public boolean insendSMS(String userPhoneNumber) throws Exception{
		if(dao.insendSMS(userPhoneNumber) == 1) {
			return true;
		}else {
			return false;
		}
	}
	
	// 아이디 찾기
	public String toIdFind(String phone) throws Exception {
		return dao.toIdFind(phone);
	}
	
	// 이메일 아이디 찾기
	public String toEmailIdFind(String email) throws Exception {
		return dao.toEmailIdFind(email);
	}
	
	// 비밀번호 찾기 핸드폰번호 아이디 일치 확인
	public boolean getPwId(String id, String phone) throws Exception{
		if (dao.getPwId(id, phone) == 1) {
			return true;
		}else {
			return false;
		}
	}
	
	// 비밀번호 찾기 이메일 아이디 일치 확인
		public boolean getPwMailId(String id, String email) throws Exception{
			if (dao.getPwMailId(id, email) == 1) {
				return true;
			}else {
				return false;
			}
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
		int rs = dao.modify(dto);
		System.out.println("service 실행완료");
		return rs;
	}
		
	// (마이페이지) 비밀번호 수정 요청
	public int modifyPassword(String user_id, String password) throws Exception {
		System.out.println("MemberService / 비밀번호수정 id & pw - " + user_id + " & " + password);
		return dao.modifyPassword(user_id, password);
	}
	
	// (마이페이지) 휴대전화 중복검사
	public boolean phoneCheck(String phone) throws Exception {
		System.out.println("MemberService / 휴대전화 중복검사 phone - " + phone);
		return dao.phoneCheck(phone);
	}
	
	// (마이페이지) 프로필 사진 변경
	public int modifyPP(String realPath, String user_id, MultipartFile photo) throws Exception {
		System.out.println("MemberService / 프로필 사진 변경 - realPath: " + realPath + " / user_id: " + user_id + " / photo: " + photo);
		// 해당 경로가 있는지 확인
		File realPathPhoto = new File(realPath);
		if(!realPathPhoto.exists()) {	// 만약 경로가 존재하지 않으면 경로 생성
			realPathPhoto.mkdir();
		}
		
		// 1. 클라이언트로부터 넘어 온 파일유무 확인
		// 2. 지금 넘어 온 파일의 ori_name 얻어오기
		// 3. 넘어 온 파일을 서버에 저장할 때 저정할 이름(sys_name)만들기
		// 4. sys_name을 이용해 경로에 실제로 저장하기
		if(!photo.isEmpty()) {	// 사진파일이 비어 있지 않다면
			// 클라이언트가 업로드 한 원본 파일명
			String ori_name = photo.getOriginalFilename();
			System.out.println("원본파일명: " + ori_name);
			
			// 서버에 저장할 파일명
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HH.mm");
			String sys_name = user_id + "_" + sdf.format(System.currentTimeMillis()) + "_" + ori_name;
			System.out.println("서버에 저장할 파일명: " + sys_name);
			String profile_path = realPath + File.separator + sys_name;
			// 파일을 서버에 저장
			photo.transferTo(new File(profile_path));
			return dao.modifyPP(user_id, sys_name);
		} else {
			return -1;
		}
	}
	
	// (마이페이지) 기본 프로필 사진 설정
	public int defaultPP(String user_id) throws Exception {
		System.out.println("MemberService / 기본 프로필 사진 설정 - user_id: " + user_id);
		return dao.defaultPP(user_id);
	}	
	
	// (마이페이지) 회원 타입 수정
	public int modifyType(String user_id) throws Exception {
		System.out.println("MemberService / 회원 타입 수정 - 아이디: " + user_id);
		return dao.modifyType(user_id);
	}
}