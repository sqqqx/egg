package egg.finalproject.comment;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAO {
	@Autowired
	private SqlSession session;
	
	public List<CommentDTO> getAllComments(int post_no, int type) throws Exception{
		HashMap<String,Integer> map = new HashMap<String, Integer>();
		map.put("post_no", post_no);
		map.put("type", type);
		return session.selectList("commentMapper.getAllComments",map);
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
	
	public int insertReply(ReplyDTO dto) throws Exception{
		return session.insert("commentMapper.insertReply",dto);
	}
	
	public int deleteReply(int comment_no) throws Exception{
		return session.delete("commentMapper.deleteReply",comment_no);
	}
	
	public int deleteAllReferences(int comment_no) throws Exception{
		return session.update("commentMapper.deleteAllReferences",comment_no);
	}
	
	public int insertReply_reply(ReplyDTO dto) throws Exception{
		return session.insert("commentMapper.insertReply_reply",dto);
	}
}
