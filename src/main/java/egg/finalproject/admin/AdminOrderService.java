package egg.finalproject.admin;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Service
public class AdminOrderService extends Paging {
	
	@Autowired
	private AdminOrderDAO dao;
	
	// 주문 수 가져오기
	public int getOrderCount(String searchOption, String searchKeyword) throws Exception {
		Map<String, String> map = new HashMap<>();
		if(searchOption != null && searchKeyword != null) {
			map.put("searchOption", searchOption);
			map.put("searchKeyword", searchKeyword);
		}
		int rs = dao.getOrderCount(map);
		System.out.println("getOrderCount : " + rs);
		return rs;
	}
	
	// 주문 목록 가져오기
	public List<Map<String, Object>> getOrderList(int currentIdx, String searchOption, String searchKeyword) throws Exception {
		System.out.println("currentIdx : " + currentIdx + " : searchOption : " + searchOption + " : searchKeyword : " + searchKeyword);
		Map<String, Object> map = this.getRange(currentIdx);
		if(searchOption != null && searchKeyword != null) {
			map.put("searchOption", searchOption);
			map.put("searchKeyword", searchKeyword);
		}
		map.put("currentIdx", currentIdx);
		totalCount = this.getOrderCount(searchOption, searchKeyword);
		List<Map<String, Object>> list = dao.getOrderList(map);
		System.out.println("getOrderList_list.size : " + list.size());
		return list;
	}
	
	// 상품 목록 가져오기
	public List<Map<String, Object>> getProductList(int order_no) throws Exception {
		System.out.println("order_no : " + order_no);
		return dao.getProductList(order_no);
	}
	
	// 주문 상태 확인
	public String checkOrder(String payment_no) throws Exception {
		System.out.println("payment_no : " + payment_no);
		String rs = dao.checkOrder(payment_no);
		System.out.println("status : " + rs);
		return rs;
	}
	
	// 주문 상태 변경
	public int updateStatus(String order_no) throws Exception {
		return dao.updateStatus(order_no);
	}
	
	// 주문 상세 정보
	public Map<String, Object> getOrderDetail(String order_no) throws Exception {
		Map<String, Object> map = dao.getOrderDetail(order_no);
		//System.out.println(map.size());
		return map;
	}
	
	// 배송지 변경
	public int changeAddress(String address, String order_no) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("address", address);
		map.put("order_no", order_no);
		return dao.changeAddress(map);
	}
	
	// 토큰 가져오기
	public String getToken() throws Exception {
		HttpURLConnection conn = null;
		URL url = new URL("https://api.iamport.kr/users/getToken");
		conn = (HttpURLConnection) url.openConnection();

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
		
		JsonObject json = new JsonObject();
		json.addProperty("imp_key", "2315446049599296");
		json.addProperty("imp_secret", "a772a7847416496c3e0f5c3b64ce8663199821721ebe345a615c97810528d60446233a25d10f21a1");

		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		bw.write(json.toString());
		bw.flush();
		bw.close();

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
		Gson gson = new Gson();
		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
		System.out.println(response);
		String token = gson.fromJson(response, Map.class).get("access_token").toString();
		
		br.close();
		conn.disconnect();

		return token;
	}
	
	// 결제 취소
	public String canclePay(String access_token, String payment_no) throws Exception {
		String rs = "success";
		System.out.println("결제 취소 service");
		System.out.println("access_token : " + access_token + " : imp_uid : " + payment_no);

		HttpURLConnection conn = null;
		URL url = new URL("https://api.iamport.kr/payments/cancel");
		conn = (HttpURLConnection) url.openConnection();

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setRequestProperty("Authorization", access_token);
		conn.setDoOutput(true);

		JsonObject json = new JsonObject();
//		json.addProperty("reason", reason); // 필요할 때 추가할 것 결제 쪽 상황보고 수정
		json.addProperty("imp_uid", payment_no);
//		json.addProperty("amount", amount);
//		json.addProperty("checksum", amount);

		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		bw.write(json.toString());
		bw.flush();
		bw.close();

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
//		Gson gson = new Gson();
//		System.out.println(gson.fromJson(br.readLine(), Map.class).get("response").toString())); 
		// 왜 null일까
		
		StringBuilder sb = new StringBuilder();
		String line = "";
		while ((line = br.readLine()) != null) {
			sb.append(line);
		}
		int rspCode = Integer.parseInt(String.valueOf(sb.charAt(8)));
		if(rspCode == 1) {
			rs = "fail";
		}
		
		br.close();
		conn.disconnect();
		System.out.println("rs : " + rs);
		return rs;
	}
}
