package egg.finalproject.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminPostController {
	
	@Autowired
	private AdminPostService service;
	
	@RequestMapping("toPostManagement")
	public String toPostManagement() throws Exception {
		return "redirect:/admin/getPostList.do?currentIdx=1";
	}
	
	// 게시글 목록 가져오기
	@RequestMapping("getPostList.do")
	public String getPostList(Model model, int currentIdx, String searchOption, String searchKeyword) throws Exception {
		model.addAttribute("list", service.getPostList(currentIdx, searchOption, searchKeyword));
		model.addAttribute("map", service.getNavi(currentIdx));
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchKeyword", searchKeyword);
		return "admin/postManagement";
	}

}
