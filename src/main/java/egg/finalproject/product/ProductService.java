package egg.finalproject.product;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egg.finalproject.image.ImageDTO;
import egg.finalproject.order.TempOrderDTO;

@Service
public class ProductService {
	@Autowired
	private ProductDAO dao;
	
	//검색어에 따른 상품 정보 얻어오기
	//RETURN : 검색어에 해당하는 List<ProductDTO> 반환 
	public List<ProductDTO> searchProduct(String value) throws Exception {
		System.out.println("sevice 진입" + value);
		return dao.searchProduct(value);
	}
	
	//product_no에 해당하는 ProductDTO 정보 받아오기
	//RETURN : ProductDTO
	public ProductDTO getProduct(int product_no) throws Exception{
		return dao.getProduct(product_no);
	}
	
	
	//상품 페이지에 입력된 상품 정보 + 썸네일 저장
	//RETURN XX
	public void insertProduct(ProductDTO dto,MultipartFile thumbNail, String realPath) throws Exception{
		System.out.println("여기 들어옴1");
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
			dto.setImage_path(system_name);
			dao.insertProduct(dto);
		}
	}
}
