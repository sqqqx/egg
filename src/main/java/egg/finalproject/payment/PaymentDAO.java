package egg.finalproject.payment;

import java.text.SimpleDateFormat;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAO {
	@Autowired
	private SqlSession session;
	
	// (마이페이지) 결제 성공 후 결제내역 저장
	public int completePaid(PaymentDTO dto) throws Exception {
		System.out.println("PaymentDAO / 결제내역 저장 - PaymentDTO: " + dto);
		return session.insert("paymentMapper.completePaid", dto);
	}
}
