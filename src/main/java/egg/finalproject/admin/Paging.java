package egg.finalproject.admin;

import java.util.HashMap;
import java.util.Map;

public class Paging {

	public int totalCount;
	
	// getNavi
	public Map<String, Object> getNavi(int currentIdx) throws Exception {
		int rowCnt = totalCount;
		int rowCntPage = 10; // 
		System.out.println("rowCnt : " + rowCnt);
		
		int naviCnt = rowCnt % rowCntPage > 0 ? (rowCnt / rowCntPage) + 1 : (rowCnt / rowCntPage);
		int naviCntPage = 10; // 
		System.out.println("naviCnt : " + naviCnt);
		
		if(currentIdx < 1) {
			currentIdx = 1;
		}
		if(currentIdx > naviCnt) {
			currentIdx = naviCnt;
		}
		System.out.println("currentIdx : " + currentIdx);
		
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
