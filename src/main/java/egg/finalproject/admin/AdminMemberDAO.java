package egg.finalproject.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egg.finalproject.member.MemberDTO;

@Repository
public class AdminMemberDAO {
	
	@Autowired
	private SqlSession session;
	
	// 전체 회원 수 가져오기
	public int getMemberCountAll() throws Exception {
		return session.selectOne("adminMemberMapper.getMemberCountAll");
	}
	
	// 검색 한 회원 수 가져오기
	public int getSearchCount(Map<String, String> map) throws Exception {
		return session.selectOne("adminMemberMapper.getSearchCount", map);
	}
	
	// 회원 목록 가져오기
	public List<MemberDTO> getMemberList(Map<String, Object> map) {
		return session.selectList("adminMemberMapper.getMemberList", map);
	}
	
	// 회원 강제 탈퇴
	public int memberExpulsion(Map<String, String[]> map) throws Exception {
		return session.update("adminMemberMapper.memberExpulsion", map);
	}
	
	// 블랙리스트 ON / OFF
	public int memberBlackList(Map<String, Object> map) throws Exception {
		return session.update("adminMemberMapper.memberBlackList", map);
	}
	
	// 피신고자 블랙리스트 추가
	public String addBlackList(Map<String, String> map) throws Exception {
		return session.selectOne("adminMemberMapper.getUserId", map);
	}
	
	// 일별 가입자 수
	public List<Map<String, Object>> getUserCount() throws Exception {
		return session.selectList("adminMemberMapper.getUserCount");
	}
	
	// 오늘 가입자
	public int getTodayCount() throws Exception {
		return session.selectOne("adminMemberMapper.getTodayCount");
	}
	
	// 접속자 정보 가져오기
	public List<MemberDTO> getUserInfo(Map<String, String> map) throws Exception {
		return session.selectList("adminMemberMapper.getUserInfo", map);
	}
}
