package egg.finalproject.order;

import java.sql.Date;

public class OrderDTO {

	private String order_no;
	private Date order_time;
	private int cost;
	private String name;
	private String address;
	private String message;
	private String status;
	private String tracking_no;
	private int payment_no;
	private String user_id;
	
	public OrderDTO() {}

	public OrderDTO(String order_no, Date order_time, int cost, String name, String address, String message,
			String status, String tracking_no, int payment_no, String user_id) {
		super();
		this.order_no = order_no;
		this.order_time = order_time;
		this.cost = cost;
		this.name = name;
		this.address = address;
		this.message = message;
		this.status = status;
		this.tracking_no = tracking_no;
		this.payment_no = payment_no;
		this.user_id = user_id;
	}

	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

	public Date getOrder_time() {
		return order_time;
	}

	public void setOrder_time(Date order_time) {
		this.order_time = order_time;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTracking_no() {
		return tracking_no;
	}

	public void setTracking_no(String tracking_no) {
		this.tracking_no = tracking_no;
	}

	public int getPayment_no() {
		return payment_no;
	}

	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	// (마이페이지) 멤버필드 확인위한 toString 오버라이딩
	@Override
	public String toString() {
		return "OrderDTO [order_no=" + order_no + ", order_time=" + order_time + ", cost=" + cost + ", name=" + name
				+ ", address=" + address + ", message=" + message + ", status=" + status + ", tracking_no="
				+ tracking_no + ", payment_no=" + payment_no + ", user_id=" + user_id + "]";
	}
}
