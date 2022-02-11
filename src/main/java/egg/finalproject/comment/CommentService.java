package egg.finalproject.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {
	@Autowired
	private CommentDAO dao;
	
	public List<CommentDTO> getAllComments(int post_no, int type) throws Exception{
		return dao.getAllComments(post_no,type);
	}
	public boolean insertComment(CommentDTO dto) throws Exception{
		return dao.insertComment(dto)>0;
	}
	
	public boolean  deleteComment(int comment_no) throws Exception{
		return dao.deleteComment(comment_no)>0;
	}
	 
	public boolean modifyComment(CommentDTO dto) throws Exception{
		return dao.modifyComment(dto)>0;
	}
	
	public List<ReplyDTO> getAllReplies(int comment_no) throws Exception{
		return dao.getAllReplies(comment_no);
	}
	
	public void deleteAllReferences(int comment_no) throws Exception{
		dao.deleteAllReferences(comment_no);
	}
	
	public boolean insertReply(ReplyDTO dto) throws Exception{
		return dao.insertReply(dto)>0;
	}
	
	public boolean deleteReply(int comment_no) throws Exception{
		return dao.deleteReply(comment_no)>0;
	}
	
	public boolean insertReply_reply(ReplyDTO dto) throws Exception{
		return dao.insertReply_reply(dto)>0;
	}
	public String getReceiver(int comment_no) throws Exception{
		return dao.getReceiver(comment_no);
	}
}
