package egg.finalproject.message;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/message")
public class MessageController {
	@Autowired
	private MessageService service;
	@Autowired
	private HttpSession session;
	
	

	// (마이페이지) 쪽지 보내기 페이지 요청
	@RequestMapping("/toSendMessage")
	public String toSendMessage() {
		return "/member/sendMessage";
	}
	
	// (마이페이지) 쪽지 보내기
	@RequestMapping(value="/sendMessage.do", produces="text/html;charset=UTF-8")
	@ResponseBody()
	public String sendMessage(MessageDTO dto) throws Exception {	// success or fail 반환
		System.out.println("MemberController / 쪽지보내기 - " + dto);
		return service.sendMessage(dto);
	}
	
	// (마이페이지) 쪽지함 페이지 요청
	@RequestMapping("/toViewMessage")
	public String toViewMessage(Model model, String type, String user_id, int currentPage) throws Exception {
		// type: received - 받은쪽지 / sent - 보낸쪽지
		System.out.println("MessageController toViewMessage - type: " + type + " / user_Id: " + user_id + " / currentPage: " + currentPage);
		
		// 현재 페이지에 해당하는 쪽지 리스트 가져오기
		List<MessageDTO> msgList = service.getMsgList(type, user_id, currentPage);
		if(msgList != null) {
			model.addAttribute("msgList", msgList);
			Map<String, Object> naviMap = service.getPageNavi(type, user_id, currentPage);
			System.out.println("MessageController / naviMap jsp보내기 전 - type: " + naviMap.get("type"));
			model.addAttribute("naviMap", naviMap);
		}
		return "/member/viewMessage";
	}
	
}
