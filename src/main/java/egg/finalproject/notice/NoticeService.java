package egg.finalproject.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {

	@Autowired
	private NoticeDAO dao;
	
	public int insert(NoticeDTO dto) throws Exception{
		return dao.insert(dto);
	}

	public List<NoticeDTO> selectById(String to_id) throws Exception{
		return dao.selectById(to_id);
	}
	
	public boolean deleteAll(String to_id)throws Exception{
		return dao.deleteAll(to_id)>0;
	}
	
	public boolean deleteByNo(int notice_no)throws Exception{
		return dao.deleteByNo(notice_no)>0;
	}
	public boolean delete(int type, int post_no, String to_id, String from_id)throws Exception{
		return dao.delete(type, post_no, to_id, from_id)>0;
	}
}

