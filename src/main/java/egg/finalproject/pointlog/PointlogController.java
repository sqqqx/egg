package egg.finalproject.pointlog;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.emory.mathcs.backport.java.util.Arrays;
import egg.finalproject.member.MemberDTO;
import egg.finalproject.member.MemberService;

@Controller
@RequestMapping("/pointlog")
public class PointlogController {
	@Autowired
	private PointlogService service;
	@Autowired
	private MemberService memberService;
	
	// (마이페이지) 포인트 충전내역 페이지 요청
	@RequestMapping("/toViewPoint")
	public String toViewPoint(Model model, String user_id) throws Exception {
		System.out.println("MemberController / 포인트 충전내역 페이지 요청 - user_id: " + user_id);
		// tbl_pointLog에서 충전 내역 가져오기
		List<PointlogDTO> pointLog = service.getLogById(user_id);
		System.out.println("충전페이지로 보내기 전 pointLog: " + pointLog.toString());
		model.addAttribute("pointLog", pointLog);
		return "member/viewPoint";
	}
	
	// (마이페이지) 충전 페이지 요청
	@RequestMapping("/toChargePage")
	public String toChargePage(Model model, String user_id) throws Exception {
		System.out.println("PointlogController / 충전 페이지 요청 - user_id: " + user_id);
		MemberDTO dto = memberService.getDTOById(user_id);
		model.addAttribute("dto", dto);
		return "member/chargePoint";
	}


}
