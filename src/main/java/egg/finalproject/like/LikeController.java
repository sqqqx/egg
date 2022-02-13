package egg.finalproject.like;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/like")
public class LikeController {
	
	@Autowired
	private LikeService service;
	@Autowired
	private HttpSession session;
	
	//게시글좋아요 카운트
	@RequestMapping("/count.do")
	@ResponseBody
	public int count(int post_no) throws Exception {
		int count = service.count(post_no);
		return count;
	}
	
	//좋아요 추가
	@RequestMapping("/plus.do")
	@ResponseBody
	public String plus(String user_id, int type, int post_no) throws Exception{
		if(service.plus(user_id, type, post_no) ==1) {
			return "available";
		}else {
			return "unavailable";
		}
		
	}
	
	//좋아요 취소
	@RequestMapping("/minus.do")
	@ResponseBody
	public String minus(String user_id, int type, int post_no) throws Exception{
		if(service.minus(user_id, type, post_no) ==1) {
			return "available";
		}else {
			return "unavailable";
		}
		
	}
	 
	//알람을 위한 좋아요 추가
			@RequestMapping(value="/plusAlarm.do", produces = "application/text; charset=utf8")
			@ResponseBody
			public String plusAlarm(String user_id, int type, int post_no, Model model) throws Exception{
				if(service.plus(user_id,type, post_no) ==1) {
					String NN = service.getNNforPost(type,post_no);
					return NN;
				}else {
					return "unavailable";
				}
				
			}
		
	
	//알람을 위한 좋아요 추가
		@RequestMapping(value="/plusReply.do", produces = "application/text; charset=utf8")
		@ResponseBody
		public String plusReply(String user_id, int type, int post_no, Model model) throws Exception{
			if(service.plus(user_id, type, post_no) ==1) {
				String NN = service.getNN(type,post_no);
				return NN;
			}else {
				return "unavailable";
			}
			
		}
		
	//유저가 게시글에 좋아요 눌렀는지 판별
	@RequestMapping("/selectLike.do")
	@ResponseBody
	public String selectLike(String user_id, int type, int post_no) throws Exception{
		if(service.selectLike(user_id, type, post_no) ==1) {
			return "available";
		}else {
			return "unavailable";
		}
		
	}

}
