package egg.finalproject.post;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egg.finalproject.category.CategoryDTO;
import egg.finalproject.image.ImageDTO;
import egg.finalproject.product.ProductDTO;

@Service
public class onlinePostService {
	@Autowired
	private onlinePostDAO dao;

	public List<String> getParentCategory() throws Exception {
		return dao.getParentCategory();
	}

	public List<CategoryDTO> getChildCategory(String bigCategory) throws Exception {
		System.out.println("getChildCategory service 진입");
		return dao.getChildCategory(bigCategory);
	}

	public List<ProductDTO> searchProduct(String value) throws Exception {
		System.out.println("sevice 진입" + value);
		return dao.searchProduct(value);
	}

	

	public void insertPost(PostDTO dto) throws Exception {
		dao.insertPost(dto);
	}

	public int getPost_no() throws Exception {
		return dao.getPost_no();
	}
	
	public PostDTO getPostInfo(int post_no) throws Exception{
		return dao.getPostInfo(post_no);
	}
}
