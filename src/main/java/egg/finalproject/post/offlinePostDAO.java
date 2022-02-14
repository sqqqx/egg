package egg.finalproject.post;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class offlinePostDAO {

	@Autowired
	private SqlSession session;

	/*
	 * public List<PostDTO> selectByCg(String parent_group) throws Exception{
	 * System.out.println("offlinePostDAO : " + parent_group); return
	 * session.selectList("offlinePostMapper.selectByCg", parent_group); }
	 */
	
	public List<PostDTO> selectByCg(Map<String, Object> map) throws Exception{
		return session.selectList("offlinePostMapper.selectByCg", map);
	}
	
	public int getPostCountAll(String parent_group) throws Exception {
		int rs = session.selectOne("offlinePostMapper.getPostCountAll", parent_group);
		System.out.println("dao rs : " + rs);
		return rs;
	}
	
	public List<PostDTO> getPostbySearch(Map<String, Object> map) throws Exception{
		return session.selectList("offlinePostMapper.getPostbySearch", map);
	}
	
	public int getPostCountSearch(Map<String, Object> map) throws Exception {
		int rs = session.selectOne("offlinePostMapper.getPostCountSearch", map);
		System.out.println("dao rs : " + rs);
		return rs;
	}
	
	public int insertPost(PostDTO dto) throws Exception{
		return session.insert("offlinePostMapper.insertPost",dto);
	}
	
	// 조회수 카운트
	public int viewcount(int post_no) throws Exception {
		return session.update("offlinePostMapper.viewcount", post_no);
	}
}
