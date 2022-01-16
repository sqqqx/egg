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
		System.out.println("dao - memberselectall 도착");
		List<MemberDTO> list = session.selectList("userMapper.memberSelectAll");
		System.out.println(list.size());
		return list;
	}
	
	// 회원 아이디, 닉네임, 이메일로 검색
	public List<MemberDTO> memberSearch(Map<String, String> map) throws Exception {
		return session.selectList("userMapper.memberSearch", map);
	}
	
	// 회원 강제 탈퇴
	public int memberExpulsion(Map<String, String[]> map) throws Exception {
		return session.update("userMapper.memberExpulsion", map);
	}
	
	// 회원 블랙리스트 등록
	public int memberBlacklistRegist(Map<String, String[]> map) throws Exception {
		return session.update("userMapper.memberBlacklistRegist", map);
	}
	
	// test
	public int test(MemberDTO dto) throws Exception {
		int rs = session.insert("userMapper.test", dto);
		System.out.println(rs);
		return rs;
	}

}
