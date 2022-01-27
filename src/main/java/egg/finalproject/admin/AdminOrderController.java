package egg.finalproject.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin")
public class AdminOrderController {

	@Autowired
	private AdminOrderService service;
	
	// 주문 관리 페이지 이동
	@RequestMapping("/toOrderManagement")
	public String toOrderManagement() throws Exception {
		return "redirect:/admin/getOrderList.do?currentIdx=1";
	}
	
	// 주문 목록 가져오기
	@RequestMapping("/getOrderList.do")
	public String getOrderList(Model model, int currentIdx, String searchOption, String searchKeyword) throws Exception {
		model.addAttribute("list", service.getOrderList(currentIdx, searchOption, searchKeyword));
		model.addAttribute("map", service.getNavi(currentIdx));
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchKeyword", searchKeyword);
		return "admin/orderManagement";
	}
	
	// 상품 목록 가져오기
	@RequestMapping("/getProductList.do")
	@ResponseBody
	public List<Map<String, Object>> getProductList(int order_no) throws Exception {
		return service.getProductList(order_no);
	}
	
	// 결제 정보 catch
//	@RequestMapping(value = "/canclePay.do", method = RequestMethod.POST)
//	@ResponseBody
//	public String canclePay(HttpServletRequest request) throws Exception {
//		return "test RS";
//	}
	
	
}
