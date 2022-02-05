package egg.finalproject.member;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import egg.finalproject.utils.EncryptionUtils;
@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private HttpSession session;
	@Autowired
	private JavaMailSender mailSender;
	
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
		String profile_path = "/resources/img/myInfo.png";
		service.insertMember(user_id, password, user_nickname, email, phone, address, profile_path);
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
			System.out.println(dto.getType());
			if(dto.getBlacklist() == 0) {
				if(dto.getType() == 1 || dto.getType() == 2) {
					return "성공";
				}else if(dto.getType() == 0) {
					return "관리자";
				}
			}else {
				return "Y";
			}
		}
		return "실패";
	}
	
	// 로그아웃
	@RequestMapping("/logout")
    public ModelAndView logout() {
        session.removeAttribute("loginSession");
        ModelAndView mv = new ModelAndView("redirect:/");
        return mv;
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
	
	// 휴대전화 중복검사
	@RequestMapping(value="toPhoneCheck.do")
	@ResponseBody
	public String toPhonecheck(String phone) throws Exception {
		if(service.phoneCheckSignup(phone)) {
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
		return service.toIdFind(phone);
	}
	
	// 아이디 찾기 -> 이메일 인증 후 -> 아이디 띄워주기
	@RequestMapping(value="toEmailIdFind.do")
	@ResponseBody
	public String toEmailIdFind(String email) throws Exception {
		return service.toEmailIdFind(email);
	}
	
	// 비밀번호 찾기 페이지로 이동
	@RequestMapping(value="pwFind.do")
	public String pwFind() throws Exception {
		return "user/passwordFind";
	}
	
	// 비밀번호 찾기 완료버튼 클릭
	@RequestMapping(value="toPwfind.do")
	public String toPwFind(String password, String user_id) throws Exception {
		password = EncryptionUtils.getSHA512(password);
		service.toPwFind(password, user_id);
		return "user/login";
	}
	
	// 비밀번호찾기 문자인증
	@RequestMapping(value = "/pwPhoneCheck")
	@ResponseBody
	public String sendPwSMS(String phone, String id) throws Exception { // 휴대폰 문자보내기
		String userPhoneNumber = phone;
		if(service.getPwId(id, phone)) {
			int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000); //난수 생성
			service.certifiedPhoneNumber(userPhoneNumber,randomNumber);
			return Integer.toString(randomNumber);
		}
		return "error";
	}
	
	// 비밀번호 찾기 이메일 인증
		@RequestMapping(value = "/pwMailCheck")
	    @ResponseBody
	    public String pwmailCheckGET(String email, String id) throws Exception{
	        if(service.getPwMailId(id, email)) {
	        	System.out.println("이메일 데이터 전송 확인");
		        System.out.println("인증번호 : " + email);
		        
		        Random random = new Random();
		        int checkNum = random.nextInt(888888) + 111111;
		        System.out.println("인증번호" + checkNum);
		        
		        /* 이메일 보내기 */
		        String setFrom = "jak3995@naver.com";
		        String toMail = email;
		        String title = "능력자들 인증 이메일 입니다.";
		        String content = 
		                "능력자들을 방문해주셔서 감사합니다." +
		                "<br><br>" + 
		                "인증 번호는 " + checkNum + "입니다." + 
		                "<br>" + 
		                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		        try {
		            
		            MimeMessage message = mailSender.createMimeMessage();
		            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		            helper.setFrom(setFrom);
		            helper.setTo(toMail);
		            helper.setSubject(title);
		            helper.setText(content,true);
		            mailSender.send(message);
		            
		        }catch(Exception e) {
		            e.printStackTrace();
		        }
		        String num = Integer.toString(checkNum);
		        return num;
	        }
	        return "error";
	    }
	
	// 문자인증
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000); //난수 생성
		service.certifiedPhoneNumber(userPhoneNumber,randomNumber);
		return Integer.toString(randomNumber);
	}

	// 이메일 인증
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        System.out.println("이메일 데이터 전송 확인");
        System.out.println("인증번호 : " + email);
        
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        System.out.println("인증번호" + checkNum);
        
        /* 이메일 보내기 */
        String setFrom = "jak3995@naver.com";
        String toMail = email;
        String title = "능력자들 인증 이메일 입니다.";
        String content = 
                "능력자들을 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        String num = Integer.toString(checkNum);
        return num;
    }
	
	
	
