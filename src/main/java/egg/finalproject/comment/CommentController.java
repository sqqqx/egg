package egg.finalproject.comment;

import java.util.List;

import org.apache.maven.shared.invoker.SystemOutHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Autowired
	private CommentService service;
	
	@RequestMapping("/getAllComments.do")
	@ResponseBody
	public List<CommentDTO> getAllComments(int post_no) throws Exception{
		return service.getAllComments(post_no);
	}
	
	@RequestMapping("/insertComment.do")
	@ResponseBody
	public List<CommentDTO> insertComment(CommentDTO dto) throws Exception{
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
	
	@RequestMapping("/getAllReplies")
	public List<ReplyDTO> getAllReplies(int comment_no) throws Exception{
		return service.getAllReplies(comment_no);
	}
	
	@RequestMapping("/insertReply.do")
	@ResponseBody
	public List<ReplyDTO> insertReply(ReplyDTO dto) throws Exception{
		System.out.println(dto.getPost_no());
		System.out.println(dto.getComment_no());
		System.out.println(dto.getContent());
		return null;
	}
}
