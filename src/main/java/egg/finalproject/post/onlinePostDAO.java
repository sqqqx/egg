package egg.finalproject.post;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egg.finalproject.category.CategoryDTO;
import egg.finalproject.product.ProductDTO;

@Repository
public class onlinePostDAO {
	@Autowired
	private SqlSession session;
	
	
	public List<String> getParentCategory() throws Exception{
		return session.selectList("onlinePostMapper.getParentCategory");
	}
	
	public List<CategoryDTO> getChildCategory(String bigCategory) throws Exception{
		System.out.println("getChildCategory dao 진입");
		return session.selectList("onlinePostMapper.getChildCategory",bigCategory);
	}
	
	public List<ProductDTO> searchProduct(String value) throws Exception{
		System.out.println("dao search 진입"+value);
		return session.selectList("onlinePostMapper.searchProduct",value);
	}
	//숫자나 문자열이 들어온다.
	//문자열과 숫자를 같이 검색하지 말까? 좋은 방법인 것 같다.
	public void insertFile(String ori_name, String sys_name) throws Exception{
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("sys_name", sys_name);
		map.put("ori_name", ori_name);
		session.insert("onlinePostMapper.insertFile",map);
	}
}
