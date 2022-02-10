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
	
	// 아이디 중복확인
	public int idCheck(String id) throws Exception{
		return session.selectOne("memberMapper.idCheck", id);
	}
	
	// 회원가입
	public int insertMember(String user_id, String password, String user_nickname, String email, String phone, String address, String profile_path) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("password", password);
		map.put("user_nickname", user_nickname);
		map.put("email", email);
		map.put("phone", phone);
		map.put("address", address);
		map.put("profile_path", profile_path);
		return session.insert("memberMapper.insertMember", map);
	}
	
	// 로그인
	public int isLoginOk(String user_id, String password) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("id", user_id);
		map.put("pw", password);
		return session.selectOne("memberMapper.isLoginOk", map);
	}
	
	// 로그인시 세션에 아이디 값 담기위해
	public MemberDTO getMember(String user_id) throws Exception{
		return session.selectOne("memberMapper.getMember", user_id);
	}
	
	// 닉네임 중복검사
	public int nicknameCheck(String nickname) throws Exception{
		return session.selectOne("memberMapper.nicknameCheck", nickname);
	}
	
	// 이메일 중복검사
	public int emailCheck(String email) throws Exception{
		return session.selectOne("memberMapper.emailCheck", email);
	}
	
	// 휴대전화 중복검사
	public int phoneCheckSignup(String phone) throws Exception{
		return session.selectOne("memberMapper.phoneCheckSignup", phone);
	}
	
	// 아이디 찾기
	public String toIdFind(String phone) throws Exception {
		return session.selectOne("memberMapper.idFind", phone);
	}
	
	// 이메일 아이디 찾기
	public String toEmailIdFind(String email) throws Exception {
		return session.selectOne("memberMapper.emailIdFind", email);
	}
	
	public int getPwId(String id, String phone) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("phone", phone);
		return session.selectOne("memberMapper.getPwId", map);
	}
	
	public int getPwMailId(String id, String email) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("email", email);
		return session.selectOne("memberMapper.getPwMailId", map);
	}
	
	// 비밀번호 찾기(수정)
	public int toPwFind(String password, String user_id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("password", password);
		return session.update("memberMapper.pwFind", map);
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
	
	// (마이페이지) 휴대전화 중복검사
	public boolean phoneCheck(String phone) throws Exception {
		System.out.println("MemberDAO / 휴대전화 중복검사 phone - " + phone);
		if((int)session.selectOne("memberMapper.phoneCheck", phone) > 0) {
			return false;
		} else {
			return true;
		}
	}
	
	// (마이페이지) 프로필 사진 변경
	public int modifyPP(String user_id, String sys_name) throws Exception {
		System.out.println("MemberDAO / modifyPP - user_id: " + user_id + " / sys_name: " + sys_name);
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("sys_name", sys_name);
		return session.update("memberMapper.modifyPP", map);
	}
	
	// (마이페이지) 기본 프로필 사진 설정
	public int defaultPP(String user_id) throws Exception {
		System.out.println("MemberDAO / 기본 프로필 사진 설정 - user_id: " + user_id);
		return session.update("memberMapper.defaultPP", user_id);
	}	
	
	// (마이페이지) 회원 타입 수정
	public int modifyType(String user_id) throws Exception {
		System.out.println("MemberDAO / 회원 타입 수정 - 아이디: " + user_id);
		return session.update("memberMapper.modifyType", user_id);
	}
}
