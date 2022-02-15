package egg.finalproject.post;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egg.finalproject.category.CategoryDTO;
import egg.finalproject.category.CategoryService;
import egg.finalproject.expert_category.Expert_categoryService;
import egg.finalproject.member.MemberDTO;

@Controller
@RequestMapping("/offlinePost")
public class offlinePostController {

	@Autowired
	private offlinePostService service;
	
	@Autowired
	private onlinePostService onlineService;
	
	@Autowired
	private CategoryService cService;
	
	@Autowired
	private Expert_categoryService exService;
	
	@Autowired
	private HttpSession session;
	
	//게시글 리스트 페이지로 이동
//	@RequestMapping("/toList.do")
//	public String toList(String parent_group,String expert_id, Model model) throws Exception{
//		System.out.println(parent_group);
//		List<PostDTO> list = service.selectByCg(parent_group);
//		List<Object> Exlist = exService.ExpertCategory(expert_id);
//		model.addAttribute("ExpertCategory",list);
//		model.addAttribute("list", list);
//		model.addAttribute("parent_group", parent_group);
//		return "offline/offlineList";
//	}
	
	// (마이페이지) 찜한 게시글 가져오기
	@RequestMapping("/toLikePost")
	public String toLikePost(int currentPage, String searchOption, String searchKeyword, int type, Model model) throws Exception {
		MemberDTO dto = ((MemberDTO)session.getAttribute("loginSession"));
		service.getMyLikePostCount(dto.getUser_id(), searchOption, searchKeyword, type);
		Map<String, Object> navi = service.getNavi(currentPage);
		Map<String, Object> range = service.getRange(currentPage);
		List<Map<String, Object>> list = service.getMyLikePost(dto.getUser_id(), searchOption, searchKeyword, range, type);
		
		model.addAttribute("navi", navi);
		model.addAttribute("list", list);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("type", type);
		model.addAttribute("dto", dto);
		return "member/viewLikePost";
	}
	
	// (마이페이지) 내가 쓴 글 가져오기
	@RequestMapping("/toMyPost")
	public String toMyOrder(int currentPage, String searchOption, String searchKeyword, Model model) throws Exception {
		MemberDTO dto = ((MemberDTO)session.getAttribute("loginSession"));
		service.getMyPostCount(dto.getUser_id(), searchOption, searchKeyword);
		Map<String, Object> navi = service.getNavi(currentPage);
		Map<String, Object> range = service.getRange(currentPage);
		List<PostDTO> list = service.getMyPost(dto.getUser_id(), searchOption, searchKeyword, range);
		model.addAttribute("navi", navi);
		model.addAttribute("list", list);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("dto", dto);
		return "member/viewPost";
	}
	
	// 전체 목록 가져오기(게시글 리스트 페이지로 이동)
	@RequestMapping("/toList.do")
	public String toList(String parent_group, String expert_id, String currentPage, Model model) throws Exception{
		int currentIdx = service.currentPageReform(currentPage);
		service.getPostCountAll(parent_group); 
		Map<String, Object> navi = service.getNavi(currentIdx);
		Map<String, Object> range = service.getRange(currentIdx);
		
		List<PostDTO> list = service.selectByCg(parent_group, range);
		List<Object> Exlist = exService.ExpertCategory(expert_id);
		
		model.addAttribute("navi", navi);
		model.addAttribute("ExpertCategory", Exlist);
		model.addAttribute("ExpertCategory",Exlist);
		model.addAttribute("list", list);
		model.addAttribute("expert_id", expert_id);
		model.addAttribute("parent_group", parent_group);
		return "offline/offlineList";
	}
	
	// 검색 목록 가져오기
	@RequestMapping("/getPostbySearch.do")
	public String getPostbySearch(String searchKeyword, String searchOption, String parent_group, String expert_id, int currentIdx, Model model) throws Exception {
		service.getPostCountSearch(parent_group, searchOption, searchKeyword); 
		Map<String, Object> navi = service.getNavi(currentIdx);
		Map<String, Object> range = service.getRange(currentIdx);
		
		List<PostDTO> list = service.getPostbySearch(parent_group, range, searchOption, searchKeyword);
		List<Object> Exlist = exService.ExpertCategory(expert_id);
		
		model.addAttribute("navi", navi);
		model.addAttribute("ExpertCategory", Exlist);
		model.addAttribute("list", list);
		model.addAttribute("expert_id", expert_id);
		model.addAttribute("parent_group", parent_group);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchKeyword", searchKeyword);
		return "offline/offlineList";
	}
	
	///////////////////////////게시글 작성//////////////////////////////
	
	//게시글 작성 페이지로 이동 : written by 경민
	@RequestMapping("/toWrite.do") 
	public String toWrite(String parent_group, Model model) throws Exception{
		System.out.println(parent_group);
		List<CategoryDTO> categoryList = cService.getChildCategory(parent_group);
		for(CategoryDTO dto : categoryList) {
			System.out.println("여긴 되고 있냐고");
			System.out.println(dto.getChild_group());
		}
		model.addAttribute("categoryList",categoryList);
		model.addAttribute("parent_group",parent_group);
		return "offlinePost/offlinePost_write";
	}
	
	//게시글 작성 : written by 경민
	//TODO: return할 주소값 잘 확인하기
	@RequestMapping("/insertPost.do")
	@ResponseBody
	public String insertPost(PostDTO dto) throws Exception{
		//type설정 잊지 않기!!
		dto.setType(2);
		dto.setUser_id(((MemberDTO)session.getAttribute("loginSession")).getUser_id());
		dto.setUser_nickname(((MemberDTO)session.getAttribute("loginSession")).getUser_nickname());
		if(service.insertPost(dto)>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	//게시글 상세 조회 페이지로 이동 : written by 경민
	@RequestMapping("/toPostDetail.do")
	public String toPostDetail(int post_no, Model model) throws Exception{
		service.viewcount(post_no);
		PostDTO postDto = onlineService.getPostInfo(post_no);
		CategoryDTO categoryDto = cService.getCategory(postDto.getCategory_no());
		model.addAttribute("PostDTO", postDto);
		model.addAttribute("CategoryDTO",categoryDto);
		return "offlinePost/offlinePost_detail_expert";
	}
	
	@RequestMapping("toStudentPostDetail.do")
	public String toStudentPostDetail(int post_no, Model model) throws Exception{
		PostDTO postDto = onlineService.getPostInfo(post_no);
		CategoryDTO categoryDto = cService.getCategory(postDto.getCategory_no());
		model.addAttribute("PostDTO", postDto);
		model.addAttribute("CategoryDTO",categoryDto);
		return "offlinePost/offlinePost_detail_student";
	}
	
	//TODO : 프론트단 마이페이지로 연결하기.
	@RequestMapping("/deletePost.do")
	@ResponseBody
	public String deletePost(int post_no) throws Exception{
		System.out.println("post_no : "+post_no);
		if(onlineService.deletePost(post_no)) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	/*
	 * //게시글 삭제 처리 : written by 경민
	 * 
	 * @RequestMapping("/deletePost.do") public String
	 */
}
