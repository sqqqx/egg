package egg.finalproject.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminOrderController {

	// @Autowired
	// private AdminOrderService service;
	
	@RequestMapping("/toOrderManagement")
	public String toOrderManagement() throws Exception {
		return "redirect:/admin/getOrderList.do?currentIdx=1";
	}
	
	@RequestMapping("/getOrderList.do")
	public String getOrderList(Model model, int currentIdx) throws Exception {
		return "admin/orderManagement";
	}
	
}
