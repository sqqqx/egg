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
	
	// (마이페이지) ID로 회원정보 DTO 불러오기
	public MemberDTO getDTOById(String user_id) throws Exception {
		System.out.println("MemberService 회원정보 불러오기 user-id : " + user_id);
		return dao.getDTOById(user_id);
	}
	
	// (마이페이지) (마이페이지) 회원탈퇴 요청
	public int withdrawal(String user_id) throws Exception {
		System.out.println("MemberService / 회원탈퇴 user_id - " + user_id); 
		return dao.withdrawal(user_id);
	}
	
}