package egg.finalproject.admin;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminPostController {
	
	@Autowired
	private AdminPostService service;
	
	// 게시글 관리 첫 화면
	@RequestMapping("toPostManagement")
	public String toPostManagement() throws Exception {
		return "redirect:/admin/getPostList.do?currentIdx=1&type=1";
	}
	
	// 글 목록 가져오기
	@RequestMapping("getPostList.do")
	public String getPostList(Model model, int currentIdx, String searchOption, String searchKeyword, String type) throws Exception {
		model.addAttribute("list", service.getPostList(currentIdx, searchOption, searchKeyword, type));
		model.addAttribute("map", service.getNavi(currentIdx));
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("type", type);
		return "admin/postManagement";
	}
	
	// 게시글 상세페이지 이동
	@RequestMapping("toPostDetail")
	public String toPostDetail(String post_no) throws Exception {
		System.out.println("post_no : " + post_no);
		return "/";
	}
	
	// 온라인 글 작성 페이지 이동
	@RequestMapping("toPostWrite")
	public String toPostWrite() throws Exception {
		return "redirect:/onlinePost/toWrite.do";
	}
	
	// 글 삭제
	@RequestMapping("deletePost.do")
	public String deletePost(String[] postCheckBox) throws Exception {
		service.deletePost(postCheckBox);
		return "redirect:/admin/toPostManagement";
	}

}
