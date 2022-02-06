package egg.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/offline")
public class OfflineController {

	
	@RequestMapping("/toMain.do")
	public String toMain() throws Exception{
		return "offline/offlineMain";
	}
}
