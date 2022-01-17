package egg.finalproject.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/onlinePost")
public class onlinePostController {
	
	@RequestMapping("/toWrite.do")
	public String toWrite() {
		return "onlinePost/onlinePost_write";
	}
}
