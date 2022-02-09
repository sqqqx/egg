package egg.finalproject.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class offlinePostService {
	
	@Autowired
	private offlinePostDAO dao;

	public List<PostDTO> selectByCg(String parent_group) throws Exception{
		System.out.println("offlinePostService : " + parent_group);
		return dao.selectByCg(parent_group);
	}
	
	public int insertPost(PostDTO dto) throws Exception{
		return dao.insertPost(dto);
	}
}
