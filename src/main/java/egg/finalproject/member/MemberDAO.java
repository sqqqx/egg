package egg.finalproject.member;

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
}
=======
}
>>>>>>> dbc477f55c0adcb707121b1b3c555aa3616cc455
