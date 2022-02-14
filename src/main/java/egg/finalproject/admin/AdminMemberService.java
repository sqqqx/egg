package egg.finalproject.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import egg.finalproject.member.MemberDTO;

@Service
public class AdminMemberService extends Paging {
	
	@Autowired
	private AdminMemberDAO dao;
	
	// 전체 회원 수 가져오기
	public int getMemberCount(String searchOption, String searchKeyword, int userType) throws Exception {
		Map<String, Object> map = new HashMap<>();
		if(searchOption != null & searchKeyword != null) {
			map.put("searchOption", searchOption);
			map.put("searchKeyword", searchKeyword);
		}
		if(userType != 9) {
			map.put("userType", userType);
		}
		int rs = dao.getMemberCount(map);
		System.out.println("count : " + rs);
		return rs;
	}
	
	// 검색 한 회원 수 가져오기
	/*
	 * public int getSearchCount(String searchOption, String searchKeyword) throws
	 * Exception { Map<String, String> map = new HashMap<>();
	 * map.put("searchOption", searchOption); map.put("searchKeyword",
	 * searchKeyword); return dao.getSearchCount(map); }
	 */
	
	// 회원 목록 가져오기 
	public List<MemberDTO> getMemberList(String searchOption, String searchKeyword, int currentIdx, int userType) throws Exception {
		System.out.println("searchOption : " + searchOption + " : " + "searchKeyword : " + searchKeyword + " : " + "currentIdx : " + currentIdx + " : userType : " + userType);
		Map<String, Object> map = this.getRange(currentIdx);
		map.put("userType", userType);
		if(searchOption != null && searchKeyword != null) {
			map.put("searchOption", searchOption);
			map.put("searchKeyword", searchKeyword);
			// totalCount = this.getSearchCount(searchOption, searchKeyword);
		}
		totalCount = this.getMemberCount(searchOption, searchKeyword, userType);
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
	
	// 일별 가입자 수
	public String getUserCount() throws Exception {
		List<Map<String, Object>> list = dao.getUserCount();
		for(Map<String, Object> map : list) {
			System.out.println(map);
		}
		Gson gson = new Gson();
		JsonArray arr = new JsonArray();
		for(Map<String, Object> map : list) {
			JsonObject obj = new JsonObject();
			obj.addProperty("date", (String)map.get("SIGNUP_DATE")); 
			obj.addProperty("count", String.valueOf(map.get("CNT")));
			arr.add(obj);
		}
		String json = gson.toJson(arr);
		System.out.println(json);
		return json;
	}
	
	// 오늘 가입자
	public int getTodayCount() throws Exception {
		return dao.getTodayCount();
	}
	
	// 접속자 정보 가져오기
	public List<MemberDTO> getUserInfo(Map<String, String> map) throws Exception {
		map.remove("type");
		map.forEach((strKey, strValue)->{
			System.out.println( strKey +" : "+ strValue );
		});
		List<MemberDTO> list = dao.getUserInfo(map);
		for(MemberDTO dto : list) {
			System.out.println(dto);
		}
		return list;
	}
	
	// 전문가 신청 리스트 가져오기
	public List<MemberDTO> getExpertList(String searchOption, String searchKeyword, Map<String, Object> range, int type) throws Exception {
		System.out.println("searchOption : " + searchOption + " : searchKeyword : " + searchKeyword + " : sRange : " + range.get("startRange") + " : eRange : " + range.get("endRange"));
		Map<String, Object> map = new HashMap<>();
		if(searchOption != null && searchKeyword != null) {
			map.put("searchOption", searchOption);
			map.put("searchKeyword", searchKeyword);
		}
		map.put("startRange", range.get("startRange"));
		map.put("endRange", range.get("endRange"));
		map.put("type", type);
		List<MemberDTO> list = dao.getExpertList(map);
		System.out.println("list.size : " + list.size());
		return list;
	}
	
	// 전문가 신청 리스트 COUNT
	public void getExpertListCount(String searchOption, String searchKeyword, int type) throws Exception {
		System.out.println("searchOption : " + searchOption + " : searchKeyword : " + searchKeyword);
		Map<String, Object> map = new HashMap<>();
		if(searchOption != null && searchKeyword != null) {
			map.put("searchOption", searchOption);
			map.put("searchKeyword", searchKeyword);
		}
		map.put("type", type);
		int rs = dao.getExpertListCount(map);
		System.out.println("COUNT : " + rs);
		this.totalCount = rs;
	}
	
	// 능력자 전환
	public int changeExpert(String[] userCheckBox) throws Exception {
		Map<String, String[]> map = new HashMap<>();
		map.put("userCheckBox", userCheckBox);
		return dao.changeExpert(map);
	}

}
