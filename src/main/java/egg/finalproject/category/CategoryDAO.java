package egg.finalproject.category;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAO {
	@Autowired
	private SqlSession session;
	
	public List<String> getParentCategory() throws Exception{
		return session.selectList("categoryMapper.getParentCategory");
	}
	
	public List<CategoryDTO> getChildCategory(String bigCategory) throws Exception{
		System.out.println("getChildCategory dao 진입");
		return session.selectList("categoryMapper.getChildCategory",bigCategory);
	}
	
	public CategoryDTO getCategory(int category_no) throws Exception{
		return session.selectOne("categoryMapper.getCategory",category_no);
	}
}
