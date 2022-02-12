package egg.finalproject.expert_category;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egg.finalproject.category.CategoryDAO;

@Service
public class Expert_categoryService {
	
	@Autowired
	private Expert_categoryDAO dao;
	@Autowired
	private CategoryDAO categoryDAO;

	public List<Object> ExpertCategory(String expert_id) throws Exception{
		return dao.ExpertCategory(expert_id);
	}
	
	// (마이페이지) 능력자 카테고리 번호 추가
	public int insertExpertCN(String expert_id, int category_no) throws Exception {
		System.out.println("Expert_categoryService / 능력자 카테고리 번호 추가 - expert_id: " + expert_id + ", category_no: " + category_no);
		Expert_categoryDTO dto = new Expert_categoryDTO();
		dto.setExpert_id(expert_id);
		dto.setCategory_no(category_no);
		return dao.insertExpertCN(dto);
	}
	
	// (마이페이지) 카테고리 정보 가져오기
	public Map<String, Object> getCateList(String expert_id) throws Exception {
		System.out.println("Expert_categoryService / 카테고리 정보 가져오기 - expert_id: " + expert_id);
		ArrayList<String> categoryList = new ArrayList<>();
		// 카테고리 번호 가져오기
		List<Integer> noList = dao.noList(expert_id);
		// 하나씩 대분류와 소분류로 정리
		for(int n : noList) {
			String cateName = categoryDAO.cateName(n);
			System.out.println("카테고리명: " + cateName);
			categoryList.add(cateName);
		}
//		return categoryList;
		Map<String, Object> map = new HashMap<>();
		map.put("categoryNo", noList);
		map.put("categoryList", categoryList);
		
		return map;
	}
	
	// (마이페이지) 카테고리 정보 삭제
	public int deleteExpertCN(String expert_id) throws Exception {
		System.out.println("Expert_categoryService / 카테고리 정보 삭제 - expert_id: " + expert_id);
		return dao.deleteExpertCN(expert_id);
	}
	
}
