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
	
	// (마이페이지) 찜한 게시글 가져오기
	public List<Map<String, Object>> getMyLikePost(String user_id, String searchOption, String searchKeyword, Map<String, Object> range, int type) throws Exception {
		System.out.println("user_id : " + user_id + " : searchOption : " + searchOption + " : searchKeyword : " + searchKeyword + " : sRange : " + range.get("startRange") + " : eRange : " + range.get("endRange"));
		Map<String, Object> map = new HashMap<>();
		if(searchOption != null && searchKeyword != null) {
			map.put("searchOption", searchOption);
			map.put("searchKeyword", searchKeyword);
		}
		map.put("user_id", user_id);
		map.put("startRange", range.get("startRange"));
		map.put("endRange", range.get("endRange"));
		map.put("type", type);
		List<Map<String, Object>> list = dao.getMyLikePost(map);
		System.out.println("list.size : " + list.size());
		for(Map<String, Object> item : list) {
			System.out.println(item);
		}
		return list;
	}
	
	// (마이페이지) 찜한 게시글 COUNT
	public void getMyLikePostCount(String user_id, String searchOption, String searchKeyword, int type) throws Exception {
		System.out.println("user_id : " + user_id + " : searchOption : " + searchOption + " : searchKeyword : " + searchKeyword);
		Map<String, Object> map = new HashMap<>();
		if(searchOption != null && searchKeyword != null) {
			map.put("searchOption", searchOption);
			map.put("searchKeyword", searchKeyword);
		}
		map.put("user_id", user_id);
		map.put("type", type);
		int rs = dao.getMyLikePostCount(map);
		System.out.println("내가 쓴 글 COUNT : " + rs);
		this.totalCount = rs;
	}
	
	// (마이페이지) 내가 쓴 글 가져오기
	public List<PostDTO> getMyPost(String user_id, String searchOption, String searchKeyword, Map<String, Object> range) throws Exception {
		System.out.println("user_id : " + user_id + " : searchOption : " + searchOption + " : searchKeyword : " + searchKeyword + " : sRange : " + range.get("startRange") + " : eRange : " + range.get("endRange"));
		Map<String, Object> map = new HashMap<>();
		if(searchOption != null && searchKeyword != null) {
			map.put("searchOption", searchOption);
			map.put("searchKeyword", searchKeyword);
		}
		map.put("user_id", user_id);
		map.put("startRange", range.get("startRange"));
		map.put("endRange", range.get("endRange"));
		List<PostDTO> list = dao.getMyPost(map);
		System.out.println("list.size : " + list.size());
		return list;
	}
	
	// (마이페이지) 내가 쓴 글 COUNT
	public void getMyPostCount(String user_id, String searchOption, String searchKeyword) throws Exception {
		System.out.println("user_id : " + user_id + " : searchOption : " + searchOption + " : searchKeyword : " + searchKeyword);
		Map<String, Object> map = new HashMap<>();
		if(searchOption != null && searchKeyword != null) {
			map.put("searchOption", searchOption);
			map.put("searchKeyword", searchKeyword);
		}
		map.put("user_id", user_id);
		int rs = dao.getMyPostCount(map);
		System.out.println("내가 쓴 글 COUNT : " + rs);
		this.totalCount = rs;
	}

	// 전체 목록 가져오기
	public List<PostDTO> selectByCg(String parent_group, Map<String, Object> range) throws Exception{
		System.out.println("offlinePostService : " + parent_group + " : " + range.get("startRange") + " : " + range.get("endRange"));
		Map<String, Object> map = new HashMap<>();
		map.put("parent_group", parent_group);
		map.put("startRange", range.get("startRange"));
		map.put("endRange", range.get("endRange"));
		List<PostDTO> list = dao.selectByCg(map);
		return list;
	}

	// 전체 글 COUNT
	public void getPostCountAll(String parent_group) throws Exception {
		int rs =  dao.getPostCountAll(parent_group);
		this.totalCount = rs;
	}
	
	// 검색 결과 가져오기
	public List<PostDTO> getPostbySearch(String parent_group, Map<String, Object> range, String searchOption, String searchKeyword) throws Exception{
		System.out.println("offlinePostService : " + parent_group + " : " + range.get("startRange") + " : " + range.get("endRange"));
		Map<String, Object> map = new HashMap<>();
		map.put("parent_group", parent_group);
		map.put("startRange", range.get("startRange"));
		map.put("endRange", range.get("endRange"));
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
//		System.out.println("parent_group : " + parent_group + " : startRange :" + range.get("startRange")  + " : endRange :" + range.get("endRange")  + " : searchOption :" + searchOption  + " : searchKeyword :" + searchKeyword);
		List<PostDTO> list = dao.getPostbySearch(map);
		return list;
	}
	
	// 검색 결과 COUNT
	public void getPostCountSearch(String parent_group, String searchOption, String searchKeyword) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		map.put("parent_group", parent_group);
		int rs =  dao.getPostCountSearch(map);
		System.out.println("search count : " + rs);
		this.totalCount = rs;
	}
	
	// currentPage 변환
	public int currentPageReform(String currentPage) throws Exception {
		return currentPage == null ? 1 : Integer.parseInt(currentPage);
	}
	
	public int insertPost(PostDTO dto) throws Exception{
		return dao.insertPost(dto);
	}
	
	// 조회수 카운트
	public int viewcount(int post_no) throws Exception {
		return dao.viewcount(post_no);
	}
}
