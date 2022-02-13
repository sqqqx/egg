package egg.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egg.finalproject.post.PostDTO;
import egg.finalproject.post.onlinePostService;

@Controller
@RequestMapping("/online")
public class OnlineController {

	@Autowired
	private HttpSession session;
	@Autowired
	private onlinePostService service;
	
	public OnlineController() {
		System.out.println("온라인컨트롤러 접속완료");
	}
	
	//온라인 메인페이지로 이동
	@RequestMapping("/toMain.do")
	public String toMain(Model model) throws Exception{
		List<Object> listRecent = service.selectRecent4();
		List<Object> listLike = service.selectLike4();
		List<Object> listAdmin = service.selectAdmin();
		model.addAttribute("listRecent", listRecent);
		model.addAttribute("listLike", listLike);
		model.addAttribute("listAdmin", listAdmin);
		System.out.println("메인으로 가즈아");
		return "online/onlineMain";
	}
	
	//추천수 순 게시글 조회 페이지로 이동
	@RequestMapping("/toLike.do")
	public String toLike(Model model) throws Exception{
		List<Object> listLike = service.selectLike();
		model.addAttribute("listLike",listLike);
		return "online/onlineLike";
	}
	
	//최신순 게시글 조회 페이지로 이동
	@RequestMapping("/toRecent.do")
	public String toRecent(Model model) throws Exception{
		List<Object> listRecent = service.selectRecent();
		model.addAttribute("listRecent",listRecent);
		return "online/onlineRecent";
	}
	
	//게시글 검색 별 조회 페이지로 이동
	@RequestMapping("/search.do")
	public String mainSearch(Model model, String search) throws Exception{
		System.out.println("search확인 == " + search);
		List<Object> listRecent = service.mainSearch(search);
		model.addAttribute("listRecent", listRecent);
		model.addAttribute("search", search);
		return "online/onlineSelect";
	}
	//카테고리 별 조회 페이지로 이동
		@RequestMapping("/toCat.do")
		public String toCat(Model model, int category_no, String child_group) throws Exception{
			List<Object> listCat = service.selectCat(category_no);
			model.addAttribute("listCat", listCat);
			model.addAttribute("category", child_group);
			return "online/onlineCat";
		}
	
	
}
