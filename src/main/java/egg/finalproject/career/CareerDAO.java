package egg.finalproject.career;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CareerDAO {
	@Autowired
	private SqlSession session;
	
	// (마이페이지) 능력자 전환 - 커리어 파일 추가
	public int insertCareer(CareerDTO dto) throws Exception {
		System.out.println("CareerDAO / 커리어 파일 추가: " + dto);
		return session.insert("careerMapper.insertCareer", dto);
	}
	
	// (마이페이지) 커리어 DTO 불러오기
//	public List<String> getCareerList(String expert_id) throws Exception {
//		System.out.println("CareerDAO / 커리어 파일명 불러오기 - expert_id: " + expert_id);
//		return session.selectList("careerMapper.getCareerList", expert_id);
//	}
	public List<CareerDTO> getCareerList(String expert_id) throws Exception {
		System.out.println("CareerDAO / 커리어 파일명 불러오기 - expert_id: " + expert_id);
		return session.selectList("careerMapper.getCareerList", expert_id);
	}
}
