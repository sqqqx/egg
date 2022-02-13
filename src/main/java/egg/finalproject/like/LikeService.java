package egg.finalproject.like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikeService {

	@Autowired
	private LikeDAO dao;
	
	public int count(int post_no) throws Exception{
		return dao.count(post_no);
	}
	
	public int plus(String user_id, int type, int post_no) throws Exception{
		return dao.plus(user_id, type, post_no);
	}
	
	public int minus(String user_id, int type, int post_no) throws Exception{
		return dao.minus(user_id, type, post_no);
	}
	
	public int selectLike(String user_id, int type, int post_no) throws Exception{
		return dao.selectLike(user_id, type, post_no);
			
	}
	public String getNN(int type, int post_no) throws Exception{
		return dao.getNN(type, post_no);
	}
	public String getNNforPost(int type, int post_no) throws Exception{
		return dao.getNNforPost(type, post_no);
	}
}
