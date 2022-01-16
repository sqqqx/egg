package egg.finalproject.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminMemberService service;
	
	/********** 페이지 이동 **********/
	
	// 관리자 페이지 이동(임시)
	@RequestMapping("/toAdmin")
	public String toAdmin() throws Exception {
		return "admin/adminMain";
	}
	
	// 회원 관리 페이지 이동
	@RequestMapping("/toMemberManagement")
	public String toMemberManagement() throws Exception {
		return "redirect:/admin/memberSelectAll";
	}
	
	// 게시글 관리 페이지 이동
	@RequestMapping("/toPostManagement")
	public String toPostManagement() throws Exception {
		return "admin/postManagement";
	}
	
	// 신고 관리 페이지 이동
	@RequestMapping("/toReportManagement")
	public String toReportManagement() throws Exception {
		return "admin/reportManagement";
	}
	
	/********** 회원 관리 **********/
	
	// 전체 회원 가져오기
	@RequestMapping("/memberSelectAll")
	public String memberSelectAll(Model model) throws Exception {
		model.addAttribute("list", service.memberSelectAll());
		return "admin/memberManagement";
	}
	
	// 회원 아이디, 닉네임, 이메일로 검색
	@RequestMapping("/memberSearch")
	public String memberSearch(Model model, String searchOption, String searchKeyword) throws Exception {
		model.addAttribute("list", service.memberSearch(searchOption, searchKeyword));
		return "admin/memberManagement"; 
	}
	
	// 회원 강제 탈퇴
	@RequestMapping("/memberExpulsion")
	public String memberExpulsion(String[] userList) throws Exception {
		service.memberExpulsion(userList);
		return "redirect:/admin/memberSelectAll";
	}
	
	// 회원 블랙리스트 등록
	@RequestMapping("/memberBlacklistRegist")
	public String memberBlacklistRegist(String[] userList) throws Exception {
		service.memberBlacklistRegist(userList);
		return "redirect:/admin/memberSelectAll";
	}
	
	// test
	@RequestMapping("/test")
	public String test() throws Exception {
		service.test();
		return "/";
	}

}
