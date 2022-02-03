package egg.finalproject.order;

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
		return session.selectOne("orderMapper.tempOrderInfo",product_no);
	}
}
