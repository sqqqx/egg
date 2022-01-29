package egg.finalproject.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egg.finalproject.order.TempOrderDTO;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSession session;
	
	public List<ProductDTO> searchProduct(String value) throws Exception{
		System.out.println("dao search 진입"+value);
		return session.selectList("productMapper.searchProduct",value);
	}
	//숫자나 문자열이 들어온다.
	//문자열과 숫자를 같이 검색하지 말까? 좋은 방법인 것 같다.
	public ProductDTO getProduct(int product_no) throws Exception{
		return session.selectOne("productMapper.getProduct",product_no);
	}
	
	public TempOrderDTO getTempOrderInfo(int product_no) throws Exception{
		return session.selectOne("productMapper.tempOrderInfo",product_no);
	}
}
