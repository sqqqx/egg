package egg.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egg.finalproject.expert_category.Expert_categoryService;

@Controller
@RequestMapping("/offline")
public class OfflineController {

	@Autowired
	private HttpSession session;
	@Autowired
	private Expert_categoryService service;
	
	@RequestMapping("/toMain.do")
	public String toMain() throws Exception{ 
		return "offline/offlineMain";
	}
	
	@RequestMapping("/toMainEx.do")
	public String toMain(String expert_id, Model model) throws Exception{ 
		List<Object> list = service.ExpertCategory(expert_id);
		model.addAttribute("ExpertCategory",list);
		return "offline/offlineMain";
	}
}
