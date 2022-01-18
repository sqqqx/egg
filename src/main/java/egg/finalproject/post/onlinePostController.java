package egg.finalproject.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/onlinePost")
public class onlinePostController {
	@Autowired
	private onlinePostService service;
	
	
	@RequestMapping("/toWrite.do")
	public String toWrite(Model model) throws Exception{
		List<String> list = service.getParentCategory(); //대분류 값 받아오기
//		for(String str : list) {
//			System.out.println(str);
//		}
		model.addAttribute("list", list);
		return "onlinePost/onlinePost_write";
	}
	
	@RequestMapping("/getChildCategory.do")
	@ResponseBody
	public List<String> getChildCategory(String bigCategory) throws Exception{
		System.out.println("getChildCategory controller 진입");
		List<String> list = service.getChildCategory(bigCategory);
		for(String str : list) {
			System.out.println(str);
		}
		return list;
	}
}
