package egg.finalproject.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import egg.finalproject.comment.CommentDTO;
import egg.finalproject.comment.CommentService;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductService service;
	@Autowired
	private CommentService commentService;
	
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
		return "redirect:/admin/toProductManagement";
		//여기에 어드민 게시글 조회 부분링크로 가면 좋을듯
	}
	
	//상품 상세 페이지로 이동시킴
	//RETURN : 상세페이지 주소값
	@RequestMapping("/toProductDetail.do")
	public String toProductDetail(int product_no,Model model) throws Exception{
		ProductDTO dto = service.getProduct(product_no);
		List<CommentDTO> commentList = commentService.getAllComments(product_no, 0);
		model.addAttribute("ProductDTO",dto);
		model.addAttribute("CommentList",commentList);
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
	
	@RequestMapping("/toModify.do")
	public String toModify(int product_no, Model model) throws Exception{
		ProductDTO dto = service.getProduct(product_no);
		model.addAttribute("ProductDTO",dto);
		return "product/productModify";
	}
	
	//TODO : 삭제 후 주소값 "어드민 목록"으로 보낼 것
	@RequestMapping("/deleteProduct.do")
	@ResponseBody
	public String deleteProduct(int product_no) throws Exception{
		if(service.deleteProduct(product_no)) {
			return "success";
		}
		return "fail";
		
	}
	
	//TODO : 어드민으로 돌리기
	@RequestMapping("/modify.do")
	public String modify(ProductDTO dto, MultipartFile thumbNail, int product_no) throws Exception{
		System.out.println("product_no : "+product_no);
		System.out.println(dto.getContent());
		System.out.println(dto.getName());
		dto.setProduct_no(product_no);
		String realPath = session.getServletContext().getRealPath("productThumbnail");
		if(service.modifyProduct(dto,thumbNail, realPath)){
			System.out.println("true");
			return "redirect:toWrite.do";
		}
		System.out.println("false");
		return "redirect:toWrite.do";
	}
}
