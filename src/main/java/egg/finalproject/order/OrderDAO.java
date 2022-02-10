package egg.finalproject.order;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {
	@Autowired
	private SqlSession session;
	
	//product_no로 ProductDTO를 얻어와 controller에서 수량 담아서 반환
	//RETURN : ProductDTO만 담긴 TempOrderDTO
	public TempOrderDTO getTempOrderInfo(int product_no) throws Exception{
		TempOrderDTO dto = session.selectOne("orderMapper.tempOrderInfo",product_no);
		System.out.println("OrderDAO / 주문정보 mapper거친 후 - dto: " + dto);
		return dto;
		//return session.selectOne("orderMapper.tempOrderInfo",product_no);
	}
	
	// (마이페이지) 당일 주문량 조회
		public int countOrder() throws Exception {
			System.out.println("OrderDAO / 당일 주문량 조회");
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
			String today = sdf.format(System.currentTimeMillis());
			today = today.substring(0,2) + "/" + today.substring(2,4) + "/" + today.substring(4);
			return session.selectOne("orderMapper.countOrder", today);
		}
	
	// (마이페이지) 환불 처리
	public int refund(String merchant_uid) throws Exception {
		return session.update("orderMapper.refund", merchant_uid);
	}
	
	// (마이페이지) 주문정보 저장
	public int insertOrder(OrderDTO odto) throws Exception {
		System.out.println("OrderDAO / 주문정보 저장 - OrderDTO - " + odto);
		return session.insert("orderMapper.insertOrder", odto);
	}
	
	// (마이페이지) 마지막 주문번호 불러오기
	public String getLastOrder_no(String user_id) throws Exception {
		System.out.println("OrderDAO / 마지막 주문 번호 불러오기 - user_id: " + user_id);
		return session.selectOne("orderMapper.getLastOrder_no", user_id);
	}
	
	// (마이페이지) 마지막 주문 건 삭제
		public int deleteLastOrder(String merchant_uid) throws Exception {
			System.out.println("OrderDAO / 마지막 주문 건 삭제 - merchant_uid: " + merchant_uid);
			return session.delete("orderMapper.deleteLastOrder", merchant_uid);
		}
		
	// (마이페이지) 주문상품 저장
		public int insertOrderProduct(Map map) throws Exception {
			System.out.println("OrderDAO / 주문상품 저장 - map: " + map);
			return session.insert("orderMapper.insertOrderProduct", map);
		}
		
	// (마이페이지) 주문상품 불러오기
		public List<OrderProduct> getOrderProduct(String order_no) throws Exception {
			System.out.println("OrderDAO / 주문상품 불러오기 - order_no: " + order_no);
			return session.selectList("orderMapper.getOrderProduct", order_no);
		}
		
		////////////////////마이페이지 주문 결제 조회 영역 ///////////////////
		
		// 이용자 별 주문정보 가져오기
		public List<Map<String, Object>> getOrderList(Map<String, Object> map) throws Exception {
			return session.selectList("orderMapper.getOrderList", map);
		}
		
		// 주문정보 COUNT
		public int getOrderCount(Map<String, Object> map) throws Exception {
			return session.selectOne("orderMapper.getOrderCount", map);
		}
}
