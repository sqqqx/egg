package egg.finalproject.expert_category;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Expert_categoryDAO {
	
	@Autowired
	private SqlSession session;

	public List<Object> ExpertCategory(String expert_id) throws Exception{
		return session.selectList("expertcategoryMapper.ExpertCategory", expert_id);
	}
	
	// (마이페이지) 능력자 카테고리 번호 추가
	public int insertExpertCN(Expert_categoryDTO dto) throws Exception {
		System.out.println("Expert_categoryDAO / 능력자 카테고리 번호 추가 - dto: " + dto);
		return session.insert("expertcategoryMapper.insertExpertCN", dto);
	}
	
	// (마이페이지) 카테고리 번호 가져오기
	public List<Integer> noList(String expert_id) throws Exception {
		System.out.println("Expert_categoryDAO / 카테고리 번호 가져오기 - expert_id: " + expert_id);
		return session.selectList("expertcategoryMapper.noList", expert_id);
	}
	
	// (마이페이지) 카테고리 정보 삭제
	public int deleteExpertCN(String expert_id) throws Exception {
		System.out.println("Expert_categoryDAO / 카테고리 정보 삭제 - expert_id: " + expert_id);
		return session.delete("expertcategoryMapper.deleteExpertCN", expert_id);
	}
}
