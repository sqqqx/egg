package egg.finalproject.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egg.finalproject.member.MemberDTO;
import egg.finalproject.member.MemberService;
import egg.finalproject.order.TempOrderDTO;

@Controller
@RequestMapping(value="/cart")
public class CartController {

	@Autowired
	private CartService service;
	@Autowired
	private MemberService mService;
	
	@RequestMapping(value="/insertCart.do")
	@ResponseBody
	public int insertCart(CartDTO dto) throws Exception {
		int check = service.selectById(dto.getUser_id(), dto.getProduct_no());
		if(check==1) {
			return -1;
		}else {
			return service.insertCart(dto);	
		}
	}
	
	@RequestMapping(value="/selectCart.do")
	public String selectCart(String user_id, Model model) throws Exception{
		List<TempOrderDTO> list = service.selectCart(user_id);
		model.addAttribute("list", list);
		return "cart/cart";
	}
	
	@RequestMapping(value="/selectCartForMe.do")
	public String selectCartForMe(String user_id, Model model) throws Exception{
		List<TempOrderDTO> list = service.selectCart(user_id);
		MemberDTO dto = mService.getDTOById(user_id);
		model.addAttribute("dto", dto);
		model.addAttribute("list", list);
		return "member/memberCart";
	}
	
	@RequestMapping(value="/deleteCart.do")
	public String deleteCart(String name, String user_id) throws Exception{
		service.deleteCart(name);
		return "redirect:/cart/selectCart.do?user_id="+user_id;
	}
	
	@RequestMapping(value="/deleteCartForMe.do")
	public String deleteCartForMe(String name, String user_id, Model model) throws Exception{
		service.deleteCart(name);
		MemberDTO dto = mService.getDTOById(user_id);
		model.addAttribute("dto", dto);
		return "redirect:/cart/selectCartForMe.do?user_id="+user_id;
	}
	
	@RequestMapping(value="/updateQuantity.do")
	@ResponseBody
	public String updateQuantity(String name, int quantity) throws Exception{
		
		if(service.updateQuantity(name, quantity)==1) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@RequestMapping(value="/toOrder.do")
	public String toOrder(Model model, String user_id) throws Exception{
		List<TempOrderDTO> list = service.selectCart(user_id);
		model.addAttribute("orderList", list);
		model.addAttribute("route", "cart");
		return "order/order";
		
	}
}

