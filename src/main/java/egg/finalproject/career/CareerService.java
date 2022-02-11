package egg.finalproject.career;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class CareerService {
	@Autowired
	private CareerDAO dao;
	
	// (마이페이지) 능력자 전환 - 커리어 파일 추가
	public int insertCareer(String realPath, String expert_id, MultipartFile careerFile, int category_no) throws Exception {
		System.out.println("CareerService / 커리어 파일 추가 - realPath: " + realPath + " / expert_id: " + expert_id + " / careerFile: " + careerFile);
		CareerDTO dto = new CareerDTO();
		dto.setExpert_id(expert_id);
		// 해당 경로가 있는지 확인
		File realPathCareerFiles = new File(realPath);
		if(!realPathCareerFiles.exists()) {	// 만약 경로가 존재하지 않으면 경로 생성
			realPathCareerFiles.mkdir();
		}
		
		// 1. 클라이언트로부터 넘어 온 파일유무 확인
		// 2. 지금 넘어 온 파일의 ori_name 얻어오기
		// 3. 넘어 온 파일을 서버에 저장할 때 저정할 이름(sys_name)만들기
		// 4. sys_name을 이용해 경로에 실제로 저장하기
		if(!careerFile.isEmpty()) {	// 파일이 비어 있지 않다면
			// 클라이언트가 업로드 한 원본 파일명
			String original_name = careerFile.getOriginalFilename();
			System.out.println("원본파일명: " + original_name);
			dto.setOriginal_name(original_name);
			
			// 서버에 저장할 파일명
			String sys_name = expert_id + "_" + category_no + "_" + original_name;
			System.out.println("서버에 저장할 파일명: " + sys_name);
			dto.setSystem_name(sys_name);
			String careerFile_path = realPath + File.separator + sys_name;
			// 파일을 서버에 저장
			careerFile.transferTo(new File(careerFile_path));
			return dao.insertCareer(dto);
		} else {
			return -1;
		}
	}
	
	// (마이페이지) 커리어DTO 불러오기
	public List<CareerDTO> getCareerList(String expert_id) throws Exception {
		System.out.println("CareerService / 커리어DTO 불러오기 - expert_id: " + expert_id);
		return dao.getCareerList(expert_id);
	}
}
