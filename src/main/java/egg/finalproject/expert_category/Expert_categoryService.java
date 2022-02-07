package egg.finalproject.expert_category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egg.finalproject.post.onlinePostDAO;

@Service
public class Expert_categoryService {
	
	@Autowired
	private Expert_categoryDAO dao;

	public List<Object> ExpertCategory(String expert_id) throws Exception{
		return dao.ExpertCategory(expert_id);
	}
}
