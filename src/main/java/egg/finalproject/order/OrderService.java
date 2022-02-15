package egg.finalproject.order;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egg.finalproject.admin.Paging;
import egg.finalproject.member.MemberDTO;

@Service
public class OrderService extends Paging {
	@Autowired
	private OrderDAO dao;
	@Autowired
	private HttpSession session;
	
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
			// (추가) 결제 미완료 건 삭제
			// 마지막 주문번호 불러오기(user_id, tracking_no)
			System.out.println("결제 미완료 건 삭제");
			List<String> merchant_uid = new ArrayList<>();
			Map<String, String> info = new HashMap<>();
			info.put("user_id", odto.getUser_id());
			// 상품인 경우
			info.put("tracking_no", "PRODUCT");
			System.out.println("결제 미완료 건 삭제 - 상품: " + info);
			merchant_uid.add(dao.getLastOrder_no(info));
			
			// 포인트인 경우
			System.out.println("결제 미완료 건 삭제 - 포인트: " + info);
			info.put("tracking_no", "POINT");
			merchant_uid.add(dao.getLastOrder_no(info));
			
			for(String m : merchant_uid) {
				System.out.println("결제테이블 검색 merchant_uid: " + m);
				// 주문테이블에 있는 주문번호가 결제테이블에 없는 경우 주문번호 삭제
				if(dao.checkPayment(m) == 0) {
					if(dao.deleteLastOrder(m) > 0) {
						System.out.println("주문번호 " + m + " 삭제완료");
					};
					if(dao.deleteOrderproduct(m) > 0) {
						System.out.println("주문상품 주문번호 " + m + " 삭제완료");
					}
				}
			}
			
			// OrderDTO order_no 설정
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String today = sdf.format(System.currentTimeMillis());
			if(!odto.getTracking_no().equals("point")) {	// 상품인 경우
				odto.setOrder_no("ORD" + today + "-" + String.format("%04d", (dao.countOrder(odto.getTracking_no())+1)));
			} else {	// 포인트인 경우
				odto.setOrder_no("POINT" + today + "-" + String.format("%04d", (dao.countOrder(odto.getTracking_no())+1)));
			}
			System.out.println("insertOrder / DTO - " + odto);
			return dao.insertOrder(odto);
		}
		
	// (마이페이지) 환불 처리
		public int refund(String merchant_uid) throws Exception {
			System.out.println("OrderService / 환불처리 - merchant_uid: " + merchant_uid);
			return dao.refund(merchant_uid);
		}
		
	// (마이페이지) 마지막 주문번호 불러오기
		public String getLastOrder_no(Map info) throws Exception {
			System.out.println("OrderService / 마지막 주문번호 불러오기 - info: " + info);
			return dao.getLastOrder_no(info);
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
		
		//////////////////// 마이페이지 주문 결제 조회 영역 ///////////////////
		
		// 이용자 별 주문정보 가져오기
		public List<Map<String, Object>> getOrderList(String user_id, String searchOption, String searchKeyword, Map<String, Object> range) throws Exception {
			System.out.println("user_id : " + user_id + " : searchOption : " + searchOption + " : searchKeyword : " + searchKeyword + " : sRange : " + range.get("startRange") + " : eRange : " + range.get("endRange"));
			// (추가) 결제 미완료 건 삭제
						// 마지막 주문번호 불러오기(user_id, tracking_no)
						System.out.println("결제 미완료 건 삭제");
						List<String> merchant_uid = new ArrayList<>();
						Map<String, String> info = new HashMap<>();
						info.put("user_id", user_id);
						// 상품인 경우
						info.put("tracking_no", "PRODUCT");
						System.out.println("결제 미완료 건 삭제 - 상품: " + info);
						merchant_uid.add(dao.getLastOrder_no(info));
						
						// 포인트인 경우
						System.out.println("결제 미완료 건 삭제 - 포인트: " + info);
						info.put("tracking_no", "POINT");
						merchant_uid.add(dao.getLastOrder_no(info));
						
						for(String m : merchant_uid) {
							System.out.println("결제테이블 검색 merchant_uid: " + m);
							// 주문테이블에 있는 주문번호가 결제테이블에 없는 경우 주문번호 삭제
							if(dao.checkPayment(m) == 0) {
								if(dao.deleteLastOrder(m) > 0) {
									System.out.println("주문번호 " + m + " 삭제완료");
								};
								if(dao.deleteOrderproduct(m) > 0) {
									System.out.println("주문상품 주문번호 " + m + " 삭제완료");
								}
							}
						}
						
			Map<String, Object> map = new HashMap<>();
			if(searchOption != null && searchKeyword != null) {
				map.put("searchOption", searchOption);
				map.put("searchKeyword", searchKeyword);
			}
			map.put("user_id", user_id);
			map.put("startRange", range.get("startRange"));
			map.put("endRange", range.get("endRange"));
			List<Map<String, Object>> list = dao.getOrderList(map);
			return list;
		}
		
		// 주문정보 COUNT
		public void getOrderCount(String user_id, String searchOption, String searchKeyword) throws Exception {
			System.out.println("user_id : " + user_id + " : searchOption : " + searchOption + " : searchKeyword : " + searchKeyword);
			Map<String, Object> map = new HashMap<>();
			if(searchOption != null && searchKeyword != null) {
				map.put("searchOption", searchOption);
				map.put("searchKeyword", searchKeyword);
			}
			map.put("user_id", user_id);
			int rs = dao.getOrderCount(map);
			System.out.println("주문정보 COUNT : " + rs);
			this.totalCount = rs;
		}
}
