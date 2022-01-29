package egg.finalproject.product;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egg.finalproject.order.TempOrderDTO;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductService service;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/toProductDetail.do")
	public String toProductDetail(int product_no,Model model) throws Exception{
		ProductDTO dto = service.getProduct(product_no);
		model.addAttribute("ProductDTO",dto);
		return "product/productDetail";
	}
	
	@RequestMapping("/toSearchProduct.do")
	public String toSearchProduct() throws Exception{
		return "onlinePost/searchProduct";
	}
	
	@RequestMapping("/searchProduct.do")
	@ResponseBody
	public List<ProductDTO> searchProduct(String value) throws Exception{
		System.out.println("search 진입"+value);
		List<ProductDTO> list = service.searchProduct(value);
		for(ProductDTO dto : list) {
			System.out.println(dto.getName());
		}
		return list;
	}
	
	@RequestMapping("/toOrder.do")
	public String toOrder(int product_no,int quantity, Model model) throws Exception{
		System.out.println("product_no : "+product_no);
		System.out.println("quantity : "+quantity);
		TempOrderDTO dto = service.getTempOrderInfo(product_no); 
		dto.setQuantity(quantity);
		System.out.println(dto);
		List<TempOrderDTO> list = new ArrayList<>();
		list.add(dto);
		model.addAttribute("list",list);
		return "order/order.jsp";
	}
}
