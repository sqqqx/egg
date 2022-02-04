package egg.finalproject.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService service;
	
	@RequestMapping("/toLab")
	public String toLab() throws Exception {
		return "redirect:/admin/getUserCount.do";
	}
	
	// 관리자 홈 이동
	@RequestMapping("/toAdminMain")
	public String toAdminMain() throws Exception {
		//return "admin/adminMain";
		return "redirect:/admin/toMemberManagement";
	}
	
	// 회원 관리 페이지 이동
	@RequestMapping("/toMemberManagement")
	public String toMemberManagement() throws Exception {
		return "redirect:/admin/getMemberList.do?currentIdx=1&userType=9";
	}
	
	// 회원 정보 수정 
	@RequestMapping("toUserInfomation")
	public String toUserInfomation(String user_id) throws Exception {
		return "redirect:/member/toUserInformation?user_id="+user_id;
	}
	
	// 회원 목록 가져오기
	@RequestMapping("/getMemberList.do")
	public String getMemberList(Model model, String searchOption, String searchKeyword, int currentIdx, int userType) throws Exception {
		model.addAttribute("list", service.getMemberList(searchOption, searchKeyword, currentIdx, userType));
		model.addAttribute("map", service.getNavi(currentIdx));
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("userType", userType);
		return "admin/memberManagement"; 
	}
	
	// 회원 강제 탈퇴
	@RequestMapping("/memberExpulsion.do")
	public String memberExpulsion(String[] userCheckBox) throws Exception {
		service.memberExpulsion(userCheckBox);
		return "redirect:/admin/toMemberManagement";
	}
	
	// 블랙리스트 ON / OFF
	@RequestMapping("/memberBlackList.do")
	public String memberBlackList(String[] userCheckBox, int idx) throws Exception {
		service.memberBlackList(userCheckBox, idx);
		return "redirect:/admin/toMemberManagement";
	}
	
	// 피신고자 블랙리스트 추가
	@RequestMapping("/addBlackList.do")
	@ResponseBody
	public boolean addBlackList(String type, String target_no, String report_no) throws Exception {
		return service.addBlackList(type, target_no);
	}
	
	// 일별 가입자 수
	@RequestMapping("/getUserCount.do")
	public String getUserCount(Model model) throws Exception {
		String json = service.getUserCount();
		System.out.println(json);
		model.addAttribute("json", json);
		return "admin/adminMain";
	}

}
