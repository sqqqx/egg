package egg.finalproject.comment;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egg.finalproject.member.MemberDTO;

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Autowired
	private CommentService service;
	
	@Autowired
	private HttpSession session;

	
	
	@RequestMapping("/getAllComments.do")
	@ResponseBody
	public List<CommentDTO> getAllComments(int post_no) throws Exception{
		return service.getAllComments(post_no);
	}
	
	@RequestMapping("/insertComment.do")
	@ResponseBody
	public List<CommentDTO> insertComment(CommentDTO dto) throws Exception{
		String user_id = ((MemberDTO)session.getAttribute("loginSession")).getUser_id();
	    String user_nickname = ((MemberDTO)session.getAttribute("loginSession")).getUser_nickname();
		dto.setUser_id(user_id);
		dto.setUser_nickname(user_nickname);
		if(service.insertComment(dto)) {
			return service.getAllComments(dto.getPost_no());
		}return null;
	}
	
	@RequestMapping("/deleteComment.do")
	@ResponseBody
	public List<CommentDTO> deleteComment(CommentDTO dto) throws Exception{
		System.out.println("post_no : "+dto.getPost_no());
		System.out.println("comment_no : "+dto.getComment_no());
		if(service.deleteComment(dto.getComment_no())){
			return service.getAllComments(dto.getPost_no());
		}
		return null;
	}
	
	@RequestMapping("/modifyComment.do")
	@ResponseBody
	public List<CommentDTO> modifyComment(CommentDTO dto) throws Exception{
		System.out.println(dto.getComment_no());
		System.out.println(dto.getContent());
		System.out.println(dto.getPost_no());
		if(service.modifyComment(dto)) {
			System.out.println("true가 들어왔어!!");
		    System.out.println(dto.getPost_no());
			List<CommentDTO> list = service.getAllComments(dto.getPost_no());
			for(CommentDTO comment : list) {
				System.out.println(comment.getContent());
			}
			return list;
		}System.out.println("false가 들어왔어!!");
		return null;
	}
	
	@RequestMapping("/getAllReplies.do")
	@ResponseBody
	public List<ReplyDTO> getAllReplies(int comment_no) throws Exception{
		return service.getAllReplies(comment_no);
	}
	
	@RequestMapping("/insertReply.do")
	@ResponseBody
	public List<ReplyDTO> insertReply(ReplyDTO dto) throws Exception{
		System.out.println(dto.getPost_no());
		System.out.println(dto.getComment_no());
		System.out.println(dto.getContent());
		String user_id = ((MemberDTO)session.getAttribute("loginSession")).getUser_id();
	    String user_nickname = ((MemberDTO)session.getAttribute("loginSession")).getUser_nickname();
		dto.setUser_id(user_id);
		dto.setUser_nickname(user_nickname);
		if(service.insertReply(dto)) {
			return service.getAllReplies(dto.getComment_no());
		}return null;
	}
	
	@RequestMapping("/deleteReply.do")
	@ResponseBody
	public List<ReplyDTO> deleteReply(int comment_no, int parent_no) throws Exception{
		System.out.println("comment_no : "+comment_no);
		System.out.println("parent_no : "+ parent_no);
		if(service.deleteReply(comment_no)) {
			return getAllReplies(parent_no);
		}return null;
	}
	@RequestMapping("/insertReply_reply.do")
	@ResponseBody
	public List<ReplyDTO> insertReply_reply(ReplyDTO dto) throws Exception{
		String user_id = ((MemberDTO)session.getAttribute("loginSession")).getUser_id();
	    String user_nickname = ((MemberDTO)session.getAttribute("loginSession")).getUser_nickname();
		dto.setUser_id(user_id);
		dto.setUser_nickname(user_nickname);
		if(service.insertReply_reply(dto)) {
			return service.getAllReplies(dto.getParent_no());
		}return null;
	}
}
