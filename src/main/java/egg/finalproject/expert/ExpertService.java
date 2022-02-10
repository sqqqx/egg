package egg.finalproject.expert;

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
}
