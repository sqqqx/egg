package egg.finalproject.post;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egg.finalproject.category.CategoryDTO;

@Repository
public class onlinePostDAO {
	@Autowired
	private SqlSession session;
	
	
	public List<String> getParentCategory() throws Exception{
		return session.selectList("onlinePostMapper.getParentCategory");
	}
	
	public List<String> getChildCategory(String bigCategory) throws Exception{
		System.out.println("getChildCategory dao 진입");
		return session.selectList("onlinePostMapper.getChildCategory",bigCategory);
	}
}
