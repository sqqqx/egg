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

	public List<PostDTO> selectByCg(String parent_group) throws Exception{
		System.out.println("offlinePostDAO : " + parent_group);
		return session.selectList("offlinePostMapper.selectByCg", parent_group);
	}
	
	
}
