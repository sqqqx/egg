package egg.finalproject.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminProductDAO {
	
	@Autowired
	private SqlSession session;
	
	// 상품 수 가져오기
	public int getProductCount(Map<String, String> map) throws Exception {
		return session.selectOne("adminProductMapper.getProductCount", map);
	}
	
	// 상품 목록 가져오기
	public List<Map<String, Object>> getProductsList(Map<String, Object> map) throws Exception {
		return session.selectList("adminProductMapper.getProductsList", map);
	}

}
