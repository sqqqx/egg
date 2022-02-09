package egg.finalproject.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egg.finalproject.category.CategoryDTO;
import egg.finalproject.category.CategoryService;
import egg.finalproject.expert_category.Expert_categoryService;

@Controller
@RequestMapping("/offlinePost")
public class offlinePostController {

	@Autowired
	private offlinePostService service;
	
	@Autowired
	private CategoryService cService;
	
	@Autowired
	private Expert_categoryService exService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/toList.do")
	public String toList(String parent_group,String expert_id, Model model) throws Exception{
		System.out.println(parent_group);
		List<PostDTO> list = service.selectByCg(parent_group);
		List<Object> Exlist = exService.ExpertCategory(expert_id);
		model.addAttribute("ExpertCategory",list);
		model.addAttribute("list", list);
		model.addAttribute("parent_group", parent_group);
		return "offline/offlineList";
	}
	
	///////////////////////////게시글 작성//////////////////////////////
	
	//게시글 작성 페이지로 이동 : written by 경민
	@RequestMapping("/toWrite.do")
	public String toWrite(String parent_group, Model model) throws Exception{
		List<CategoryDTO> categoryList = cService.getChildCategory(parent_group);
		model.addAttribute("categoryList",categoryList);
		model.addAttribute("parent_group",parent_group);
		return "/offlinePost/offlinePost_write";
	}
	
//	//게시글 작성 : written by 경민
//	@RequestMapping("/insertPost.do")
//	public String insertPost()
}
