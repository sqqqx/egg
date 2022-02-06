package egg.finalproject.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class offlinePostService {
	
	@Autowired
	private offlinePostDAO dao;

	public List<PostDTO> selectByCg(int type, int category_no) throws Exception{
		return dao.selectByCg(type, category_no);
	}
	
}
