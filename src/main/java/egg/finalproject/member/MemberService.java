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
}