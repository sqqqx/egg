package egg.finalproject.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminReportService extends Paging {
	
	@Autowired
	private AdminReportDAO dao;
	
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
	public List<Map<String, Object>> getReportList(String searchOption, String searchKeyword, int currentIdx, String type) throws Exception {
		System.out.println("searchOption : " + searchOption + " : " + "searchKeyword : " + searchKeyword + " : " + "currentIdx : " + currentIdx);
		Map<String, Object> map = this.getRange(currentIdx);
		if(searchOption != null && searchKeyword != null) {
			map.put("searchOption", searchOption);
			map.put("searchKeyword", searchKeyword);
		}
		if(!type.equals("9")) {
			map.put("type", type);
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
	
	// 신고 처리 상태 변경
	public int changeReportStatus(String report_no) throws Exception {
		return dao.changeReportStatus(report_no);
	}

}
