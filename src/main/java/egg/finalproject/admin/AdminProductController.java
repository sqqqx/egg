package egg.finalproject.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminProductController {

	@Autowired
	private AdminProductService service;
	
	// 제품 관리 페이지 이동
	@RequestMapping("/toProductManagement")
	public String toProductManagement() throws Exception {
		return "redirect:/admin/getProductsList.do?currentIdx=1";
	}
	
	// 제품 목록 가져오기
	@RequestMapping("/getProductsList.do")
	public String getProductsLists(Model model, int currentIdx, String searchOption, String searchKeyword) throws Exception {
		model.addAttribute("list", service.getProductsList(currentIdx, searchOption, searchKeyword));
		model.addAttribute("map", service.getNavi(currentIdx));
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchKeyword", searchKeyword);
		return "admin/productManagement";
	}
	
}
