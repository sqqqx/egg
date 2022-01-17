package egg.finalproject.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egg.finalproject.member.MemberDTO;

@Service
public class AdminMemberService {
	
	@Autowired
	private AdminMemberDAO dao;
	
	// 전체 회원 가져오기
	public List<MemberDTO> memberSelectAll() throws Exception {
		return dao.memberSelectAll();
	}
	
	// 회원 아이디, 닉네임, 이메일로 검색
	public List<MemberDTO> memberSearch(String searchOption, String searchKeyword) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		return dao.memberSearch(map);
	}
	
	// 회원 강제 탈퇴
	public int memberExpulsion(String[] userCheckBox) throws Exception {
		Map<String, String[]> map = new HashMap<>();
		map.put("userCheckBox", userCheckBox);
		return dao.memberExpulsion(map);
	}
	
	// 회원 블랙리스트 등록
	public int memberBlacklistRegist(String[] userCheckBox) throws Exception {
		Map<String, String[]> map = new HashMap<>();
		map.put("userCheckBox", userCheckBox);
		return dao.memberBlacklistRegist(map);
	}
	
	// 회원 블랙리스트 해제
	public int memberBlackListCancel(String[] userCheckBox) throws Exception {
		Map<String, String[]> map = new HashMap<>();
		map.put("userCheckBox", userCheckBox);
		return dao.memberBlackListCancel(map);
	}

}
