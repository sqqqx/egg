package egg.finalproject.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentService {
	@Autowired
	private PaymentDAO dao;
	
	// (마이페이지) 결제 성공 후 결제내역 저장
	public int completePaid(PaymentDTO dto) throws Exception {
		System.out.println("PaymentService / 결제내역 저장 - PaymentDTO: " + dto);
		return dao.completePaid(dto);
	}
	
}
