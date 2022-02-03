package egg.finalproject.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egg.finalproject.order.TempOrderDTO;

@Repository
public class CartDAO {

	@Autowired
	private SqlSession session;
	
	public int insertCart(CartDTO dto) throws Exception{
		return session.update("cartMapper.insertCart", dto);
	}
	
	public List<TempOrderDTO> selectCart(String user_id) throws Exception{
		return session.selectList("cartMapper.selectCart", user_id);
	}
	
	public int deleteCart(String name) throws Exception{
		return session.update("cartMapper.deleteCart",name);
	}
	
	public int selectById(String user_id, int product_no) throws Exception{
		Map<String,Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("product_no", product_no);
		return session.selectOne("cartMapper.selectById", map);
	}
	public int updateQuantity(String name, int quantity) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("quantity", quantity);
		map.put("name", name);
		return session.update("cartMapper.updateQuantity",map);
	}
}