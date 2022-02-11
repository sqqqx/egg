package egg.finalproject.order;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egg.finalproject.member.MemberDTO;
import egg.finalproject.member.MemberService;
import egg.finalproject.post.PostDTO;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderService service;
	@Autowired
	private HttpSession session;

	// 주문 페이지로 이동
	// TempOrderDTO : ProductDTO + quantity
	// RETURN : 주문페이지 주소값 반환 (TempOrderDTO 보냄)
	@RequestMapping("/toOrder.do")
	public String toOrder(int product_no, int quantity, Model model) throws Exception {
		TempOrderDTO dto = service.getTempOrderInfo(product_no); // product_no에 해당하는 ProductDTO정보를 먼저 담고
		dto.setQuantity(quantity); // 수량을 같이 담아서 넘긴다.
		System.out.println(dto);
		List<TempOrderDTO> orderList = new ArrayList<>(); // 장바구니와 같은 페이지로 넘기기 때문에 같이 list로 맞춰주기 위함.
		orderList.add(dto);
		model.addAttribute("orderList", orderList);
		return "order/order";
	}
	
	// (마이페이지) 주문 결제 조회로 이동
	@RequestMapping("/toMyOrder")
	public String toMyOrder(int currentPage, String searchOption, String searchKeyword, Model model) throws Exception {
		MemberDTO dto = ((MemberDTO)session.getAttribute("loginSession"));
		service.getOrderCount(dto.getUser_id(), searchOption, searchKeyword);
		Map<String, Object> navi = service.getNavi(currentPage);
		Map<String, Object> range = service.getRange(currentPage);
		List<Map<String, Object>> list = service.getOrderList(dto.getUser_id(), searchOption, searchKeyword, range);
		
		model.addAttribute("navi", navi);
		model.addAttribute("list", list);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("dto", dto);
		return "member/myorder";
	}

}
