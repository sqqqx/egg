package egg.finalproject.comment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAO {
	@Autowired
	private SqlSession session;
	
	public List<CommentDTO> getAllComments(int post_no) throws Exception{
		return session.selectList("commentMapper.getAllComments",post_no);
	}
	
	public int insertComment(CommentDTO dto) throws Exception{
		return session.insert("commentMapper.insertComment",dto);
	}
	
	public int deleteComment(int comment_no) throws Exception{
		return session.delete("commentMapper.deleteComment",comment_no);
	}
	
	public int modifyComment(CommentDTO dto) throws Exception{
		return session.update("commentMapper.modifyComment",dto);
	}
	
	public List<ReplyDTO> getAllReplies(int comment_no) throws Exception{
		return session.selectList("commentMapper.getAllReplies",comment_no);
	}
}
