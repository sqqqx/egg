package egg.finalproject.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {
	@Autowired
	private CategoryDAO dao;
	
	public List<String> getParentCategory() throws Exception {
		return dao.getParentCategory();
	}

	public List<CategoryDTO> getChildCategory(String bigCategory) throws Exception {
		System.out.println("getChildCategory service 진입");
		return dao.getChildCategory(bigCategory);
	}
	
	public CategoryDTO getCategory(int category_no) throws Exception{
		return dao.getCategory(category_no);
	}
}
