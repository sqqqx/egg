package egg.finalproject.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egg.finalproject.member.MemberDTO;

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
		return "redirect:/admin/getMemberList?currentIdx="+1;
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
	
	// 회원 목록 가져오기
	@RequestMapping("/getMemberList")
	public String getMemberList(Model model, String searchOption, String searchKeyword, int currentIdx) throws Exception {
		System.out.println("searchOption : " + searchOption + " : " + "searchKeyword : " + searchKeyword + " : " + "currentIdx : " + currentIdx);
		model.addAttribute("list", service.getMemberList(searchOption, searchKeyword, currentIdx));
		model.addAttribute("map", service.getNavi(currentIdx));
		return "admin/memberManagement"; 
	}
	
	// 회원 강제 탈퇴
	@RequestMapping("/memberExpulsion")
	public String memberExpulsion(String[] userCheckBox) throws Exception {
		service.memberExpulsion(userCheckBox);
		return "redirect:/admin/toMemberManagement";
	}
	
	// 블랙리스트 ON / OFF
	@RequestMapping("/memberBlackList")
	public String memberBlackList(String[] userCheckBox, int idx) throws Exception {
		service.memberBlackList(userCheckBox, idx);
		return "redirect:/admin/toMemberManagement";
	}

}
