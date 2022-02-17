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
	// (마이페이지) 찜한 게시글 가져오기
	public List<Map<String, Object>> getMyLikePost(Map<String, Object> map) throws Exception {
		return session.selectList("offlinePostMapper.getMyLikePost", map);
	}
	
	// (마이페이지) 찜한 게시글 COUNT
	public int getMyLikePostCount(Map<String, Object> map) throws Exception {
		return session.selectOne("offlinePostMapper.getMyLikePostCount", map);
	}
	
	// (마이페이지) 내가 쓴 글 가져오기
	public List<PostDTO> getMyPost(Map<String, Object> map) throws Exception {
		return session.selectList("offlinePostMapper.getMyPost", map);
	}
	
	// (마이페이지) 내가 쓴 글 COUNT
	public int getMyPostCount(Map<String, Object> map) throws Exception {
		return session.selectOne("offlinePostMapper.getMyPostCount", map);
	}
	
	// (오프라인) 글 목록 가져오기
	public List<PostDTO> getOffPost(Map<String, Object> map) throws Exception{
		return session.selectList("offlinePostMapper.getOffPost", map);
	}
	
	// (오프라인) 글 목록 COUNT
	public int getOffPostCount(Map<String, Object> map) throws Exception{
		return session.selectOne("offlinePostMapper.getOffPostCount", map);
	}
	
//	public List<PostDTO> selectByCg(Map<String, Object> map) throws Exception{
//		return session.selectList("offlinePostMapper.selectByCg", map);
//	}
//	
//	public int getPostCountAll(String parent_group) throws Exception {
//		int rs = session.selectOne("offlinePostMapper.getPostCountAll", parent_group);
//		System.out.println("dao rs : " + rs);
//		return rs;
//	}
//	
//	public List<PostDTO> getPostbySearch(Map<String, Object> map) throws Exception{
//		return session.selectList("offlinePostMapper.getPostbySearch", map);
//	}
//	
//	public int getPostCountSearch(Map<String, Object> map) throws Exception {
//		int rs = session.selectOne("offlinePostMapper.getPostCountSearch", map);
//		System.out.println("dao rs : " + rs);
//		return rs;
//	}
	
	public int insertPost(PostDTO dto) throws Exception{
		return session.insert("offlinePostMapper.insertPost",dto);
	}
	
	// 조회수 카운트
	public int viewcount(int post_no) throws Exception {
		return session.update("offlinePostMapper.viewcount", post_no);
	}
}
