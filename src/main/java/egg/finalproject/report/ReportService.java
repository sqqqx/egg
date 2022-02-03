package egg.finalproject.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportService {
	@Autowired
	private ReportDAO dao;
	
	//신고 추가 성공 시 true반환
	public boolean insertReport(ReportDTO dto) {
		return dao.insertReport(dto)>0;
	}
}
