package egg.finalproject.image;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ImageDAO {
	@Autowired
	private SqlSession session;
	
	public void insertFile(ImageDTO dto) throws Exception{
		session.insert("imageMapper.insertFile",dto);
	}
	
	public ImageDTO getThumbNail(int post_no) throws Exception{
		System.out.println("dao post_no : "+post_no);
		ImageDTO dto = session.selectOne("imageMapper.getThumbNail",post_no);
	    System.out.println(dto);
		return dto;
	}
}
