package egg.finalproject.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminPostService {
	
	@Autowired
	private AdminPostDAO dao;
	
	private int totalCount;
	
	// 검색 한 게시글 수 가져오기
	public int getPostCount(String searchOption, String searchKeyword) throws Exception {
		Map<String, String> map = new HashMap<>();
		if(searchOption != null & searchKeyword != null) {
			map.put("searchOption", searchOption);
			map.put("searchKeyword", searchKeyword);
		}
		int rs = dao.getPostCount(map);
		System.out.println("count : " + rs);
		return rs;
	}
	
	// 게시글 목록 가져오기
	public List<Map<String, Object>> getPostList(int currentIdx, String searchOption, String searchKeyword) throws Exception {
		System.out.println("currentIdx : " + currentIdx + " : searchOption : " + searchOption + " : searchKeyword : " + searchKeyword);
		Map<String, Object> map = this.getRange(currentIdx);
		if(searchOption != null & searchKeyword != null) {
			map.put("searchOption", searchOption);
			map.put("searchKeyword", searchKeyword);
		}
		map.put("currentIdx", currentIdx);
		totalCount = this.getPostCount(searchOption, searchKeyword);
		List<Map<String, Object>> list = dao.getPostList(map);
		System.out.println("list size : " + list.size());
		for(Map<String, Object> post : list) {
			System.out.println(post);
		}
		return list;
	}
	
	/********** paging **********/
	
	// getNavi
	public Map<String, Object> getNavi(int currentIdx) throws Exception {
		int rowCnt = this.totalCount; 
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
