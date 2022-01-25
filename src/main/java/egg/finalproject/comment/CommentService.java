package egg.finalproject.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {
	@Autowired
	private CommentDAO dao;
	
	public List<CommentDTO> getAllComments(int post_no) throws Exception{
		return dao.getAllComments(post_no);
	}
	public boolean insertComment(CommentDTO dto) throws Exception{
		if(dao.insertComment(dto)>0) {
			return true;
		}return false;
	}
	
	public boolean  deleteComment(int comment_no) throws Exception{
		if(dao.deleteComment(comment_no)>0) {
			return true;
		}return false;
	}
	
	public boolean modifyComment(CommentDTO dto) throws Exception{
		if(dao.modifyComment(dto)>0) {
			System.out.println("true");
			return true;
		}System.out.println("false");
		return false;
	}
}
