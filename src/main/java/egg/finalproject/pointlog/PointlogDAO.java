package egg.finalproject.pointlog;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PointlogDAO {
	@Autowired
	private SqlSession session;
	
	// (마이페이지) ID로 포인트 내역 불러오기
	public List<PointlogDTO> getLogById(String user_id) throws Exception {
		System.out.println("PointlogDAO / 포인트 내역 불러오기 - user_id: " + user_id);
		return session.selectList("pointlogMapper.getLogById", user_id);
	}
	
	// (마이페이지) 포인트 내역 저장(충전 editp+ / 사용 editp-)
	public int insertLog(Map map) throws Exception {
		System.out.println("PointlogDAO / 포인트 내역 저장 - map: " + map);
		return session.insert("pointlogMapper.insertLog", map);
	}
	
	// (마이페이지) 포인트 잔액 불러오기
	public int balance(String user_id) throws Exception {
		System.out.println("PointlogDAO / 포인트 잔액 불러오기 - user_id: " + user_id);
		return session.selectOne("pointlogMapper.balance", user_id);
	}
}
