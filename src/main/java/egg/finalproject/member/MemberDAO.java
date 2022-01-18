package egg.finalproject.member;

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
}