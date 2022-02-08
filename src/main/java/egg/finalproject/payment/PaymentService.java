package egg.finalproject.payment;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentService {
	@Autowired
	private PaymentDAO dao;
	
	// (마이페이지) 결제 성공 후 결제내역 저장
	public int completePaid(PaymentDTO dto) throws Exception {
		System.out.println("PaymentService / 결제내역 저장 - PaymentDTO: " + dto);
		// 결제 성공 후 장바구니에서 목록 삭제
		return dao.completePaid(dto);
	}
	
	// (마이페이지) 아임포트 토큰 얻기
	public String getToken() throws Exception {
		/* 아임포트 토큰 얻기 */
		HttpURLConnection conn = null;
		String access_token = null;	// 발급받을 액세스 토큰
		URL url = new URL("https://api.iamport.kr/users/getToken");
		conn = (HttpURLConnection)url.openConnection();
		
		// 요청방식 : POST
		conn.setRequestMethod("POST");
		
		// Header 설정(application/json 형식으로 데이터를 전송)
		conn.setRequestProperty("Content-Type", "application/json");
		conn.setRequestProperty("Accept",  "application/json");	// 서버로부터 받을 Data를 JSON 형식 타입으로 요청함
		// conn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
		
		// Data 설정
		conn.setDoOutput(true);	// OutputStream으로 POST데이터를 넘겨주겠다는 옵션
		
		// 자신의 imp_key와 imp_secret키를 JSON형태로 넣은 후 아임포트 서버로 Request를 해준다.
		JSONObject obj = new JSONObject();
		obj.put("imp_key", "1330470575368827");
		obj.put("imp_secret", "f2d1ef5032b216cb74953d842116b660f0419830a4ec4bbfb8295d927bfc53107603b058335f49cb");
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		bw.write(obj.toString());
		bw.flush();
		bw.close();
		
		// 서버로부터 응답 데이터 받기
		int responseCode = conn.getResponseCode();	// 응답코드 받기
		System.out.println("응답코드는?? " + responseCode);
		
		if(responseCode == 200) {	// 성공
			System.out.println("응답성공");
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder sb = new StringBuilder();
			String line = null;
			while((line = br.readLine()) != null) {
				sb.append(line + "\n");
			}
			br.close();
			System.out.println("sb출력: " + sb.toString());
			
			int startNum = sb.indexOf("access_token")+15;
			String rs1 = sb.substring(startNum);
			int endNum = rs1.indexOf("\"");
			access_token = rs1.substring(0, endNum);
			System.out.println("access_token: " + access_token);
		} else {	// 실패
			System.out.println(conn.getResponseMessage());	// 환불 실패 시 정수값 0 반환(응답코드 400, 404 등)
		}
		conn.disconnect();
		return access_token;
	}
	
	// (마이페이지) 환불 처리
	public String refund(String access_token, String merchant_uid) throws Exception {
		/* 아임포트 REST API로 결제 환불 요청 */
		URL url = new URL("https://api.iamport.kr/payments/cancel");
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		
		// 요청방식 : POST
		conn.setRequestMethod("POST");
		
		// Header 설정(application/json 형식으로 데이터를 전송)
		conn.setRequestProperty("Content-Type", "application/json");
		conn.setRequestProperty("Accept",  "application/json");	// 서버로부터 받을 Data를 JSON 형식 타입으로 요청함
		conn.setRequestProperty("Authorization", access_token);
		// conn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
		
		// Data 설정
		conn.setDoOutput(true);	// OutputStream으로 POST데이터를 넘겨주겠다는 옵션
		
		// 자신의 imp_key와 imp_secret키를 JSON형태로 넣은 후 아임포트 서버로 Request를 해준다.
		JSONObject obj = new JSONObject();
		obj = new JSONObject();
		obj.put("reason", "단순변심");
		obj.put("merchant_uid", merchant_uid);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		bw.write(obj.toString());
		bw.flush();
		bw.close();
		
		// 서버로부터 응답 데이터 받기
		int responseCode = conn.getResponseCode();	// 응답코드 받기
		System.out.println("환불 응답코드는?? " + responseCode);
		
		if(responseCode == 200) {	// 성공
			System.out.println("환불 응답성공");
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder sb = new StringBuilder();
			String line = null;
			System.out.println("환불 line 출력");
			while((line = br.readLine()) != null) {
				sb.append(line + "\n");
				System.out.println(sb);
			}
			br.close();
			System.out.println("환불 sb출력: " + sb.toString());
			conn.disconnect();
			return "success";
		} else {	// 실패
			System.out.println(conn.getResponseMessage());	// 환불 실패 시 정수값 0 반환(응답코드 400, 404 등)
			conn.disconnect();
			return "fail";
		}
	}
}
