package egg.finalproject.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminProductService extends Paging {

	@Autowired
	private AdminProductDAO dao;

	// 상품 수 가져오기
	public int getProductCount(String searchOption, String searchKeyword) throws Exception {
		Map<String, String> map = new HashMap<>();
		if (searchOption != null & searchKeyword != null) {
			map.put("searchOption", searchOption);
			map.put("searchKeyword", searchKeyword);
		}
		int rs = dao.getProductCount(map);
		System.out.println("count : " + rs);
		return rs;
	}

	// 상품 목록 가져오기
	public List<Map<String, Object>> getProductsList(int currentIdx, String searchOption, String searchKeyword) throws Exception {
		System.out.println("currentIdx : " + currentIdx + " : searchOption : " + searchOption + " : searchKeyword : "
				+ searchKeyword);
		Map<String, Object> map = this.getRange(currentIdx);
		if (searchOption != null & searchKeyword != null) {
			map.put("searchOption", searchOption);
			map.put("searchKeyword", searchKeyword);
		}
		map.put("currentIdx", currentIdx);
		totalCount = this.getProductCount(searchOption, searchKeyword);
		List<Map<String, Object>> list = dao.getProductsList(map);
		System.out.println("list size : " + list.size());
		for (Map<String, Object> post : list) {
			System.out.println(post);
		}
		return list;
	}

}
