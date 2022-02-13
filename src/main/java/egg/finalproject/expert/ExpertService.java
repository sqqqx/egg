package egg.finalproject.expert;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExpertService {
	@Autowired
	private ExpertDAO dao;
	
	// (마이페이지) 능력자 전환신청
	public int insertExpert(ExpertDTO dto) throws Exception {
		System.out.println("ExpertService / 능력자 전환신청 - ExpertDTO: " + dto);
		return dao.insertExpert(dto);
	}
	
	// (마이페이지) 능력자 정보 불러오기
	public ExpertDTO getExpertDTO(String user_id) throws Exception {
		System.out.println("ExpertService / 능력자 정보 불러오기 - user_id: " + user_id);
		return dao.getExpertDTO(user_id);
	}
	
	// (마이페이지) 포인트 수정
	public int modifyPoint(String expert_id, int balance) throws Exception {
		System.out.println("ExpertService / 포인트 수정 - expert_id: " + expert_id + ", balance: " + balance);
		Map<String, Object> map = new HashMap<>();
		map.put("expert_id", expert_id);
		map.put("balance", balance);
		return dao.modifyPoint(map);
	}
	
	// (마이페이지) 능력자 정보 수정
	public int modifyExpert(ExpertDTO dto) throws Exception {
		System.out.println("ExpertService / 능력자 정보수정 - ExpertDTO: " + dto);
		return dao.modifyExpert(dto);
	} 
}
