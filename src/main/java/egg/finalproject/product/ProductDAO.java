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
	
	//검색어에 해당하는 상품 정보 리스트 반환
	//RETURN : List<ProductDTO>
	public List<ProductDTO> searchProduct(String value) throws Exception{
		System.out.println("dao search 진입"+value);
		return session.selectList("productMapper.searchProduct",value);
	}
	
	//product_no로 상품 정보 얻어오기 
	//RETURN : ProductDTO 정보 반환
	public ProductDTO getProduct(int product_no) throws Exception{
		return session.selectOne("productMapper.getProduct",product_no);
	}
	
	//product_no로 ProductDTO를 얻어와 controller에서 수량 담아서 반환
	//RETURN : ProductDTO만 담긴 TempOrderDTO
	public TempOrderDTO getTempOrderInfo(int product_no) throws Exception{
		return session.selectOne("productMapper.tempOrderInfo",product_no);
	}
	
	//상품 등록 메서드
	public int insertProduct(ProductDTO dto) throws Exception{
		return session.insert("productMapper.insertProduct",dto);
	}
}
