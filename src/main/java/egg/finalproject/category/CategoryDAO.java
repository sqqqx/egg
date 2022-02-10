package egg.finalproject.category;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAO {
	@Autowired
	private SqlSession session;
	
	//대분류 항목을 다 가져오는 메서드
	public List<String> getParentCategory() throws Exception{
		return session.selectList("categoryMapper.getParentCategory");
	}
	
	//대분류에 따른 소분류를 가져오는 메서드
	public List<CategoryDTO> getChildCategory(String bigCategory) throws Exception{
		System.out.println("getChildCategory dao 진입");
		return session.selectList("categoryMapper.getChildCategory",bigCategory);
	}
	
	//category_no로 categoryDTO를 가져오는 메서드
	public CategoryDTO getCategory(int category_no) throws Exception{
		return session.selectOne("categoryMapper.getCategory",category_no);
	}
	
	// (마이페이지) 카테고리명 가져오기
	public String cateName(int category_no) throws Exception {
		System.out.println("CategoryDAO / 카테고리명 가져오기 - category_no: " + category_no);
		return session.selectOne("categoryMapper.cateName", category_no);
	}
}
