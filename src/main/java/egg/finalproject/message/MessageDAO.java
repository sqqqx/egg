package egg.finalproject.message;

import java.util.ArrayList;
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
	public List<MessageDTO> getMsgList(String type, String user_id, int startRange, int endRange) throws Exception {
		System.out.println("MessageDAO / 쪽지불러오기 - user_id: " + user_id + " / startRange: " + startRange + " / endRange: " + endRange);
		
		Map<String, Object> map = new HashMap<>();
		map.put("type", type);
		map.put("user_id", user_id);
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		return session.selectList("messageMapper.getMsgList", map);
		
	}
	
	// (마이페이지) 전체 쪽지 개수
	public int getMsgTotalCnt(String type, String user_id) throws Exception {
		System.out.println("MessageDAO / 쪽지 페이징 - type: " + type + " / user_id: " + user_id);
		
		Map<String, String> map = new HashMap<>();
		map.put("type", type);
		map.put("user_id", user_id);
		return session.selectOne("messageMapper.getMsgTotalCnt", map);
	}
	
	
}
