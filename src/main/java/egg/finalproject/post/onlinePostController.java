package egg.finalproject.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import egg.finalproject.category.CategoryDTO;
import egg.finalproject.image.ImageDTO;
import egg.finalproject.image.ImageService;
import egg.finalproject.product.ProductDTO;

@Controller
@RequestMapping("/onlinePost")
public class onlinePostController {
	@Autowired
	private onlinePostService service;
	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/toWrite.do")
	public String toWrite(Model model) throws Exception{
		List<String> list = service.getParentCategory(); //대분류 값 받아오기
//		for(String str : list) {
//			System.out.println(str);
//		}
		model.addAttribute("list", list);
		return "onlinePost/onlinePost_write";
	}
	
	@RequestMapping("/getChildCategory.do")
	@ResponseBody
	public List<CategoryDTO> getChildCategory(String bigCategory) throws Exception{
		System.out.println("getChildCategory controller 진입");
		List<CategoryDTO> list = service.getChildCategory(bigCategory);
		for(CategoryDTO dto : list) {
			System.out.println(dto.getChild_group());
		}
		return list;
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
	
	@RequestMapping("/write.do")
	public String insert(PostDTO dto,MultipartFile thumbNail) throws Exception{
		int post_no = service.getPost_no();
		System.out.println("post_no : "+post_no);
		dto.setPost_no(post_no);
		service.insertPost(dto);
		//파일 처리
		String realPath = session.getServletContext().getRealPath("onlinePostThumbNail");
		System.out.println(realPath);
		imageService.insertThumbNail(realPath, thumbNail,post_no);
		return "redirect:toWrite.do";
		//여기에 어드민 게시글 조회 부분링크로 가면 좋을듯
	}
	
	
	
	
	@RequestMapping("/toDetail.do")
	public String toDetail(int post_no, Model model) throws Exception{
//		ImageDTO imageDto = service.getThumbNail(post_no);
		PostDTO dto = service.getPostInfo(post_no);
		System.out.println(dto);
		ImageDTO imageDto = imageService.getThumbNail(post_no);
		model.addAttribute("PostDTO", dto);
		model.addAttribute("ImageDTO",imageDto);
		return "onlinePost/onlinePostDetail";
	}
 
	
}