/////↑↑↑↑↑↑회원가입 및 로그인↑↑↑↑↑↑/////////↓↓↓↓↓↓마이페이지↓↓↓↓↓↓///////////////////////////

	// (마이페이지) 마이페이지 요청
	@RequestMapping("toMyPage")
	public String toMyPage() {
		return "/member/mypage";
	}

	// (마이페이지) 내 정보 페이지 요청
	@RequestMapping("toMyInfo")
	public String toMyInfo(Model model, String user_id) throws Exception {
		System.out.println("MemberController / 내 정보 페이지 요청 user_id - " + user_id);
		MemberDTO dto = service.getDTOById(user_id);
		System.out.println(dto);
		model.addAttribute("dto", dto);
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
	
	// (마이페이지) 회원정보 수정요청
		@RequestMapping(value="/modify.do", produces="application/json;charset=UTF-8")
		@ResponseBody()
		public MemberDTO modify(MemberDTO dto) throws Exception {
			System.out.println("요청 도착");
			System.out.println("MemberController / 회원정보수정 dto - " + dto);
			// 수정
			int rs = service.modify(dto);
			// 수정 후 아이디로 회원정보 조회하여 보내주기
			System.out.println("응답 직전");
			return service.getDTOById(dto.getUser_id());
		}
		
		// (마이페이지) 비밀번호변경 페이지 요청
		@RequestMapping("/toModifyPw")
		public String toModifyPw() {
			return "/member/modifyPassword";
		}
		
		// (마이페이지) 비밀번호 수정 요청
		@RequestMapping(value="/modifyPassword.do", produces="text/html;charset=UTF-8")
		@ResponseBody()
		public String modifyPassword(String id, String pw) throws Exception {
			System.out.println("요청 도착");
			System.out.println("MemberController / 비밀번호수정 id & pw - " + id + " & " + pw);
			if(service.modifyPassword(id, pw) == 1) {
				System.out.println("비밀번호 수정 성공");
				return "success";
			} else {
				System.out.println("비밀번호 수정 실패");
				return "fail";
			}
		}

		// (마이페이지) 프로필 사진 변경
		@RequestMapping(value="/modifyPP.do")
		public String modifyPP(Model model, String user_id, MultipartFile photo) throws Exception {	// ModifyProfilePhoto
			System.out.println("MemberController / 프로필사진변경 photo: " + photo);
			
			// 저장 경로
			String realPath = session.getServletContext().getRealPath("profilePhotos");
			System.out.println("realPath: " + realPath);
			if(service.modifyPP(realPath, user_id, photo) > 0) {
				System.out.println("프로필 사진 변경 성공");
			} else {
				System.out.println("프로필 사진 변경 실패");
			}
			
			// 변경된 dto 불러오기
			MemberDTO dto = service.getDTOById(user_id);
			System.out.println(dto);
			model.addAttribute("dto", dto);
			return "/member/userInformation";
		}
		
		// (마이페이지) 기본 프로필 사진 설정
		@RequestMapping("/defaultPP.do")
		public String defaultPP(Model model, String user_id) throws Exception {
			System.out.println("MemberController / 기본 프로필 사진 설정 - user_id: " + user_id);
			// 기본 프로필 사진명이 myInfo.png라고 할 때
			service.defaultPP(user_id);
			model.addAttribute("dto", service.getDTOById(user_id));
			return "/member/userInformation";
		}
}