package egg.finalproject.payment;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egg.finalproject.order.OrderDTO;
import egg.finalproject.order.OrderService;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	@Autowired
	private PaymentService service;
	@Autowired
	private OrderService orderService;
	
	// (마이페이지) 결제 페이지로 이동
	@RequestMapping("/toPayment")
	public String toPayment() {
		return "/payment/payment";
	}
	
	// (마이페이지) 주문 - 결제 연결 임시 ******************************************************************************
	@RequestMapping("/test")
	public void test(OrderDTO dto) throws Exception {
		System.out.println("PaymentController / test 접근");
		System.out.println("OrderDTO - " + dto);
		
//		orderService.insertOrder(dto);
		
		
		
		
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
	
	// (마이페이지) 환불 처리
	@RequestMapping(value="/refund.do", produces="application/json;charset=UTF-8")
	@ResponseBody()
	public String refund(String merchant_uid) throws Exception {
		// 매개변수로 아임포트 주문고유번호 필요
		
		// 아임포트 Token 얻어오기
		String access_token = service.getToken();
		
		// 환불 처리
		merchant_uid = "ORD20180131-0000024";	// 작동확인을 위해 명시적으로 임시값 지정
		if(service.refund(access_token, merchant_uid).equals("success")){
			System.out.println("아임포트 환불처리 완료");
			if(orderService.refund(merchant_uid) > 0) {
				System.out.println("주문테이블 주문상태 취소로 변경");
				return "success";
			} else {
				System.out.println("주문테이블 주문상태 변경 실패");
				return "fail";
			}
		} else {
			return "fail";
		}
	}
}
