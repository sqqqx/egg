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


	public void insertPost(PostDTO dto) throws Exception {
		dao.insertPost(dto);
	}

	public int getPost_no() throws Exception {
		return dao.getPost_no();
	}
	
	public PostDTO getPostInfo(int post_no) throws Exception{
		return dao.getPostInfo(post_no);
	}
	
	public boolean deletePost(int post_no) throws Exception{
		if(dao.deletePost(post_no)>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public void updatePost(PostDTO dto) throws Exception{
		dao.updatePost(dto);
	}
	
	//============================================================================
	public List<Object> selectRecent4() throws Exception{
		return dao.selectRecent4();
	}
	
	public List<Object> selectLike4() throws Exception{
		return dao.selectLike4();
	}
	
	public List<Object> selectAdmin() throws Exception{
		return dao.selectAdmin();
	}
	public List<Object> selectRecent() throws Exception{
		return dao.selectRecent();
	}
	public List<Object> selectLike() throws Exception{
		return dao.selectLike();
	}
	public List<Object> selectCat(int category_no) throws Exception{
		return dao.selectCat(category_no);
	}
	//============================================================================
	public List<Object> mainSearch(String search) throws Exception{
		return dao.mainSearch(search);
	}
}
