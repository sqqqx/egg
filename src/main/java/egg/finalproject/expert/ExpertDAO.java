package egg.finalproject.expert;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExpertDAO {
	@Autowired
	private SqlSession session;
	
	// (마이페이지) 능력자 전환신청
	public int insertExpert(ExpertDTO dto) throws Exception {
		System.out.println("ExpertDAO / 능력자 전환신청 - ExpertDTO: " + dto);
		return session.insert("expertMapper.insertExpert", dto);
	}
	
	// (마이페이지) 능력자 정보 불러오기
	public ExpertDTO getExpertDTO(String user_id) throws Exception {
		System.out.println("ExpertDAO / 능력자 정보 불러오기 - user_id: " + user_id);
		return session.selectOne("expertMapper.getExpertDTO", user_id);
	}
}
