package egg.finalproject.order;

import java.text.SimpleDateFormat;

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
}
