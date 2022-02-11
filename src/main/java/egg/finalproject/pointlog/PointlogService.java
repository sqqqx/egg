package egg.finalproject.pointlog;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PointlogService {
	@Autowired
	private PointlogDAO dao;
	
	// (마이페이지) ID로 포인트 내역 불러오기
	public List<PointlogDTO> getLogById(String user_id) throws Exception {
		System.out.println("PointlogService / 포인트 내역 불러오기 - user_id: " + user_id);
		return dao.getLogById(user_id);
	}
	
	// (마이페이지) 포인트 내역 저장(충전 editp+ / 사용 editp-)
	public int insertLog(String user_id, int editp) throws Exception {
		System.out.println("PointlogService / 포인트 내역 저장 - user_id: " + user_id + ", editp: " + editp);
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("editp", editp);
		return dao.insertLog(map);
	}
	
	// (마이페이지) 포인트 잔액 불러오기
	public int balance(String user_id) throws Exception {
		System.out.println("PointlogService / 포인트 잔액 불러오기 - user_id: " + user_id);
		return dao.balance(user_id);
	}
	
}
