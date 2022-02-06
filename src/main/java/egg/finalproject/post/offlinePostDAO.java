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

	public List<PostDTO> selectByCg(int type, int category_no) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("type", type);
		map.put("category_no", category_no);
		return session.selectList("offlinePostMapper.selectByCg", map);
	}
	
	
}
