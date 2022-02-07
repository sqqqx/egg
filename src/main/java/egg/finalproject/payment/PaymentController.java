package egg.finalproject.payment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egg.finalproject.cart.CartService;
import egg.finalproject.member.MemberDTO;
import egg.finalproject.order.OrderDTO;
import egg.finalproject.order.OrderService;
import egg.finalproject.product.ProductService;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	@Autowired
	private PaymentService service;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ProductService productService;
	@Autowired
	private CartService cartService;
	@Autowired
	private HttpSession session;
	
	// (마이페이지) 결제 페이지로 이동
	@RequestMapping("/toPayment")
	public String toPayment(Model model, OrderDTO dto, String[] productNames, String[] productQuantities, String[] productNos, IamportPayment buyer_info) throws Exception {
		/* 주문 내역을 DB 저장 - 결제 페이지로 이동(아직까지 결제 상태는 ready)*/
		System.out.println("PaymentController / 결제페이지로 이동 접근");
		System.out.println("OrderDTO - " + dto);

		// 상품이 여러개 인 경우
		// 상품 번호
		int i = 0;
		for(String n : productNos) {
			System.out.println(++i + "상품 번호: " + n);
		}
		
		// 이름
		String productName = "";
		System.out.println("productName 개수 - " + productNames.length);
		i = 0;
		for(String p : productNames) {
			System.out.println(++i + "상품명: " + p);
		}
		// 개수
		System.out.println("productQuntaties 개수 - " + productQuantities.length);
		i = 0;
		for(String q : productQuantities) {
			System.out.println(++i + "상품개수: " + q);
		}
		
		System.out.println("IamportPaymentDTO - buyer_info:" + buyer_info.toString());
		
		// 주문 테이블 저장
		if(orderService.insertOrder(dto) >0) {
			System.out.println("주문테이블 저장 성공");
			// 방금 저장한 마지막 주문번호
			String merchant_uid = orderService.getLastOrder_no(dto.getUser_id());

			// 주문상품 테이블에 저장
			if(productNames.length > 1) {	// 상품이 여러개일 경우
				// payment.jsp에 넘길 상품명 지정
				productName = productNames[0] + "외 " + (productNames.length-1) + "개";
				
				for(i = 0; i < productNos.length; i++) {
					Map<String, Object> map = new HashMap<>();
					
					// 주문번호
					map.put("order_no", merchant_uid);
					// 상품번호
					map.put("product_no", Integer.parseInt(productNos[i]));
					// 수량
					map.put("quantity", Integer.parseInt(productQuantities[i]));
					
					System.out.println(i + "번째 상품추가 / 주문번호" + merchant_uid + ", 상품번호: " + productNos[i] + ", 수량: " + productQuantities[i]);
					orderService.insertOrderProduct(map);
				}
				
			} else {
				productName = productNames[0];
			}
			
			// payment.jsp로 넘겨줘야 할 것
			// merchant_uid (주문고유번호)
			buyer_info.setMerchant_uid(merchant_uid);
//			 name (상품명)
			buyer_info.setName(productName);
//			 amount (결제 총금액)
			buyer_info.setAmount(dto.getCost());
			System.out.println(buyer_info.toString());
			model.addAttribute("iamdto", buyer_info);
			return "/payment/payment";
		} else {
			System.out.println("주문테이블 저장 실패");
			return "/error";
		}
		
	}
	
	// (마이페이지) 결제 성공 후 결제내역 저장
	@RequestMapping(value="/completePaid.do", produces="application/json;charset=UTF-8")
	@ResponseBody()
	public String completePaid(PaymentDTO dto) throws Exception {
		System.out.println("PaymentController / 결제내역 저장 - PaymentDTO : " + dto);
		
		if(service.completePaid(dto) > 0) {	// 결제 성공 시
			System.out.println("결제 성공");
			// 재고 수량 수정
			productService.modifyStock(dto.getPayment_no(), 0);	// 매개변수1: 주문번호, 매개변수2: 0(감소) / 1(증가)
			System.out.println("재고 수량 조정 마침");
			// 장바구니 비우기
			cartService.clearCart(((MemberDTO)session.getAttribute("loginSession")).getUser_id());
			System.out.println("장바구니 비우기 마침");
			return "success";
		} else {
			System.out.println("결제 실패");
			if(orderService.deleteLastOrder(dto.getPayment_no()) > 0) {
				System.out.println("추가했던 주문테이블에 데이터 삭제완료");
				return "fail";
			} else {
				System.out.println("주문 테이블 데이터 삭제 실패");
				return null;
			}
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
