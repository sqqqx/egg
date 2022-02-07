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
}
