package egg.finalproject.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminPostService extends Paging {
	
	@Autowired
	private AdminPostDAO dao;
	
	// 게시글 수 가져오기
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
	public List<Map<String, Object>> getPostList(int currentIdx, String searchOption, String searchKeyword, String type) throws Exception {
		System.out.println("currentIdx : " + currentIdx + " : searchOption : " + searchOption + " : searchKeyword : " + searchKeyword + " : type : " + type);
		Map<String, Object> map = this.getRange(currentIdx);
		if(searchOption != null & searchKeyword != null) {
			map.put("searchOption", searchOption);
			map.put("searchKeyword", searchKeyword);
		}
		if(!type.equals("9")) {
			map.put("type", type);
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
	
	// 글 삭제
	public int deletePost(String[] postCheckBox) throws Exception {
		Map<String, String[]> map = new HashMap<>();
		map.put("postCheckBox", postCheckBox);
		return dao.deletePost(map);
	}
	
}
