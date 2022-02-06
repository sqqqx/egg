package egg.finalproject.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egg.finalproject.category.CategoryDTO;
import egg.finalproject.category.CategoryService;

@Controller
@RequestMapping("/offlinePost")
public class offlinePostController {

	@Autowired
	private offlinePostService service;
	
	@Autowired
	private CategoryService Cservice;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/toList.do")
	public String toList(int category_no, Model model) throws Exception{
		int type=2; //오프라인게시글 타입2번
		
		List<PostDTO> list = service.selectByCg(2, category_no);
		CategoryDTO Clist = Cservice.getCategory(category_no);
		model.addAttribute("list", list);
		model.addAttribute("Clist",Clist);
		
		return "offline/offlineList";
	}
}
