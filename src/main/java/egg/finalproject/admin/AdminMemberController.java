package egg.finalproject.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService service;
	
	// 관리자 페이지 이동(임시)
	@RequestMapping("/toAdminMain")
	public String toAdminMain() throws Exception {
		return "admin/adminMain";
	}
	
	// 회원 관리 페이지 이동
	@RequestMapping("/toMemberManagement")
	public String toMemberManagement() throws Exception {
		return "redirect:/admin/getMemberList?currentIdx="+1;
	}
	
	// 회원 목록 가져오기
	@RequestMapping("/getMemberList")
	public String getMemberList(Model model, String searchOption, String searchKeyword, int currentIdx, String key) throws Exception {
		System.out.println("searchOption : " + searchOption + " : " + "searchKeyword : " + searchKeyword + " : " + "currentIdx : " + currentIdx + " : " + "key : " + key);
		model.addAttribute("list", service.getMemberList(searchOption, searchKeyword, currentIdx, key));
		model.addAttribute("map", service.getNavi(currentIdx));
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchKeyword", searchKeyword);
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
