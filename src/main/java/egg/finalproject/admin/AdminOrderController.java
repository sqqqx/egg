package egg.finalproject.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	// 주문 상태 확인
	@RequestMapping("/checkOrder.do")
	@ResponseBody
	public String checkOrder(String payment_no) throws Exception {
		return service.checkOrder(payment_no);
	}
	
	// 결제 취소
	/*
	 * @RequestMapping(value = "/canclePay.do")
	 * 
	 * @ResponseBody public String canclePay(String payment_no, String cost, String
	 * order_no) throws Exception { System.out.println("uid : " + payment_no +
	 * " : cost : " + cost + " : " + order_no); String rs =
	 * service.canclePay(service.getToken(), payment_no); // 추가 정보 필요하면 같이 넘길 것
	 * if(rs.equals("success")) { service.updateStatus(order_no); return "success";
	 * } return "fail"; }
	 */
	
	// 주문 상세 정보
	@RequestMapping("/orderDetailView")
	public String orderDetailView(Model model, String order_no) throws Exception {
		model.addAttribute("map", service.getOrderDetail(order_no));
		return "admin/orderDetail";
	}
	
	// 배송지 변경
	@RequestMapping("/changeAddress.do")
	@ResponseBody
	public String changeAddress(String address, String order_no) throws Exception {
		return service.changeAddress(address, order_no) == 1 ? "success" : null;
	}
	
}
