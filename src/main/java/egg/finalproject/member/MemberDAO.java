package egg.finalproject.member;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class MemberDAO {
	@Autowired
	private SqlSession session;
	
	public int idCheck(String id) throws Exception{
		System.out.println("DAO 확인 : " + id);
		return session.selectOne("memberMapper.idCheck", id);
	}
	
	public int insertMember(MemberDTO dto) throws Exception{
		return session.insert("memberMapper.insertMember", dto);
	}
	
	public int isLoginOk(String user_id, String password) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("id", user_id);
		map.put("pw", password);
		return session.selectOne("memberMapper.isLoginOk", map);
	}
	
	public MemberDTO getMember(String user_id) throws Exception{
		return session.selectOne("memberMapper.getMember", user_id);
	}
	
}