package egg.finalproject.post;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egg.finalproject.product.ProductDTO;

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
	
	public List<ProductDTO> searchProduct(String value) throws Exception{
		return session.selectList("onlinePost.searchProduct",value);
	}
	//숫자나 문자열이 들어온다.
	//문자열과 숫자를 같이 검색하지 말까? 좋은 방법인 것 같다.
	
}
