package egg.finalproject.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {

	@Autowired
	private NoticeDAO dao;
	
	public int insert(NoticeDTO dto) throws Exception{
		return dao.insert(dto);
	}

}
