package egg.finalproject.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminReportService {
	
	@Autowired
	private AdminReportDAO dao;
	
	private int totalCount;
	
	// 전체 신고 수 가져오기
	public int getReportCountAll() throws Exception {
		return dao.getReportCountAll();
	}
	
	// 검색 한 신고 수 가져오기
	public int getReportCount(String searchOption, String searchKeyword) {
		Map<String, String> map = new HashMap<>();
		if(searchOption != null && searchKeyword != null) {
			map.put("searchOption", searchOption);
			map.put("searchKeyword", searchKeyword);
		}
		int rs = dao.getReportCount(map);
		System.out.println("신고 count : " + rs);
		return rs;
	}
	
	// 신고 목록 가져오기
	public List<Map<String, Object>> getReportList(String searchOption, String searchKeyword, int currentIdx) throws Exception {
		System.out.println("searchOption : " + searchOption + " : " + "searchKeyword : " + searchKeyword + " : " + "currentIdx : " + currentIdx);
		Map<String, String> map = new HashMap<>();
		if(searchOption != null && searchKeyword != null) {
			map.put("searchOption", searchOption);
			map.put("searchKeyword", searchKeyword);
		}
		totalCount = this.getReportCount(searchOption, searchKeyword);
		List<Map<String, Object>> list = dao.getReportList(map);
		System.out.println("getReportList_list size : " + list.size());
		return list;
	}
	
	// 신고 상세 페이지 관련
	public Map<String, Object> getReportDetail(String report_no, String type) throws Exception {
		System.out.println("report_no : " + report_no + " : type : " + type);
		Map<String, Object> map = new HashMap<>();
		map.put("report_no", report_no);
		map.put("type", type);
		return dao.getReportDetail(map);
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
