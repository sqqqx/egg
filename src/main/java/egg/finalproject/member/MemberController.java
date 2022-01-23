package egg.finalproject.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egg.finalproject.utils.EncryptionUtils;
@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private HttpSession session;
	
	// 아이디 중복검사
	@RequestMapping(value="toIdCheck.do")
	@ResponseBody
	public String toIdcheck(String id) throws Exception {
		System.out.println("id : " + id);
		if(service.idCheck(id)) {
			return "available";
		}else {
			return "unavailable";
		}
	}
	
	// 가입완료
	@RequestMapping(value="signup.do")
	public String signup(String user_id, String password, String user_nickname, String email, String phone, String address) throws Exception {
		password = EncryptionUtils.getSHA512(password);
		service.insertMember(user_id, password, user_nickname, email, phone, address);
		return "user/login";
	}
	
	// 로그인
	@RequestMapping(value="/login.do", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String login(String user_id, String password) throws Exception{
		password = EncryptionUtils.getSHA512(password);
		if(service.isLoginOk(user_id, password)) {
			MemberDTO dto = service.getMember(user_id); 
			session.setAttribute("loginSession", dto);
			return "성공";
		}else {
			return "실패";
		}
	}
	
	// 닉네임 중복검사
	@RequestMapping(value="toNicknameCheck.do")
	@ResponseBody
	public String toNicknamecheck(String nickname) throws Exception {
		if(service.nicknameCheck(nickname)) {
			return "available";
		}else {
			return "unavailable";
		}
	}
	
	// 이메일 중복검사
	@RequestMapping(value="toEmailCheck.do")
	@ResponseBody
	public String toEmailcheck(String email) throws Exception {
		if(service.emailCheck(email)) {
			return "available";
		}else {
			return "unavailable";
		}
	}
	
	// 아이디 찾기 페이지로 이동
	@RequestMapping(value="idFind.do")
	public String idFind() throws Exception {
		return "user/idFind";
	}
	
	// 아이디 찾기 -> 핸드폰 인증 후 -> 아이디 띄워주기
	@RequestMapping(value="toIdFind.do")
	@ResponseBody
	public String toIdFind(String phone) throws Exception {
		System.out.println(phone);
		System.out.println(service.toIdFind(phone));
		return service.toIdFind(phone);
	}
	
	// 문자인증
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000); //난수 생성
		service.certifiedPhoneNumber(userPhoneNumber,randomNumber);
		return Integer.toString(randomNumber);
	}

	
/////↑↑↑↑↑↑회원가입 및 로그인↑↑↑↑↑↑/////////↓↓↓↓↓↓마이페이지↓↓↓↓↓↓/////////////////////////////

	// (마이페이지) 마이페이지 요청
	@RequestMapping("toMyPage")
	public String toMyPage() {
		return "/member/mypage";
	}

	// (마이페이지) 내 정보 페이지 요청
	@RequestMapping("toMyInfo")
	public String toMyInfo() {
		return "/member/myInfo";
	}

	// (마이페이지) 회원정보조회 페이지 요청
	@RequestMapping("toUserInformation")
	public String toUserInformation(Model model, String user_id) throws Exception {
		System.out.println("MemberController / 회원정보조회 user_id - " + user_id);
		MemberDTO dto = service.getDTOById(user_id);
		System.out.println(dto);
		model.addAttribute("dto", dto);
		return "/member/userInformation";
	}

	// (마이페이지) 회원탈퇴 요청
	@RequestMapping("withdrawal.do")
	public String widthdrawal(String user_id) throws Exception {
		System.out.println("MemberController / 회원탈퇴 user_id - " + user_id);
		service.withdrawal(user_id);
		return "/home";
	}
	
}