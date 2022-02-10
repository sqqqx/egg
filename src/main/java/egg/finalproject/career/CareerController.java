package egg.finalproject.career;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/career")
public class CareerController {
	@Autowired
	private CareerService service;
	@Autowired
	private HttpSession session;
	
	// (마이페이지) 파일 다운로드 요청
	@RequestMapping("/download.do")
	public void download(HttpServletResponse response, CareerDTO dto) throws Exception {
		System.out.println("CareerController / 증명파일 다운로드 - CareerDTO: " + dto);
		String ori_name = dto.getOriginal_name();
		String sys_name = dto.getSystem_name();
		
		System.out.println(ori_name + " : " +  sys_name);
		
		// 파일이 저장된 폴더 경로
		String realPath = session.getServletContext().getRealPath("careerFiles");
		System.out.println("realPath: " + realPath);
		// 다운로드 할 파일의 총 경로
		File targetFile = new File(realPath + File.separator + sys_name);
		System.out.println("targetFile: " + targetFile);
		
		// 한글 깨짐방지 인코딩 설정
		ori_name = new String(ori_name.getBytes(), "ISO-8859-1");
		
		// 이걸 안 쓰면 파일다운로드가 되지 않고 화면에 띄우기만 한다.
		response.setHeader("Content-Disposition", "attachment; filename=\"" + ori_name + "\";");
		
		// DataOutputStream을 통해 반환하므로 void를 쓴다.
		try(DataInputStream dis = new DataInputStream(new FileInputStream(targetFile));
			DataOutputStream dos = new DataOutputStream(response.getOutputStream())){
			
			byte[] arr = dis.readAllBytes();
			dos.write(arr);
			dos.flush();
		}	
	}
}
