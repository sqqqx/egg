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
	
	@RequestMapping("toPostManagement")
	public String toPostManagement() throws Exception {
		return "redirect:/admin/getPostList.do?currentIdx=1&type=1";
	}
	
	
//	@RequestMapping("getPostList.do")
//	public String getPostList(Model model, int currentIdx, String searchOption, String searchKeyword, String typeStore, String typeOnline, String typeOffline) throws Exception {
//		model.addAttribute("list", service.getPostList(currentIdx, searchOption, searchKeyword, typeStore, typeOnline, typeOffline));
//		model.addAttribute("map", service.getNavi(currentIdx));
//		model.addAttribute("searchOption", searchOption);
//		model.addAttribute("searchKeyword", searchKeyword);
//		model.addAttribute("typeStore", typeStore);
//		model.addAttribute("typeOnline", typeOnline);
//		model.addAttribute("typeOffline", typeOffline);
//		return "admin/postManagement";
//	}
	
	// 게시글 목록 가져오기
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
	
	// TEST
	@RequestMapping("test")
	public String test(Model model, String typeStore, String typeOnline, String typeOffline) throws Exception {
		System.out.println("typeStore : " + typeStore + " : typeOnline : " + typeOnline + " : typeOffline : " + typeOffline);
		Map<String, String> map = new HashMap<>();
		map.put("typeStore", typeStore);
		map.put("typeOnline", typeOnline);
		map.put("typeOffline", typeOffline);
		model.addAttribute("map", map);
		return "admin/postManagement";
	}

}
