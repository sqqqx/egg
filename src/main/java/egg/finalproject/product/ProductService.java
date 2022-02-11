package egg.finalproject.product;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egg.finalproject.order.OrderDAO;
import egg.finalproject.order.OrderProduct;

@Service
public class ProductService {
	@Autowired
	private ProductDAO dao;
	@Autowired
	private OrderDAO orderDAO;
	
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
	
	public boolean deleteProduct(int product_no) throws Exception{
		return dao.deleteProduct(product_no)>0;
	}
	
	public boolean modifyProduct(ProductDTO dto,MultipartFile thumbNail, String realPath) throws Exception{
		System.out.println("service 들어옴");
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
		}
		int result = dao.modifyProduct(dto);
		System.out.println("result"+result);
		return result>0;
	}
	
	public boolean modifyProductWithoutThumbnail(ProductDTO dto) throws Exception{
		return dao.modifyProduct(dto)>0;
	}
	
	// (마이페이지) 주문 후 재고 수량 조정
	public int modifyStock(String order_no, int opt) throws Exception {
		System.out.println("ProductService / modifyStock - order_no: " + order_no + ", opt: " + opt);
		// 주문번호에 있는 주문상품 목록 가져오기
		List<OrderProduct> pList = orderDAO.getOrderProduct(order_no);
		
		if(opt == 0) {	// opt가 0이라면 재고 감소
			for(int i = 0; i < pList.size(); i++) {
				Map<String, Integer> map = new HashMap<>(); 
				// 상품번호
				int product_no = pList.get(i).getProduct_no();
				map.put("product_no", product_no);
				// 수정할 재고 수량을 구하기 위하여 기존에 재고 수량 가져오기
				ProductDTO pDTO = dao.getProduct(product_no);
				int stock = pDTO.getStock() - pList.get(i).getQuantity();
				// 수정할 수량
				map.put("stock", stock);
				System.out.println("재고수량 수정 보내기 전 - map: " + map.toString());
				System.out.println("기존 수량: " + pDTO.getStock() + ", 감소 수량: " + pList.get(i).getQuantity());
				return dao.modifyStock(map);
			}
		} else if(opt == 1) { // opt가 1이라면 재고 증가
			for(int i = 0; i < pList.size(); i++) {
				Map<String, Integer> map = new HashMap<>(); 
				// 상품번호
				int product_no = pList.get(i).getProduct_no();
				map.put("product_no", product_no);
				// 수정할 재고 수량을 구하기 위하여 기존에 재고 수량 가져오기
				ProductDTO pDTO = dao.getProduct(product_no);
				int stock = pDTO.getStock() + pList.get(i).getQuantity();
				// 수정할 수량
				map.put("stock", stock);
				System.out.println("재고수량 수정 보내기 전 - map: " + map.toString());
				System.out.println("기존 수량: " + pDTO.getStock() + ", 증가 수량: " + pList.get(i).getQuantity());
				return dao.modifyStock(map);
			}
		}
		return -1;
	}
	
	
}
