package egg.finalproject.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/notice")
public class NoticeController {

	@Autowired
	private NoticeService service;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/selectById.do")
	@ResponseBody
	public List<NoticeDTO> selectById(String to_id, Model model) throws Exception{
		List<NoticeDTO> list = service.selectById(to_id);
		return list;
	}
	
	@RequestMapping("/deleteAll.do")
	@ResponseBody
	public String deleteAll(String to_id) throws Exception{
		if(service.deleteAll(to_id)) {
			return "available";
		}else {
			return "unavailable";
		}
	}
	
	@RequestMapping("/deleteByNo.do")
	@ResponseBody
	public String deleteByNo(int notice_no) throws Exception{
		if(service.deleteByNo(notice_no)) {
			return "available";
		}else {
			return "unavailable";
		}
	}
	
	@RequestMapping("/delete.do")
	@ResponseBody
	public String delete(int type, int post_no, String to_id, String from_id) throws Exception{
		if(service.delete(type, post_no, to_id, from_id)) {
			return "available";
		}else {
			return "unavailable";
		}
	}
	
	@RequestMapping("/selectId.do")
	public String selectId(String to_id, Model model) throws Exception{
		List<NoticeDTO> list = service.selectById(to_id);
		model.addAttribute("list",list);
		return "list";
	}
}
