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
	public List<MemberDTO> memberSearch(String searchOption, String searchKeyword, int currentIdx) throws Exception {
		Map<String, Object> map = this.getRange(currentIdx);
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
	
	// 총 회원 수 가져오기
	public int memberCount() throws Exception {
		return dao.memberCount();
	}
	
	// 페이지 처리
	public Map<String, Object> getNavi(int currentIdx) throws Exception {
		int rowCnt = this.memberCount(); // 전체 회원 수
		int rowCntPage = 10; // 10명/page
		int naviCnt = (int)Math.ceil((double)rowCnt/rowCntPage); // 전체 페이지 수(올림처리)
		int naviCntPage = 5; // 10navi/page
		
		if(currentIdx < 1) {
			currentIdx = 1;
		}
		if(currentIdx > naviCnt) {
			currentIdx = naviCnt;
		}
		
		int firstIdx = ((currentIdx - 1) / naviCntPage) * naviCntPage + 1; // 페이지 시작 번호 
		int lastIdx = firstIdx + naviCntPage - 1; // 페이지 마지막 번호
		
		boolean needPrev = firstIdx == 1 ? false : true;
		boolean needNext = lastIdx == naviCnt ? false : true; 
		
		Map<String, Object> map = new HashMap<>();
		map.put("currentIdx", currentIdx);
		map.put("firstIdx", firstIdx);
		map.put("lastIdx", lastIdx);
		map.put("needPrev", needPrev);
		map.put("needNext", needNext);
		return map;
	}
	
	// 전체 회원 목록 가져오기 
	public List<MemberDTO> getMemberList(int currentIdx) {
		return dao.getMemberList(this.getRange(currentIdx));
	}
	
	// startRange, endRange구하기
	public Map<String, Object> getRange(int currentIdx) {
		int rowCntPage = 10; // 페이지당 10명
		int startRange = currentIdx * rowCntPage - (rowCntPage - 1);
		int endRange = currentIdx * rowCntPage;
		Map<String, Object> map = new HashMap<>();
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		return map;
	}
	

}
