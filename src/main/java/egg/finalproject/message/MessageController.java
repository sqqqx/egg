package egg.finalproject.message;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egg.finalproject.member.MemberService;

@Controller
@RequestMapping("/message")
public class MessageController {
	@Autowired
	private MessageService service;
	@Autowired
	private MemberService memberService;
	@Autowired
	private HttpSession session;
	
	

	// (마이페이지) 쪽지 보내기 페이지 요청
	@RequestMapping("/toSendMessage")
	public String toSendMessage(Model model, MessageDTO dto) {
		System.out.println("MessageController / 쪽지보내기 페이지 요청 - to_id: " + dto.getTo_id() + " / from_id: " + dto.getFrom_id());
		model.addAttribute("dto", dto);
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
	public String toViewMessage(Model model, String type, String user_id, int currentPage, String orderMsg) throws Exception {
		// type: received - 받은쪽지 / sent - 보낸쪽지
		System.out.println("MessageController toViewMessage - type: " + type + " / user_Id: " + user_id
				+ " / currentPage: " + currentPage + " / orderMsg: " + orderMsg);
		
		// 현재 페이지에 해당하는 쪽지 리스트 가져오기
		List<MessageDTO> msgList = service.getMsgList(type, user_id, currentPage, orderMsg, null, null);
		if(msgList != null) {
			model.addAttribute("msgList", msgList);
			Map<String, Object> naviMap = service.getPageNavi(type, user_id, currentPage, orderMsg, null, null);
			System.out.println("MessageController / naviMap jsp보내기 전 - type: " + naviMap.get("type"));
			model.addAttribute("naviMap", naviMap);
		}
		
		// 정렬이 null이면 최신순으로 정렬
		if(orderMsg == null) {
			orderMsg = "latest";
		}
		model.addAttribute("orderMsg", orderMsg);
		
		// 사진경로를 얻기 위해 dto정보 가져오기
		model.addAttribute("dto", memberService.getDTOById(user_id));
		return "/member/viewMessage";
	}
	
	// (마이페이지) 쪽지 삭제 (1개)
	@RequestMapping("/deleteMsg.do")
	public String deleteMsg(String type, String user_id, int currentPage, int message_no, String orderMsg) throws Exception {
		System.out.println("MessageController / 쪽지삭제 - message_no: " + message_no);
		service.deleteMsg(message_no);
		return "redirect:/message/toViewMessage?type=" + type + "&user_id=" + user_id + "&currentPage=" + currentPage + "&orderMsg=" + orderMsg;
	}
	
	// (마이페이지) 체크된 메세지 처리
	@RequestMapping("/checkedMsg.do")
	public String checkedMsgDelete(String type, String user_id, int currentPage, String checkOpt, int[] checkedMsg, String orderMsg) throws Exception {
		
		System.out.println("MessageController / 체크된 쪽지 전부 삭제 - type: " + type + " / user_id: " + user_id
				+ " / currentPage: " + currentPage + " / checkOpt: " + checkOpt);
		for(int msg : checkedMsg) {
			System.out.println("체크된 메시지 번호: " + msg);
		}
		if(checkOpt.equals("read")) {	// 체크된 메세지 전부 읽음 처리
			service.checkedMsgRead(checkedMsg);
		} else if(checkOpt.equals("delete")) {	// 체크된 메세지 전부 삭제
			service.checkedMsgDelete(checkedMsg);
		}
		
		return "redirect:/message/toViewMessage?type=" + type + "&user_id=" + user_id + "&currentPage=" + currentPage + "&orderMsg=" + orderMsg;
	}
	
	// (마이페이지) 검색 기능
	@RequestMapping("/searchMsg.do")
	public String searchMsg(Model model, String type, String user_id, int currentPage, String orderMsg, String searchOpt, String inputText) throws Exception {
		System.out.println("MessageController / 검색 기능 - inputText: " + inputText + " / searchOpt: " + searchOpt + " / type: " + type
				+ " / user_id: " + user_id + " / currentPage: " + currentPage + " / orderMsg: " + orderMsg);
		
		// 현재 페이지에 해당하는 쪽지 리스트 가져오기
		List<MessageDTO> msgList = service.getMsgList(type, user_id, currentPage, orderMsg, searchOpt, inputText);
		if(msgList != null) {
			model.addAttribute("msgList", msgList);                                                                                                
			Map<String, Object> naviMap = service.getPageNavi(type, user_id, currentPage, orderMsg, searchOpt, inputText);
			System.out.println("MessageController / naviMap jsp보내기 전 - type: " + naviMap.get("type"));
			model.addAttribute("naviMap", naviMap);
		}	
				
		// 정렬이 null이면 최신순으로 정렬
		if(orderMsg == null) {
			orderMsg = "latest";
		}
		model.addAttribute("orderMsg", orderMsg);
		model.addAttribute("searchOpt", searchOpt);
		model.addAttribute("inputText", inputText);
		return "/member/viewMessage";
	}
	
	// (마이페이지) 쪽지 상세보기
	@RequestMapping("/detailMsg.do")
	public String detailMsg(Model model, int message_no) throws Exception {
		System.out.println("MessageController / detailMsg - message_no: " + message_no);
		MessageDTO dto = service.detailMsg(message_no);
		model.addAttribute("dto", dto);
		return "/member/detailMsg";
	}
	
}
