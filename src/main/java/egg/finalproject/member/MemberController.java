package egg.finalproject.member;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
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

import edu.emory.mathcs.backport.java.util.Collections;
import egg.finalproject.career.CareerDTO;
import egg.finalproject.career.CareerService;
import egg.finalproject.expert.ExpertDTO;
import egg.finalproject.expert.ExpertService;
import egg.finalproject.expert_category.Expert_categoryService;
import egg.finalproject.order.OrderService;
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
	@Autowired
	private ExpertService expertService;
	@Autowired
	private CareerService careerService;
	@Autowired
	private Expert_categoryService expert_categoryService;
	@Autowired
	private OrderService orderService;
	
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
			String profile_path = "myInfo.png";
			service.insertMember(user_id, password, user_nickname, email, phone, address, profile_path);
			return "user/login";
		}
		
		// 로그인
		@RequestMapping(value="/login.do", produces="text/html;charset=UTF-8")
		@ResponseBody
		public String login(String user_id, String password) throws Exception{
			
			String location = (String) session.getAttribute("location");
			System.out.println("location : " + location);
			
			password = EncryptionUtils.getSHA512(password);
			if(service.isLoginOk(user_id, password)) {
				MemberDTO dto = service.getMember(user_id);
				session.setAttribute("loginSession", dto);
				System.out.println(dto.getType());
				if(dto.getBlacklist() == 0) {
					if(dto.getType() == 1 || dto.getType() == 2 || dto.getType() ==3) {
						return "성공";
					}else if(dto.getType() == 0) {
						return "관리자";
					}
				}else {
					return "Y";
				}
			}else if(service.isEmailLoginOk(user_id, password)) {
				System.out.println(user_id);
				MemberDTO dto = service.getEmailMember(user_id);
				session.setAttribute("loginSession", dto);
				if(dto.getBlacklist() == 0) {
					if(dto.getType() == 1 || dto.getType() == 2 || dto.getType() ==3) {
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
		
		// 아이디 찾기 이메일 인증
		@RequestMapping(value = "/idMailCheck")
	    @ResponseBody
	    public String idMailCheck(String email) throws Exception{
	        if(service.getIdMailcheck(email)) {
	        	System.out.println("이메일 데이터 전송 확인");
		        System.out.println("인증번호 : " + email);
		        
		        Random random = new Random();
		        int checkNum1 = random.nextInt(8888) + 1111;
		        String checkNum = Integer.toString(checkNum1);
		        System.out.println("인증번호" + checkNum);
		        
		        /* 이메일 보내기 */
		        String setFrom = "jak3995@naver.com";
		        String toMail = email;
		        String title = "능력자들 인증 이메일 입니다.";
		        String content = 
		        		"<div class=\"row\" style=\"height : 70px; width: 700px; background-color: #5194e4; text-align: center; border-bottom: 3px solid black;\">" +
		        			
		        			"<div class=\"col\" style=\"height: 70px; width: 150px;\">" +
		            
		        			"</div>" +

					    "</div>" +
					    "<div style=\"height : 300px; width: 700px; text-align: center; background-image: url(https://ak.picdn.net/shutterstock/videos/24047485/thumb/1.jpg);\">" +
					        "<span style=\"font-size: 30px; color: white;\">능력자들 인증 번호입니다.</span>" +
					        
					        "<br><br>" +
					        "<span style=\"color: white;\">인증 번호는 </span>" + "<span style=\"font-size: 15px; color: red;\">" + checkNum.substring(0,1) + " " +"</span>" +
					        "<span style=\"font-size: 15px; color: black;\">" + " " + checkNum.substring(1,2) + " " + "</span>" +
					        "<span style=\"font-size: 15px; color: red;\">" + " " + checkNum.substring(2,3) + " " + "</span>" +
					        "<span style=\"font-size: 15px; color: black;\">" + " " + checkNum.substring(3) + "</span>" + "<span style=\"color: white;\"> 입니다.</span>" +
					        "<br><br>" +
					        "<span style=\"color: white;\">해당 인증번호를 인증번호 확인란에 기입하여 주세요.</span>" +
					        "<br><br>" +
					        "<span style=\"color: white;\">저희 능력자들을 이용해 주셔서 감사합니다.</span>" +
					        "<br><br>" +
					        "<span style=\"color: white;\">화이팅!!</span>" +
					    "</div>" +
					    "<div style=\"height : 100px; width: 700px; background-color: #5194e4; border-top: 3px solid black;\">" +
					    "<footer>" +
					        "<div>" +
					                "<span style=\"color: white;\">(주)능력자들</span> <span style=\"color: white;\">  |  </span>" +
					                "<span style=\"color: white;\">대표 : 류호진</span> <span style=\"color: white;\">  |  </span>" +
					                "<span style=\"color: white;\">사업자등록번호 : 421-22-00218</span>" +
					                "<p style=\"color: white;\">주소 : 올림픽로 92길 40-3 3층 (주)능력자들</p>" +
					            "</divlass=>" +
					        "</footer>" +
					    "</div>";
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
		        String num = checkNum;
		        return num;
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
			        int checkNum1 = random.nextInt(8888) + 1111;
			        String checkNum = Integer.toString(checkNum1);
			        System.out.println("인증번호" + checkNum);
			        
			        /* 이메일 보내기 */
			        String setFrom = "jak3995@naver.com";
			        String toMail = email;
			        String title = "능력자들 인증 이메일 입니다.";
			        String content = 
			        		"<div class=\"row\" style=\"height : 70px; width: 700px; background-color: #5194e4; text-align: center; border-bottom: 3px solid black;\">" +
			        			
			        			"<div class=\"col\" style=\"height: 70px; width: 150px;\">" +
			            
			        			"</div>" +

						    "</div>" +
						    "<div style=\"height : 300px; width: 700px; text-align: center; background-image: url(https://ak.picdn.net/shutterstock/videos/24047485/thumb/1.jpg);\">" +
						        "<span style=\"font-size: 30px; color: white;\">능력자들 인증 번호입니다.</span>" +
						        
						        "<br><br>" +
						        "<span style=\"color: white;\">인증 번호는 </span>" + "<span style=\"font-size: 15px; color: red;\">" + checkNum.substring(0,1) + " " +"</span>" +
						        "<span style=\"font-size: 15px; color: black;\">" + " " + checkNum.substring(1,2) + " " + "</span>" +
						        "<span style=\"font-size: 15px; color: red;\">" + " " + checkNum.substring(2,3) + " " + "</span>" +
						        "<span style=\"font-size: 15px; color: black;\">" + " " + checkNum.substring(3) + "</span>" + "<span style=\"color: white;\"> 입니다.</span>" +
						        "<br><br>" +
						        "<span style=\"color: white;\">해당 인증번호를 인증번호 확인란에 기입하여 주세요.</span>" +
						        "<br><br>" +
						        "<span style=\"color: white;\">저희 능력자들을 이용해 주셔서 감사합니다.</span>" +
						        "<br><br>" +
						        "<span style=\"color: white;\">화이팅!!</span>" +
						    "</div>" +
						    "<div style=\"height : 100px; width: 700px; background-color: #5194e4; border-top: 3px solid black;\">" +
						    "<footer>" +
						        "<div>" +
						                "<span style=\"color: white;\">(주)능력자들</span> <span style=\"color: white;\">  |  </span>" +
						                "<span style=\"color: white;\">대표 : 류호진</span> <span style=\"color: white;\">  |  </span>" +
						                "<span style=\"color: white;\">사업자등록번호 : 421-22-00218</span>" +
						                "<p style=\"color: white;\">주소 : 올림픽로 92길 40-3 3층 (주)능력자들</p>" +
						            "</divlass=>" +
						        "</footer>" +
						    "</div>";
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
			        String num = checkNum;
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
		
		// 문자인증
		@RequestMapping(value = "/idPhoneCheck", method = RequestMethod.GET)
		@ResponseBody
		public String idsendSMS(@RequestParam("phone") String userPhoneNumber) throws Exception { // 휴대폰 문자보내기
			if(service.insendSMS(userPhoneNumber)) {
				int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000); //난수 생성
				service.certifiedPhoneNumber(userPhoneNumber,randomNumber);
				return Integer.toString(randomNumber);
			}
			return "error";
		}

		// 회원가입 이메일 인증
		@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	    @ResponseBody
	    public String mailCheckGET(String email) throws Exception{
	        
	        System.out.println("이메일 데이터 전송 확인");
	        System.out.println("인증번호 : " + email);
	        
	        Random random = new Random();
	        int checkNum1 = random.nextInt(8888) + 1111;
	        String checkNum = Integer.toString(checkNum1);
	        System.out.println("인증번호" + checkNum);
	        
	        /* 이메일 보내기 */
	        String setFrom = "jak3995@naver.com";
	        String toMail = email;
	        String title = "능력자들 인증 이메일 입니다.";
	        String content = 
	        		"<div class=\"row\" style=\"height : 70px; width: 700px; background-color: #5194e4; text-align: center; border-bottom: 3px solid black;\">" +
	        			
	        			"<div class=\"col\" style=\"height: 70px; width: 150px;\">" +
	            
	        			"</div>" +

				    "</div>" +
				    "<div style=\"height : 300px; width: 700px; text-align: center; background-image: url(https://ak.picdn.net/shutterstock/videos/24047485/thumb/1.jpg);\">" +
				        "<span style=\"font-size: 30px; color: white;\">능력자들 인증 번호입니다.</span>" +
				        
				        "<br><br>" +
				        "<span style=\"color: white;\">인증 번호는 </span>" + "<span style=\"font-size: 15px; color: red;\">" + checkNum.substring(0,1) + " " +"</span>" +
				        "<span style=\"font-size: 15px; color: black;\">" + " " + checkNum.substring(1,2) + " " + "</span>" +
				        "<span style=\"font-size: 15px; color: red;\">" + " " + checkNum.substring(2,3) + " " + "</span>" +
				        "<span style=\"font-size: 15px; color: black;\">" + " " + checkNum.substring(3) + "</span>" + "<span style=\"color: white;\"> 입니다.</span>" +
				        "<br><br>" +
				        "<span style=\"color: white;\">해당 인증번호를 인증번호 확인란에 기입하여 주세요.</span>" +
				        "<br><br>" +
				        "<span style=\"color: white;\">저희 능력자들을 이용해 주셔서 감사합니다.</span>" +
				        "<br><br>" +
				        "<span style=\"color: white;\">화이팅!!</span>" +
				    "</div>" +
				    "<div style=\"height : 100px; width: 700px; background-color: #5194e4; border-top: 3px solid black;\">" +
				    "<footer>" +
				        "<div>" +
				                "<span style=\"color: white;\">(주)능력자들</span> <span style=\"color: white;\">  |  </span>" +
				                "<span style=\"color: white;\">대표 : 류호진</span> <span style=\"color: white;\">  |  </span>" +
				                "<span style=\"color: white;\">사업자등록번호 : 421-22-00218</span>" +
				                "<p style=\"color: white;\">주소 : 올림픽로 92길 40-3 3층 (주)능력자들</p>" +
				            "</divlass=>" +
				        "</footer>" +
				    "</div>";
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
	        String num = checkNum;
	        return num;
	    }
	
	
	
/////↑↑↑↑↑↑회원가입 및 로그인↑↑↑↑↑↑/////////↓↓↓↓↓↓마이페이지↓↓↓↓↓↓///////////////////////////

	// (마이페이지) 마이페이지 요청
	@RequestMapping("/toMyPage")
	public String toMyPage(Model model) throws Exception {
		System.out.println("MemberController / 마이페이지 요청");
		MemberDTO dto = service.getDTOById(((MemberDTO)session.getAttribute("loginSession")).getUser_id());
		System.out.println(dto);
		model.addAttribute("dto", dto);
		if(dto.getType() == 2) {
			ExpertDTO eDTO = expertService.getExpertDTO(((MemberDTO)session.getAttribute("loginSession")).getUser_id());
			long l = eDTO.getPoint();	// int 범위 초과 방지
			String point = NumberFormat.getNumberInstance(Locale.US).format(l);
			System.out.println(point);
			model.addAttribute("point", point);
		}
		return "member/mypage";
	}

	// (마이페이지) 내 정보 페이지 요청
	@RequestMapping("/toMyInfo")
	public String toMyInfo(Model model, String user_id) throws Exception {
		System.out.println("MemberController / 내 정보 페이지 요청 user_id - " + user_id);
		MemberDTO dto = service.getDTOById(user_id);
		System.out.println(dto);
		model.addAttribute("dto", dto);
		return "member/myInfo";
	}

	// (마이페이지) 회원정보조회 페이지 요청
	@RequestMapping("/toUserInformation")
	public String toUserInformation(Model model, String user_id) throws Exception {
		System.out.println("MemberController / 회원정보조회 user_id - " + user_id);
		MemberDTO dto = service.getDTOById(user_id);
		System.out.println(dto);
		model.addAttribute("dto", dto);
		return "member/userInformation";
	}

	// (마이페이지) 회원탈퇴 요청
	@RequestMapping("/withdrawal.do")
	public String widthdrawal(String user_id) throws Exception {
		System.out.println("MemberController / 회원탈퇴 user_id - " + user_id);
		service.withdrawal(user_id);
		return "home";
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
			return "member/modifyPassword";
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
			return "member/userInformation";
		}
		
		// (마이페이지) 기본 프로필 사진 설정
		@RequestMapping("/defaultPP.do")
		public String defaultPP(Model model, String user_id) throws Exception {
			System.out.println("MemberController / 기본 프로필 사진 설정 - user_id: " + user_id);
			// 기본 프로필 사진명이 myInfo.png라고 할 때
			service.defaultPP(user_id);
			model.addAttribute("dto", service.getDTOById(user_id));
			return "member/userInformation";
		}
		
		// (마이페이지) 능력자 페이지 요청
		@RequestMapping("/toConvertExpert")
		public String toConvertExpert(Model model) throws Exception {
			String user_id = ((MemberDTO)session.getAttribute("loginSession")).getUser_id();
			System.out.println("MemberController / 능력자 페이지 요청 user_id - " + user_id);
			MemberDTO dto = service.getDTOById(user_id);
			System.out.println(dto);
			model.addAttribute("dto", dto);
			return "member/convertExpert";
		}
		
		// (마이페이지) 능력자 전환신청
		@RequestMapping("/convertExpert.do")
		public String convertExpert(ExpertDTO eDTO, String[] categoryNumbers, MultipartFile[] careerFiles) throws Exception {
			System.out.println("MemberController / 능력자 전환신청 - dto: " + eDTO);
			ArrayList<Integer> cnList = new ArrayList<>();	// 카테고리 리스트
			for(String c : categoryNumbers) {
				cnList.add(Integer.parseInt(c));
			}
			
			for(int n : cnList) {
				System.out.println("번호 출력: " + n);
			}
			System.out.println("카테고리 번호들:" + cnList.toString());
			for(MultipartFile file : careerFiles) {
				System.out.println("증명파일: " + file.getOriginalFilename());
			}

			/* 필요한 데이터 */
			// expert_id - OK
			// active_area - OK
			// introduction - OK
			// category_no - OK
			// career (파일) - OK
			
			/* tbl_expert, tbl_career, tbl_category에 DB저장 */
			// tbl_expert에 DB 추가
			if(expertService.insertExpert(eDTO) > 0) {
				System.out.println("능력자 테이블 추가 성공");
			} else {
				System.out.println("능력자 테이블 추가 실패");
			}
			// tbl_career에 DB 추가
				// 저장 경로
				String realPath = session.getServletContext().getRealPath("careerFiles");
				System.out.println("증명파일 realPath: " + realPath);
				for(int i = 0; i < careerFiles.length; i++) {
					if(careerService.insertCareer(realPath, eDTO.getExpert_id(), careerFiles[i], cnList.get(i)) > 0) {
						System.out.println(i + "번 증명파일 저장 성공");
					} else {
						System.out.println(i + "번 증명파일 저장 실패");
					}
				}
			// tbl_expert_category에 DB 추가
				for(int cn : cnList) {
					if(expert_categoryService.insertExpertCN(eDTO.getExpert_id(), cn) > 0) {
						System.out.println("전문가 카테고리 번호 추가 성공");
					} else {
						System.out.println("전문가 카테고리 번호 추가 실패");
					}
				}
			// 멤버 type 수정
				if(service.modifyType(eDTO.getExpert_id()) > 0) {
					System.out.println("회원 타입 3으로 수정 성공");
				} else {
					System.out.println("회원 타입 수정 실패");
				}
			return "redirect:/member/toUserInformation?user_id="+eDTO.getExpert_id();
		}
		
		// (마이페이지) 능력자 정보 확인
		@RequestMapping("/toViewExpertInfo")
		public String toViewExpertInfo(Model model, String expert_id) throws Exception {
			System.out.println("MemberController / 능력자 정보 확인 - user_id: " + expert_id);
			MemberDTO dto = service.getDTOById(expert_id);
			System.out.println(dto);
			model.addAttribute("dto", dto);
			
			// tbl_expert 정보 가져오기
			ExpertDTO eDTO = expertService.getExpertDTO(expert_id);
			model.addAttribute("eDTO", eDTO);
			System.out.println("능력자 정보: " + eDTO);
			// tbl_career 정보 가져오기
			List<CareerDTO> careerList = careerService.getCareerList(expert_id);
			model.addAttribute("careerList", careerList);
			System.out.println("능력자 증명: " + careerList.toString());
			// tbl_expert_category 정보 가져오기
//			List<String> categoryList = expert_categoryService.getCateList(expert_id);
//			model.addAttribute("categoryList", categoryList);
//			System.out.println("능력자 카테고리: " + categoryList);
			Map<String, Object> map = expert_categoryService.getCateList(expert_id);
			model.addAttribute("categoryList", map.get("categoryList"));
			model.addAttribute("cn", map.get("categoryNo"));
			System.out.println("능력자 카테고리: " + map.get("categoryList"));
			System.out.println("능력자 카테고리 번호: " + map.get("categoryNo"));
			
			return "member/viewExpertInfo";
		}
		
		// (마이페이지) 능력자 정보 수정
		@RequestMapping("/modifyExpert.do")
		public String modifyExpert(ExpertDTO eDTO, String[] categoryNumbers, MultipartFile[] careerFiles) throws Exception {
			System.out.println("MemberController / 능력자 정보수정 신청 - dto: " + eDTO);
			ArrayList<Integer> cnList = new ArrayList<>();	// 카테고리 리스트
			if(categoryNumbers != null) {
				for(String c : categoryNumbers) {
					cnList.add(Integer.parseInt(c));
				}
				cnList.sort(Comparator.naturalOrder());
				System.out.println("카테고리 번호들:" + cnList.toString());
			}
			
			// <input type="file">에 아무것도 안담아 보내면 null이 아니라 size가 0인 데이터가 담겨져 온다.
			int fileSize = 0;
			if(careerFiles != null) {
				System.out.println("증명파일 개수: " + careerFiles.length);
				for(MultipartFile file : careerFiles) {
					fileSize += file.getSize();
//					System.out.println("증명파일정보: " + file);
//					if(file.getSize() != 0) {
//						System.out.println("증명파일: " + file.getOriginalFilename());
//					} else {
//						System.out.println("증명파일 사이즈 0");
//					}
				}
			} else {
				System.out.println("증명파일이 없습니다.");
			}
			if(fileSize == 0) {
				return null;
			}
			

			/* 필요한 데이터 */
			// expert_id - OK
			// active_area - OK
			// introduction - OK
			// category_no - OK
			// career (파일) - OK
			
			/* tbl_expert, tbl_career, tbl_category에 DB저장 */
			// tbl_expert에 DB 수정
			if(expertService.modifyExpert(eDTO) > 0) {
				System.out.println("능력자 테이블 수정 성공");
			} else {
				System.out.println("능력자 테이블 수정 실패");
			}
			// tbl_career에 DB 수정
				// 저장 경로
				String realPath = session.getServletContext().getRealPath("careerFiles");
				System.out.println("증명파일 realPath: " + realPath);
				careerService.deleteCareer(eDTO.getExpert_id());	// 증명파일 전부 삭제
				System.out.println("증명파일 전부 삭제");
				for(int i = 0; i < careerFiles.length; i++) {
					if(careerFiles[i].getSize() != 0) {	// 개별 파일이 비어있지 않다면
						if(careerService.insertCareer(realPath, eDTO.getExpert_id(), careerFiles[i], cnList.get(i)) > 0) {
							System.out.println(i + "번 증명파일 저장 성공");
						} else {
							System.out.println(i + "번 증명파일 저장 실패");
						}
					}
				}
				
				
			// tbl_expert_category에 DB 추가
				expert_categoryService.deleteExpertCN(eDTO.getExpert_id());	// 카테고리 정보 삭제
				System.out.println("전문가 카테고리 정보 삭제");
				for(int cn : cnList) {
					if(expert_categoryService.insertExpertCN(eDTO.getExpert_id(), cn) > 0) {
						System.out.println("전문가 카테고리 번호 추가 성공");
					} else {
						System.out.println("전문가 카테고리 번호 추가 실패");
					}
				}
//			// 멤버 type 수정
//				if(service.modifyType(eDTO.getExpert_id()) > 0) {
//					System.out.println("회원 타입 3으로 수정 성공");
//				} else {
//					System.out.println("회원 타입 수정 실패");
//				}
			return "redirect:/member/toUserInformation?user_id="+eDTO.getExpert_id();
		}
}
