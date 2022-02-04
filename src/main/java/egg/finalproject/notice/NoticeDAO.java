package egg.finalproject.notice;

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
}
