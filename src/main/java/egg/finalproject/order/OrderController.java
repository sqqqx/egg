package egg.finalproject.order;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderService service;
	    
	    //주문 페이지로 이동
		//TempOrderDTO : ProductDTO + quantity 
		//RETURN : 주문페이지 주소값 반환 (TempOrderDTO 보냄) 
		@RequestMapping("/toOrder.do")
		public String toOrder(int product_no,int quantity, Model model) throws Exception{
			TempOrderDTO dto = service.getTempOrderInfo(product_no); //product_no에 해당하는 ProductDTO정보를 먼저 담고
			dto.setQuantity(quantity); // 수량을 같이 담아서 넘긴다.
			System.out.println(dto);
			List<TempOrderDTO> cartList = new ArrayList<>();  //장바구니와 같은 페이지로 넘기기 때문에 같이 list로 맞춰주기 위함.
			cartList.add(dto);
			model.addAttribute("cartList",cartList);
			return "order/order";
		}
}
