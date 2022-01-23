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
	
	public int insertMember(String user_id, String password, String user_nickname, String email, String phone, String address) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("password", password);
		map.put("user_nickname", user_nickname);
		map.put("email", email);
		map.put("phone", phone);
		map.put("address", address);
		return session.insert("memberMapper.insertMember", map);
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
	
	public int nicknameCheck(String nickname) throws Exception{
		return session.selectOne("memberMapper.nicknameCheck", nickname);
	}
	
	public int emailCheck(String email) throws Exception{
		return session.selectOne("memberMapper.emailCheck", email);
	}
	
	public String toIdFind(String phone) throws Exception {
		return session.selectOne("memberMapper.idFind", phone);
	}
	
	
	
	
/////↑↑↑↑↑↑회원가입 및 로그인↑↑↑↑↑↑/////////↓↓↓↓↓↓마이페이지↓↓↓↓↓↓/////////////////////////////
	
	
	// (마이페이지) ID로 회원정보 DTO 불러오기
	public MemberDTO getDTOById(String user_id) throws Exception {
		System.out.println("MemberDAO 회원정보 불러오기 user_id - " + user_id);
		MemberDTO dto = session.selectOne("memberMapper.getDTOById", user_id);
		System.out.println("MemberDAO / DTO - " + dto);
		return session.selectOne("memberMapper.getDTOById", dto);
	}
	
	// (마이페이지) (마이페이지) 회원탈퇴 요청
	public int withdrawal(String user_id) throws Exception {
		System.out.println("MemberDAO / 회원탈퇴 user_id - " + user_id); 
		return session.delete("memberMapper.withdrawal", user_id);
	}
	
	// (마이페이지) 회원정보 수정요청
	public int modify(MemberDTO dto) throws Exception {
		System.out.println("MemberDAO / 회원정보수정 dto - " + dto);
		//return session.update("memberMapper.modify", dto);
		int rs = session.update("memberMapper.modify", dto);
		System.out.println("dao 실행 완료 ");
		return rs;
	}
	
	// (마이페이지) 비밀번호 수정 요청
	public int modifyPassword(String user_id, String password) throws Exception {
		System.out.println("MemberDAO / 비밀번호수정 id & pw - " + user_id + " & " + password);
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("password", password);
		return session.update("memberMapper.modifyPassword", map);
	}
}
