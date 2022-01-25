package egg.finalproject.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import egg.finalproject.category.CategoryDTO;
import egg.finalproject.category.CategoryService;
import egg.finalproject.comment.CommentDTO;
import egg.finalproject.comment.CommentService;
import egg.finalproject.image.ImageDTO;
import egg.finalproject.image.ImageService;
import egg.finalproject.product.ProductDTO;
import egg.finalproject.product.ProductService;

@Controller
@RequestMapping("/onlinePost")
public class onlinePostController {
	@Autowired
	private onlinePostService service;
	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired 
	private CommentService commentService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/toWrite.do")
	public String toWrite(Model model) throws Exception{
		List<String> list = categoryService.getParentCategory(); //대분류 값 받아오기
//		for(String str : list) {
//			System.out.println(str);
//		}
		model.addAttribute("list", list);
		return "onlinePost/onlinePost_write";
	}
	
	
	
	
	//toWrite.do => 게시글 목록으로 이동 시켜야함~!!!!
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
	
	
	
	//ProductDTO 추가 예정
	@RequestMapping("/toDetail.do")
	public String toDetail(int post_no, Model model) throws Exception{
		System.out.println("pont_no : " + post_no);
//		ImageDTO imageDto = service.getThumbNail(post_no);
		PostDTO dto = service.getPostInfo(post_no);
		System.out.println(dto);
		ImageDTO imageDto = imageService.getThumbNail(post_no);
		ProductDTO productDto = productService.getProduct(dto.getProduct_no());
		List<CommentDTO> commentList = commentService.getAllComments(post_no);
		System.out.println("성공이야!!1"+productDto.getName());
		System.out.println(commentList.get(0).getContent());
		model.addAttribute("PostDTO", dto);
		model.addAttribute("ImageDTO",imageDto);
		model.addAttribute("ProductDTO",productDto);
		model.addAttribute("CommentList",commentList);
		return "onlinePost/onlinePostDetail";
	}
	
	
	//toWrite.do => 게시글 목록으로 이동 시켜야함~!!!!
	@RequestMapping("/deletePost.do")
	public String deletePost(int post_no) throws Exception{
		System.out.println("post_no : "+post_no);
		if(service.deletePost(post_no)) {
			return "redirect:toWrite.do";
		}else {
			return "error";
		}
	}
	
	@RequestMapping("/toModifyPost.do")
	public String toModifyPost(int post_no, Model model) throws Exception{
		System.out.println(post_no);
		PostDTO postDto = service.getPostInfo(post_no);
		ImageDTO imageDto = imageService.getThumbNail(post_no);
		CategoryDTO categoryDto = categoryService.getCategory(postDto.getCategory_no());
		ProductDTO productDto = productService.getProduct(postDto.getProduct_no());
		List<String> parentCategory = categoryService.getParentCategory();
		List<CategoryDTO> childCategory = categoryService.getChildCategory(categoryDto.getParent_group());
		model.addAttribute("PostDTO",postDto);
		model.addAttribute("CategoryDTO",categoryDto);
		model.addAttribute("ImageDTO",imageDto);
		model.addAttribute("ProductDTO",productDto);
		model.addAttribute("ParentCategory", parentCategory);
		model.addAttribute("ChildCategory",childCategory);
		
//		model.addAttribute("PostDTO",dto);
		return "onlinePost/onlinePostModify";
	}
	 
	@RequestMapping("/modify.do")
	public String modify(int post_no, PostDTO dto,MultipartFile thumbNail) throws Exception{
		System.out.println("수정될 post_no : "+post_no);
		dto.setPost_no(post_no);
		service.updatePost(dto);
		if(thumbNail!=null) {
			String realPath = session.getServletContext().getRealPath("onlinePostThumbNail");
			System.out.println(realPath);
			imageService.updateThumbNail(realPath, thumbNail,post_no);
		}
//		//파일 처리
//		String realPath = session.getServletContext().getRealPath("onlinePostThumbNail");
//		System.out.println(realPath);
//		imageService.insertThumbNail(realPath, thumbNail,post_no);
		return "redirect:toWrite.do";
		//여기에 어드민 게시글 조회 부분링크로 가면 좋을듯
	}
}
