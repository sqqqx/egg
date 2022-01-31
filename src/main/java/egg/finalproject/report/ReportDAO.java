package egg.finalproject.report;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDAO {
	@Autowired
	private SqlSession session;
	
	public int insertReport(ReportDTO dto) {
		return session.insert("reportMapper.insertReport",dto);
	}
}
