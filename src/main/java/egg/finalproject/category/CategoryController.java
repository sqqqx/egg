package egg.finalproject.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired
	private CategoryService service;
	
	@RequestMapping("/getChildCategory.do")
	@ResponseBody
	public List<CategoryDTO> getChildCategory(String bigCategory) throws Exception{
		System.out.println("getChildCategory controller 진입");
		List<CategoryDTO> list = service.getChildCategory(bigCategory);
		for(CategoryDTO dto : list) {
			System.out.println(dto.getChild_group());
		}
		return list;
	}
	
}
