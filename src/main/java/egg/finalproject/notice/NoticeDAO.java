package egg.finalproject.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSession session;
	
	public int insert(NoticeDTO dto) throws Exception{
		return session.insert("noticeMapper.insert",dto);
	}
	public String countMessage(String to_id) throws Exception{
		return session.selectOne("noticeMapper.countMessage",to_id);
	}
	
	public List<NoticeDTO> selectById(String to_id) throws Exception{
		return session.selectList("noticeMapper.selectById",to_id);
	}
	
	public int deleteAll(String to_id) throws Exception{
		return session.delete("noticeMapper.deleteAll",to_id);
	}
	
	public int deleteByNo(int notice_no) throws Exception{
		return session.delete("noticeMapper.deleteByNo",notice_no);
	}
	
	public int delete(int type, int post_no, String to_id, String from_id) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("type", type);
		map.put("post_no", post_no);
		map.put("to_id", to_id);
		map.put("from_id", from_id);
		return session.delete("noticeMapper.delete",map);
	}
}
