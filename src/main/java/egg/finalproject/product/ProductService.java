package egg.finalproject.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egg.finalproject.order.TempOrderDTO;

@Service
public class ProductService {
	@Autowired
	private ProductDAO dao;
	
	public List<ProductDTO> searchProduct(String value) throws Exception {
		System.out.println("sevice 진입" + value);
		return dao.searchProduct(value);
	}
	
	public ProductDTO getProduct(int product_no) throws Exception{
		return dao.getProduct(product_no);
	}
	
	public TempOrderDTO getTempOrderInfo (int product_no) throws Exception{
		return dao.getTempOrderInfo(product_no);
	}
}
