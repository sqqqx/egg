package egg.finalproject.product;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import egg.finalproject.member.MemberDTO;
import egg.finalproject.order.TempOrderDTO;
import egg.finalproject.post.PostDTO;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductService service;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/toWrite.do")
	public String toWrite() {
		return "product/product_write";
	}
	//TODO : 어드민 페이지 링크와 연결
	//TODO : insertProduct.do로 바꾸기
	//상품 등록
	@RequestMapping("/write.do")
	public String insertProduct(ProductDTO dto,MultipartFile thumbNail) throws Exception{
		String realPath = session.getServletContext().getRealPath("productThumbnail");
		service.insertProduct(dto,thumbNail, realPath);
		return "redirect:toWrite.do";
		//여기에 어드민 게시글 조회 부분링크로 가면 좋을듯
	}
	
	//상품 상세 페이지로 이동시킴
	//RETURN : 상세페이지 주소값
	@RequestMapping("/toProductDetail.do")
	public String toProductDetail(int product_no,Model model) throws Exception{
		ProductDTO dto = service.getProduct(product_no);
		model.addAttribute("ProductDTO",dto);
		return "product/productDetail";
	}
	
	//클래스와 연결된 상품 검색 페이지로 이동
	//RETURN : 상품 검색 페이지 주소값
	@RequestMapping("/toSearchProduct.do")
	public String toSearchProduct() throws Exception{
		return "product/searchProduct";
	}
	
	//검색어에 맞는 상품 나열 메서드 
	//RETURN : 검색어에 해당하는 List<ProductDTO>
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
	
	//주문 페이지로 이동
	//TempOrderDTO : ProductDTO + quantity 
	//RETURN : 주문페이지 주소값 반환 (TempOrderDTO 보냄) 
	@RequestMapping("/toOrder.do")
	public String toOrder(int product_no,int quantity, Model model) throws Exception{
		System.out.println("product_no : "+product_no);
		System.out.println("quantity : "+quantity);
		TempOrderDTO dto = service.getTempOrderInfo(product_no); //product_no에 해당하는 ProductDTO정보를 먼저 담고
		dto.setQuantity(quantity); // 수량을 같이 담아서 넘긴다.
		System.out.println(dto);
		List<TempOrderDTO> list = new ArrayList<>();  //장바구니와 같은 페이지로 넘기기 때문에 같이 list로 맞춰주기 위함.
		list.add(dto);
		model.addAttribute("list",list);
		return "order/order.jsp";
	}
}
