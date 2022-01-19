package egg.finalproject.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
<<<<<<< HEAD

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService service;

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
//	@RequestMapping(value="signup.do")
//	public String toSignup() throws Exception {
//		
//	}
	
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
=======
>>>>>>> dbc477f55c0adcb707121b1b3c555aa3616cc455


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
	public String signup(MemberDTO dto) throws Exception {
		service.insertMember(dto);
		System.out.println(dto.getAddress());
		System.out.println(dto.getUser_id());
		System.out.println(dto.getPhone());
		
		return "user/login";
	}
	
	@RequestMapping(value="/login.do", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String login(String user_id, String password) throws Exception{
		if(service.isLoginOk(user_id, password)) {
			MemberDTO dto = service.getMember(user_id); 
			session.setAttribute("loginSession", dto);
			return "성공";
		}else {
			return "실패";
		}
	}
	
}