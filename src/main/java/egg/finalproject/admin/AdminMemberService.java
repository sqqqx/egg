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
	
	private int totalCount;
	
	// 총 회원 수 가져오기
	public int memberCount() throws Exception {
		return dao.memberCount();
	}
	
	// 회원 목록 가져오기
	public List<MemberDTO> getMemberList(String searchOption, String searchKeyword, int currentIdx) throws Exception {
		Map<String, Object> map = this.getRange(currentIdx);
		if(searchOption != null & searchKeyword != null) {
			map.put("searchOption", searchOption);
			map.put("searchKeyword", searchKeyword);
		}
		List<MemberDTO> list = dao.getMemberList(map);
		totalCount = list.size() < this.memberCount() ? list.size() : this.memberCount();
		System.out.println("memberSearch totalCount : " + totalCount);
		return list;
	}
	
	// 회원 강제 탈퇴
	public int memberExpulsion(String[] userCheckBox) throws Exception {
		Map<String, String[]> map = new HashMap<>();
		map.put("userCheckBox", userCheckBox);
		return dao.memberExpulsion(map);
	}
	
	// 블랙리스트 ON / OFF
	public int memberBlackList(String[] userCheckBox, int idx) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("userCheckBox", userCheckBox);
		map.put("idx", idx);
		return dao.memberBlackList(map);
	}
	
	/********** paging **********/
	
	// getNavi
	public Map<String, Object> getNavi(int currentIdx) throws Exception {
		int rowCnt = this.totalCount; // 전체 회원 수
		int rowCntPage = 10; // 10명/page
		
		int naviCnt = rowCnt % rowCntPage > 0 ? (rowCnt / rowCntPage) + 1 : (rowCnt / rowCntPage);
		int naviCntPage = 5; // 10navi/page
		
		if(currentIdx < 1) {
			currentIdx = 1;
		}
		if(currentIdx > naviCnt) {
			currentIdx = naviCnt;
		}
		
		int firstIdx = ((currentIdx - 1) / naviCntPage) * naviCntPage + 1; // 페이지 시작 번호 
		int lastIdx = firstIdx + naviCntPage - 1; // 페이지 마지막 번호
		
		if(lastIdx > naviCnt) {
			lastIdx = naviCnt;
		}
		
		boolean needPrev = firstIdx == 1 ? false : true;
		boolean needNext = lastIdx == naviCnt ? false : true; 
		
		System.out.println("rowCnt : " + rowCnt);
		System.out.println("firstIdx : " + firstIdx + " : " + "lastIdx : " + lastIdx + "needPrev : " + needPrev + " : " + "needNext : " + needNext);
		
		Map<String, Object> map = new HashMap<>();
		map.put("currentIdx", currentIdx);
		map.put("firstIdx", firstIdx);
		map.put("lastIdx", lastIdx);
		map.put("needPrev", needPrev);
		map.put("needNext", needNext);
		return map;
	}
	
	// get startRange, endRange
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
