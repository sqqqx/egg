package egg.finalproject.like;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDAO {

		@Autowired
		private SqlSession session;
		
		//게시글별 좋아요 카운트
		public int count(int post_no) throws Exception{
			return session.selectOne("likeMapper.count", post_no);
			
		}
		
		//좋아요 추가
		public int plus(String user_id, int type, int post_no) throws Exception{
			Map<String, Object> map = new HashMap<>();
			map.put("user_id", user_id);
			map.put("type", type);
			map.put("post_no", post_no);
			return session.update("likeMapper.plus", map);
		}
		
		//좋아요 취소
		public int minus(String user_id, int type, int post_no) throws Exception{
			Map<String, Object> map = new HashMap<>();
			map.put("user_id", user_id);
			map.put("type", type);
			map.put("post_no", post_no);
			return session.update("likeMapper.minus", map);
		}
		
		//유저가 게시글에 좋아요 눌렀는지 판별
		public int selectLike(String user_id, int type, int post_no) throws Exception{
			Map<String, Object> map = new HashMap<>();
			map.put("user_id", user_id);
			map.put("type", type);
			map.put("post_no", post_no);
			return session.selectOne("likeMapper.selectLike", map);
		}
		public String getNN(int type, int post_no) throws Exception{
			Map<String, Object> map = new HashMap<>();
			map.put("type", type);
			map.put("post_no", post_no);
			return session.selectOne("likeMapper.getNN",map);
		}
		public String getNNforPost(int type, int post_no) throws Exception{
			Map<String, Object> map = new HashMap<>();
			map.put("type", type);
			map.put("post_no", post_no);
			return session.selectOne("likeMapper.getNNforPost",map);
		}
}
