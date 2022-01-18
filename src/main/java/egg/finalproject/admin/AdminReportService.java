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
	
	// 신고 목록 가져오기
	public List<Map<String, Object>> getReportList(String searchOption, String searchKeyword, int currentIdx) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		List<Map<String, Object>> list = dao.getReportList(map);
		System.out.println("getReportList - list size : " + list.size());
		for(Map<String, Object> m : list) {
			System.out.println(m);
		}
		return list;
	}

}
