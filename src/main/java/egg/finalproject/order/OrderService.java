package egg.finalproject.order;

import java.text.SimpleDateFormat;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
	@Autowired
	private OrderDAO dao;
	
	//TempOrderDTO : ProductDTO(상품정보) + quantity(구매 수량)
		//(product_no에 해당하는 상품 정보 + 고객 구매 희망 수량)
		//RETURN : TempOrderDTO반환
		public TempOrderDTO getTempOrderInfo (int product_no) throws Exception{
			System.out.println("OrderService / 주문정보 - product_no: "  + product_no);
			return dao.getTempOrderInfo(product_no);
		}
		
	// (마이페이지) 주문정보 저장
		public int insertOrder(OrderDTO odto) throws Exception {
			System.out.println("OrderService / 주문정보저장 - OrderDTO: " + odto);
			
			// OrderDTO order_no 설정
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String today = sdf.format(System.currentTimeMillis());
			odto.setOrder_no("ORD" + today + "-" + String.format("%04d", (dao.countOrder()+1)));
			System.out.println("insertOrder / DTO - " + odto);
			return dao.insertOrder(odto);
		}
		
	// (마이페이지) 환불 처리
		public int refund(String merchant_uid) throws Exception {
			System.out.println("OrderService / 환불처리 - merchant_uid: " + merchant_uid);
			return dao.refund(merchant_uid);
		}
		
	// (마이페이지) 마지막 주문번호 불러오기
		public String getLastOrder_no(String user_id) throws Exception {
			System.out.println("OrderService / 마지막 주문번호 불러오기 - user_id: " + user_id);
			return dao.getLastOrder_no(user_id);
		}
		
	// (마이페이지) 마지막 주문 건 삭제
		public int deleteLastOrder(String merchant_uid) throws Exception {
			System.out.println("OrderService / 마지막 주문 건 삭제 - merchant_uid: " + merchant_uid);
			return dao.deleteLastOrder(merchant_uid);
		}
		
	// (마이페이지) 주문상품 저장
		public int insertOrderProduct(Map map) throws Exception {
			System.out.println("OrderService / 주문상품 저장 - map: " + map.toString());
			return dao.insertOrderProduct(map);
		}
}
