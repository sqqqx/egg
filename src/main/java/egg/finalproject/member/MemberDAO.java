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
<<<<<<< HEAD

=======
	
>>>>>>> dbc477f55c0adcb707121b1b3c555aa3616cc455
	public int idCheck(String id) throws Exception{
		System.out.println("DAO 확인 : " + id);
		return session.selectOne("memberMapper.idCheck", id);
	}
<<<<<<< HEAD
<<<<<<< HEAD
}
=======
}
>>>>>>> dbc477f55c0adcb707121b1b3c555aa3616cc455
=======
	
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
>>>>>>> e029e4299cecb740d003cab8818abadd68b33d0f
