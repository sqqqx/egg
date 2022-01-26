package egg.finalproject.message;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageService {
	@Autowired
	private MessageDAO dao;
	
	// 멤버변수
	private int msgCntPerPage = 10;	// 한 페이지 당 데이터 개수
	private int naviCntPerPage = 10;	// 한 페이지에 띄울 네비 개수
	
	// (마이페이지) 쪽지 보내기
	public String sendMessage(MessageDTO dto) throws Exception {
		System.out.println("MemberService / 쪽지보내기 - " + dto);
		if(dao.sendMessage(dto) == 1) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// (마이페이지) 쪽지 불러오기
	public List<MessageDTO> getMsgList(String type, String user_id, int currentPage) throws Exception {
		System.out.println("MessageService / 쪽지 불러오기 - type: " + type + " / user_id: " + user_id + " / currentPage: " + currentPage);
		int startRange = currentPage * msgCntPerPage - (msgCntPerPage-1);
		int endRange = currentPage * msgCntPerPage;
		System.out.println("startRange: " + startRange + " / endRange: " + endRange);
		
		List<MessageDTO> msgList = dao.getMsgList(type, user_id, startRange, endRange);
		for(MessageDTO msg : msgList) {
			System.out.println(msg);
		}
		return msgList;
	}
	
	// (마이페이지) 쪽지 페이징
	public Map<String, Object> getPageNavi(String type, String user_id, int currentPage) throws Exception {
		System.out.println("MessageService / 쪽지 페이징 - type: " + type + " / user_id: " + user_id + " / currentPage: " + currentPage);
		// 해당 아이디에 해당하는 전체 쪽지 개수
		int msgTotalCnt = dao.getMsgTotalCnt(type, user_id);
		System.out.println("메세지 총 개수: " + msgTotalCnt);
		
		// 메세지 유무 검사
		if(msgTotalCnt > 0) {
			// 총 페이지 개수
			int pageTotalCnt = 0;	
			if(msgTotalCnt % msgCntPerPage > 0) {
				pageTotalCnt = (msgTotalCnt / msgCntPerPage) +1;
			} else {
				pageTotalCnt = msgTotalCnt / msgCntPerPage;
			}
			System.out.println("총 페이지 개수: " + pageTotalCnt);
			
			// 현재페이지 유효성 검사
			if(currentPage < 1) {
				currentPage = 1;
			} else if(currentPage > pageTotalCnt){
				currentPage = pageTotalCnt;
			}
			
			// 시작 네비 페이지, 끝 네비 페이지 설정
			int startNavi = ((currentPage-1) / naviCntPerPage) * naviCntPerPage +1;
			int endNavi = startNavi + naviCntPerPage -1;
			
			// endNavi 유효성 검사. 총 페이지 수를 초과하지 않도록 한다.
			if(endNavi > pageTotalCnt) {
				endNavi = pageTotalCnt;
			}
			
			// 현재 페이지에 따른 이전, 다음 버튼 세팅
			boolean needPrev = true;
			boolean needNext = true;
			if(startNavi == 1) {
				needPrev = false;
			}
			if(endNavi == pageTotalCnt) {
				needNext = false;
			}
			
			Map<String, Object> map = new HashMap<>();
			map.put("startNavi", startNavi);
			map.put("endNavi", endNavi);
			map.put("needPrev", needPrev);
			map.put("needNext", needNext);
			map.put("currentPage", currentPage);
			map.put("type", type);
			
			System.out.println("startNavi: " + startNavi);
			System.out.println("endNavi: " + endNavi);
			System.out.println("needPrev: " + needPrev);
			System.out.println("needNext: " + needNext);
			System.out.println("currentPage: " + currentPage);
			System.out.println("type" + type);
			
			
			return map;	
		} else {
			Map<String, Object> map = new HashMap<>();
			map.put("startNavi", 1);
			map.put("endNavi", 1);
			map.put("needPrev", false);
			map.put("needNext", false);
			map.put("currentPage", currentPage);
			map.put("type", type);
			
			System.out.println("currentPage: " + currentPage);
			System.out.println("type: " + type);
			System.out.println(user_id + "님의 쪽지를 조회할 수 없습니다.");
			
			return map;	
		}
	}
}
