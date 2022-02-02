package egg.finalproject.payment;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	@Autowired
	private PaymentService service;
	
	// (마이페이지) 결제 페이지로 이동
	@RequestMapping("/toPayment")
	public String toPayment() {
		return "/payment/payment";
	}
	
	// (마이페이지) 결제 성공 후 결제내역 저장
	@RequestMapping(value="/completePaid.do", produces="application/json;charset=UTF-8")
	@ResponseBody()
	public String completePaid(PaymentDTO dto) throws Exception {
		System.out.println("PaymentController / 결제내역 저장 - PaymentDTO : " + dto);
		if(service.completePaid(dto) > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// (마이페이지) 환불 페이지로 이동
	@RequestMapping("/toRefund")
	public String toRefund() {
		return "/payment/refund";
	}
	
	
}
