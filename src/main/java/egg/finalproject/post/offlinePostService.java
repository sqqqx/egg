package egg.finalproject.post;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egg.finalproject.admin.Paging;

@Service
public class offlinePostService extends Paging {
	
	@Autowired
	private offlinePostDAO dao;

	// 전체 목록 가져오기
	public List<PostDTO> selectByCg(String parent_group, Map<String, Object> range) throws Exception{
		System.out.println("offlinePostService : " + parent_group + " : " + range.get("startRange") + " : " + range.get("endRange"));
		Map<String, Object> map = new HashMap<>();
		parent_group = "운동"; // exam
		map.put("parent_group", parent_group);
		map.put("startRange", range.get("startRange"));
		map.put("endRange", range.get("endRange"));
//		System.out.println("parent_group : " + parent_group + " : startRange : " + range.get("startRange") + " : endRange : " + range.get("endRange"));
		List<PostDTO> list = dao.selectByCg(map);
//		if(!list.isEmpty()) {
//			System.out.println("list size : " + list.size());
//		}
		return list;
	}
	
	// 전체 글 COUNT
	public void getPostCountAll(String parent_group) throws Exception {
		parent_group = "운동"; // exam
		int rs =  dao.getPostCountAll(parent_group);
//		System.out.println("rs : " + rs);
		this.totalCount = rs;
	}
	
	// 검색 결과 가져오기
	public List<PostDTO> getPostbySearch(String parent_group, Map<String, Object> range, String searchOption, String searchKeyword) throws Exception{
		System.out.println("offlinePostService : " + parent_group + " : " + range.get("startRange") + " : " + range.get("endRange"));
		Map<String, Object> map = new HashMap<>();
		parent_group = "운동"; // exam
		map.put("parent_group", parent_group);
		map.put("startRange", range.get("startRange"));
		map.put("endRange", range.get("endRange"));
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		List<PostDTO> list = dao.getPostbySearch(map);
		return list;
	}
	
	// 검색 결과 COUNT
	public void getPostCountSearch(String searchKeyword, String searchOption, String parent_group) throws Exception {
		parent_group = "운동"; // exam
		Map<String, Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		map.put("parent_group", parent_group);
		int rs =  dao.getPostCountSearch(map);
		this.totalCount = rs;
	}
	
	// currentPage 변환
	public int currentPageReform(String currentPage) throws Exception {
		return currentPage == null ? 1 : Integer.parseInt(currentPage);
	}
}
