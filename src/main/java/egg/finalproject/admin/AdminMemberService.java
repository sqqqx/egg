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
	
	// 전체 회원 수 가져오기
	public int getMemberCountAll() throws Exception {
		return dao.getMemberCountAll();
	}
	
	// 검색 한 회원 수 가져오기
	public int getSearchCount(String searchOption, String searchKeyword) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		return dao.getSearchCount(map);
	}
	
	// 회원 목록 가져오기 
	public List<MemberDTO> getMemberList(String searchOption, String searchKeyword, int currentIdx, int userType) throws Exception {
		System.out.println("searchOption : " + searchOption + " : " + "searchKeyword : " + searchKeyword + " : " + "currentIdx : " + currentIdx + " : userType : " + userType);
		Map<String, Object> map = this.getRange(currentIdx);
		map.put("userType", userType);
		if(searchOption != null && searchKeyword != null) {
			map.put("searchOption", searchOption);
			map.put("searchKeyword", searchKeyword);
			totalCount = this.getSearchCount(searchOption, searchKeyword);
		}
		totalCount = this.getMemberCountAll();
		return dao.getMemberList(map);
	}
	
	// 회원 강제 탈퇴
	public int memberExpulsion(String[] userCheckBox) throws Exception {
		Map<String, String[]> map = new HashMap<>();
		map.put("userCheckBox", userCheckBox);
		return dao.memberExpulsion(map);
	}
	
	// 블랙리스트 ON / OFF
	public int memberBlackList(String[] userCheckBox, int idx) throws Exception {
		for(String s : userCheckBox) {
			System.out.println("user_id: " + s);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("userCheckBox", userCheckBox);
		map.put("idx", idx);
		return dao.memberBlackList(map);
	}
	
	// 피신고자 블랙리스트 추가
	public boolean addBlackList(String type, String target_no) throws Exception {
		System.out.println("type : " + type + " : target_no : " + target_no);
		Map<String, String> map = new HashMap<>();
		map.put("type", type);
		map.put("target_no", target_no);
		String[] arr = new String[1];
		arr[0] = dao.addBlackList(map);
		return this.memberBlackList(arr, 1) == 1 ? true : false;
	}
	
	/********** paging **********/
	
	// getNavi
	public Map<String, Object> getNavi(int currentIdx) throws Exception {
		int rowCnt = this.totalCount; // 
		int rowCntPage = 10; // 
		
		int naviCnt = rowCnt % rowCntPage > 0 ? (rowCnt / rowCntPage) + 1 : (rowCnt / rowCntPage);
		int naviCntPage = 5; // 
		
		if(currentIdx < 1) {
			currentIdx = 1;
		}
		if(currentIdx > naviCnt) {
			currentIdx = naviCnt;
		}
		
		int firstIdx = ((currentIdx - 1) / naviCntPage) * naviCntPage + 1; // 
		int lastIdx = firstIdx + naviCntPage - 1; // 
		
		if(lastIdx > naviCnt) {
			lastIdx = naviCnt;
		}
		
		boolean needPrev = firstIdx == 1 ? false : true;
		boolean needNext = lastIdx == naviCnt ? false : true; 
		
		System.out.println("firstIdx : " + firstIdx + " : " + "lastIdx : " + lastIdx + " : needPrev : " + needPrev + " : " + "needNext : " + needNext);
		
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
		int rowCntPage = 10; // 
		int startRange = currentIdx * rowCntPage - (rowCntPage - 1);
		int endRange = currentIdx * rowCntPage;
		System.out.println("startRange : " + startRange + " : endRange : " + endRange);
		Map<String, Object> map = new HashMap<>();
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		return map;
	}

}
