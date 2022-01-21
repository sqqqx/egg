package egg.finalproject.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminPostDAO {
	
	@Autowired
	private SqlSession session;
	
	// 게시글 수 가져오기
	public int getPostCount(Map<String, String> map) throws Exception {
		return session.selectOne("adminPostMapper.getPostCount", map);
	}
	
	// 게시글 목록 가져오기
	public List<Map<String, Object>> getPostList(Map<String, Object> map) throws Exception {
		return session.selectList("adminPostMapper.getPostList", map);
	}

}
