package egg.finalproject.post;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egg.finalproject.category.CategoryService;
import egg.finalproject.expert_category.Expert_categoryService;

@Controller
@RequestMapping("/offlinePost")
public class offlinePostController {

	@Autowired
	private offlinePostService service;
	
	@Autowired
	private CategoryService Cservice;
	
	@Autowired
	private Expert_categoryService Exservice;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/toList.do")
	public String toList(String parent_group,String expert_id, Model model) throws Exception{
		System.out.println(parent_group);
		List<PostDTO> list = service.selectByCg(parent_group);
		List<Object> Exlist = Exservice.ExpertCategory(expert_id);
		model.addAttribute("ExpertCategory",list);
		model.addAttribute("list", list);
		model.addAttribute("parent_group", parent_group);
		return "offline/offlineList";
	}
}
