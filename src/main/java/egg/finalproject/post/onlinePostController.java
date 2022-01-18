package egg.finalproject.post;

import java.io.File;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import egg.finalproject.category.CategoryDTO;
import egg.finalproject.product.ProductDTO;

@Controller
@RequestMapping("/onlinePost")
public class onlinePostController {
	@Autowired
	private onlinePostService service;
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
	public void insert(PostDTO dto) throws Exception{
		System.out.println("user_nickname"+dto.getUser_nickname());
		System.out.println("category_no"+dto.getCategory_no());
		System.out.println("title"+dto.getTitle());
		System.out.println("content"+dto.getContent());
		System.out.println("product_no"+dto.getProduct_no());
	}
	
	
	
	
	@RequestMapping(value="/getPicUrl.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> summerimage(@RequestParam("file") MultipartFile img, HttpServletRequest request) throws Exception {
		System.out.println("들어오긴함");
//		String realPath = session.getServletContext().getRealPath("upload");
		
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		Random random = new Random();
	
		long currentTime = System.currentTimeMillis();
		int	randomValue = random.nextInt(100);
		String fileName = Long.toString(currentTime) + "_"+randomValue+"_a_"+img.getOriginalFilename();
		
		File realPathFile = new File(fileRoot);
		if(!realPathFile.exists()) {
	    	realPathFile.mkdir(); //경로가 존재하지 않는 경우 파일을 새로 생성하는 작업.
	    }
		img.transferTo(realPathFile);
		String ori_name = img.getOriginalFilename();
		String sys_name = UUID.randomUUID() + "_"+ori_name;
		service.insertFile(ori_name,sys_name);
		return ResponseEntity.ok().body(realPathFile+sys_name);

	}
	
//	@RequestMapping(value="/getPicUrl.do", method=RequestMethod.POST)
//	public ResponseEntity<?> summerimage(@RequestParam("file") MultipartFile img, HttpServletRequest request) throws IOException {
//		String path = request.getServletContext().getRealPath("resources/theme/summerimages");
//		Random random = new Random();
//	
//		long currentTime = System.currentTimeMillis();
//		int	randomValue = random.nextInt(100);
//		String fileName = Long.toString(currentTime) + "_"+randomValue+"_a_"+img.getOriginalFilename();
//		
//		File file = new File(path , fileName);
//		img.transferTo(file);
//		return ResponseEntity.ok().body("resources/summerimages/"+fileName);

//	}
}
