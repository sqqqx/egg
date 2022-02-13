package egg.finalproject.expert;

import java.util.Map;

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
	
	// (마이페이지) 포인트 수정
	public int modifyPoint(Map map) throws Exception {
		System.out.println("ExpertDAO / 포인트 수정 - map: " + map);
		return session.update("expertMapper.modifyPoint", map);
	}
	
	// (마이페이지) 능력자 정보 수정
	public int modifyExpert(ExpertDTO dto) throws Exception {
		System.out.println("ExpertDAO / 능력자 정보수정 - ExpertDTO: " + dto);
		return session.update("expertMapper.modifyExpert", dto);
	} 
}
