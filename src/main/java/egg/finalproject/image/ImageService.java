package egg.finalproject.image;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ImageService {
	@Autowired
	private ImageDAO dao;
	
	public void insertThumbNail(String realPath, MultipartFile thumbNail, int post_no) throws Exception {
		File realPathFile = new File(realPath);
		
		if (!realPathFile.exists()) {
			realPathFile.mkdir(); // 경로가 존재하지 않는 경우 파일을 새로 생성하는 작업.
		}
		if (!thumbNail.isEmpty()) {// 파일이 넘어왔다면
			// 1번 ori_name 얻어오기
			String origin_name = thumbNail.getOriginalFilename();
			System.out.println("ori_name : " + origin_name);

			// 2번 sys_name 지정하기
			String system_name = UUID.randomUUID() + "_" + origin_name;
			System.out.println(system_name);

			// 3번 sys_name으로 경로에 실제 저장하기
			// 이 부분이 없는 경우 파일이 넘어오더라도 저장되지 않음.
			thumbNail.transferTo(new File(realPath + File.separator + system_name));
			System.out.println(realPath + File.separator + system_name);
			dao.insertThumbNail(new ImageDTO(0, origin_name, system_name, post_no));
		}
	}
	public ImageDTO getThumbNail(int post_no) throws Exception{
		System.out.println("service post_no : "+post_no);
		return dao.getThumbNail(post_no);
	}
	
	public void updateThumbNail(String realPath, MultipartFile thumbNail ,int post_no) throws Exception{
        File realPathFile = new File(realPath);
		
		if (!realPathFile.exists()) {
			realPathFile.mkdir(); // 경로가 존재하지 않는 경우 파일을 새로 생성하는 작업.
		}
		if (!thumbNail.isEmpty()) {// 파일이 넘어왔다면
			// 1번 ori_name 얻어오기
			String origin_name = thumbNail.getOriginalFilename();
			System.out.println("ori_name : " + origin_name);

			// 2번 sys_name 지정하기
			String system_name = UUID.randomUUID() + "_" + origin_name;
			System.out.println(system_name);

			// 3번 sys_name으로 경로에 실제 저장하기
			// 이 부분이 없는 경우 파일이 넘어오더라도 저장되지 않음.
			thumbNail.transferTo(new File(realPath + File.separator + system_name));
			System.out.println(realPath + File.separator + system_name);
			dao.updateThumbNail(new ImageDTO(0, origin_name, system_name, post_no));
		}
	}
}
