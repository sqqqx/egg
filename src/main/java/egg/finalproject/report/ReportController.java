package egg.finalproject.report;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egg.finalproject.member.MemberDTO;

@Controller
@RequestMapping("/report")
public class ReportController {
	@Autowired
	private ReportService service;
	@Autowired
	private HttpSession session;
	
	//신고 추가
	@RequestMapping("/insertReport.do")
	@ResponseBody
	public String insertReport(ReportDTO dto) {
		String id = ((MemberDTO)session.getAttribute("loginSession")).getUser_id();
		dto.setUser_id(id);
		if(service.insertReport(dto)) {
			return "success";
		}return "fail";
	}
}
