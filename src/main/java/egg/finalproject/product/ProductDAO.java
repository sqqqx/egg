package egg.finalproject.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	
	//상품 등록 메서드
	public int insertProduct(ProductDTO dto) throws Exception{
		return session.insert("productMapper.insertProduct",dto);
	}
	
	public int deleteProduct(int product_no) throws Exception{
		return session.delete("productMapper.deleteProduct",product_no);
	}
	
	public int modifyProduct(ProductDTO dto) throws Exception{
		System.out.println("dao들어옴");
		System.out.println(dto.getName());
		System.out.println(dto.getContent());
		int rs = session.update("productMapper.modifyProduct",dto);
		System.out.println("dao rs : "+rs);
//		return session.update("productMapper.modifyProduct",dto);
		return rs;
	}
	
	// (마이페이지) 주문 후 재고수량 수정
	public int modifyStock(Map map) throws Exception {
		System.out.println("ProductDAO / 재고수량 수정 - map: " + map);
		return session.update("productMapper.modifyStock", map);
	}
}
