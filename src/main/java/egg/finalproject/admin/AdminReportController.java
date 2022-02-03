package egg.finalproject.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminReportController {
	
	@Autowired
	private AdminReportService service;
	
	// 신고 페이지 이동
	@RequestMapping("/toReportManagement")
	public String toReportManagement() throws Exception {
		return "redirect:/admin/getReportList.do?currentIdx=1&type=9";
	}
	
	// 신고 상세 페이지 이동
	@RequestMapping("/getReportDetail")
	public String toUserInfomation(Model model, String report_no, String type) throws Exception {
		model.addAttribute("map", service.getReportDetail(report_no, type));
		return "admin/reportDetail";
	}
	
	// 신고 목록 가져오기 
	@RequestMapping("/getReportList.do")
	public String getReportList(Model model, String searchOption, String searchKeyword, int currentIdx, String type) throws Exception {
		model.addAttribute("list", service.getReportList(searchOption, searchKeyword, currentIdx, type));
		model.addAttribute("map", service.getNavi(currentIdx));
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("type", type);
		return "admin/reportManagement";
	}
	
	// 신고 처리 상태 변경
	@RequestMapping("/changeReportStatus")
	public String changeReportStatus(String report_no) throws Exception {
		service.changeReportStatus(report_no);
		return "redirect:/admin/toReportManagement";
	}

}
