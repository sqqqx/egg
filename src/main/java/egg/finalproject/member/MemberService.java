package egg.finalproject.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	private MemberDAO dao;
	
	public boolean idCheck(String id) throws Exception{
		System.out.println("서비스 확인 : " + id);
		if(dao.idCheck(id) == 1) { 
			return false;
		}else {
			return true;
		}
	}
	
	public int insertMember(MemberDTO dto) throws Exception{
		return dao.insertMember(dto);
	}
	
	public boolean isLoginOk(String user_id, String password) throws Exception{
		if(dao.isLoginOk(user_id, password) == 1) {
			return true;
		}else {
			return false;
		}
	}
	
	public MemberDTO getMember(String user_id) throws Exception{
		return dao.getMember(user_id);
	}
	
}