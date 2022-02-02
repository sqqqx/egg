package egg.finalproject.message;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAO {
	@Autowired
	private SqlSession session;
	
	// (마이페이지) 쪽지 보내기
	public int sendMessage(MessageDTO dto) throws Exception {
		System.out.println("MessageDAO / 쪽지보내기 - " + dto);
		return session.insert("messageMapper.sendMessage", dto);
	}
	
	// (마이페이지) user_id에 해당하는 쪽지 가져오기(페이지 범위 지정)
	public List<MessageDTO> getMsgList(String type, String user_id, int startRange, int endRange, String orderMsg, String searchOpt, String inputText) throws Exception {
		System.out.println("MessageDAO / 쪽지불러오기 - user_id: " + user_id + " / startRange: " + startRange + " / endRange: " + endRange
				+ " / orderMsg: " + orderMsg + " / searchOpt: " + searchOpt + " / inputText: " + inputText);
		
		Map<String, Object> map = new HashMap<>();
		map.put("type", type);
		map.put("user_id", user_id);
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		map.put("searchOpt", searchOpt);
		map.put("inputText", inputText);
		
		// 정렬 방법에 따라서 쿼리문이 달라진다.
		if(orderMsg == null || orderMsg.equals("latest")) {	// 최신순
			return session.selectList("messageMapper.getMsgList_latest", map);
		} else if(orderMsg.equals("oldest")) {	// 오래된순
			return session.selectList("messageMapper.getMsgList_oldest", map);
		} else if(orderMsg.equals("unread")) {	// 미열람 쪽지
			return session.selectList("messageMapper.getMsgList_unread", map);
		} else if(orderMsg.equals("read")) {	// 열람 쪽지
			return session.selectList("messageMapper.getMsgList_read", map);
		}
		return null;
	}
	
	// (마이페이지) 전체 쪽지 개수
	public int getMsgTotalCnt(String type, String user_id, String orderMsg, String searchOpt, String inputText) throws Exception {
		System.out.println("MessageDAO / 쪽지 페이징 - type: " + type + " / user_id: " + user_id + " / orderMsg: " + orderMsg
				+ " / searechOpt: " + searchOpt + " / inputText: " + inputText);
		
		Map<String, String> map = new HashMap<>();
		map.put("type", type);
		map.put("user_id", user_id);
		map.put("searchOpt", searchOpt);
		map.put("inputText", inputText);
		
		
		// 정렬 방법에 따라서 쿼리문이 달라진다.
		if(orderMsg == null || orderMsg.equals("latest") || orderMsg.equals("oldest")) {	// 전체 쪽지
			return session.selectOne("messageMapper.getMsgTotalCnt_all", map);
		} else if(orderMsg.equals("unread")) {	// 미열람 쪽지
			return session.selectOne("messageMapper.getMsgTotalCnt_unread", map);
		} else if(orderMsg.equals("read")) {	// 열람 쪽지
			return session.selectOne("messageMapper.getMsgTotalCnt_read", map);
		}
		return 0;
	}
	
	// (마이페이지) 쪽지 삭제
	public int deleteMsg(int message_no) throws Exception {
		System.out.println("MessageDAO / 쪽지 삭제 - message_no: " + message_no);
		return session.delete("messageMapper.deleteMsg", message_no);
	}
	
	// (마이페이지) 체크된 쪽지 전부 삭제
	public int checkedMsgDelete(int[] checkedMsg) throws Exception {
		System.out.println("MessageDAO / 체크된 쪽지 전부 삭제 - checkedMsg: " + checkedMsg);
		return session.delete("messageMapper.checkedMsgDelete", checkedMsg);
	}
	
	// (마이페이지) 체크된 쪽지 전부 삭제
	public int checkedMsgRead(int[] checkedMsg) throws Exception {
		System.out.println("MessageDAO / 체크된 쪽지 전부 읽음처리 - checkedMsg: " + checkedMsg);
		return session.update("messageMapper.checkedMsgRead", checkedMsg);
	}
	
	// (마이페이지) 쪽지 상세보기
	public MessageDTO detailMsg(int message_no) throws Exception {
		System.out.println("MessageDAO / 쪽지 상세보기 - message_no: " + message_no);
		return session.selectOne("messageMapper.detailMsg", message_no);
	}
}
