package egg.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/online")
public class OnlineController {

	public OnlineController() {
		System.out.println("온라인컨트롤러 접속완료");
	}
	
	@RequestMapping("/toMain.do")
	public String toMain() {
		return "online/onlineMain";
	}
}
