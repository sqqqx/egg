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
	
	// 전체 회원 가져오기
	public List<MemberDTO> memberSelectAll() throws Exception {
		return session.selectList("adminMemberMapper.memberSelectAll");
	}
	
	// 회원 아이디, 닉네임, 이메일로 검색
	public List<MemberDTO> memberSearch(Map<String, Object> map) throws Exception {
		return session.selectList("adminMemberMapper.memberSearch", map);
	}
	
	// 회원 강제 탈퇴
	public int memberExpulsion(Map<String, String[]> map) throws Exception {
		return session.update("adminMemberMapper.memberExpulsion", map);
	}
	
	// 회원 블랙리스트 등록
	public int memberBlacklistRegist(Map<String, String[]> map) throws Exception {
		return session.update("adminMemberMapper.memberBlacklistRegist", map);
	}
	
	// 회원 블랙리스트 해제
	public int memberBlackListCancel(Map<String, String[]> map) throws Exception {
		return session.update("adminMemberMapper.memberBlackListCancel", map);
	}
	
	// 총 회원 수 가져오기
	public int memberCount() throws Exception {
		return session.selectOne("adminMemberMapper.memberCount");
	}
	
	// 회원 목록 + 페이징
	public List<MemberDTO> memberPaging(Map<String, Integer> map) throws Exception {
		return session.selectList("adminMemberMapper.memberPaging", map);
	}
	
	// 현재 페이지에 맞는 회원 목록 가져오기
	public List<MemberDTO> getMemberList(Map<String, Object> map) {
		return session.selectList("adminMemberMapper.getMemberList", map);
	}

}
