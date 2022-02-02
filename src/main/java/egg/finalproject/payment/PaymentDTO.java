package egg.finalproject.payment;

import java.sql.Date;

public class PaymentDTO {
	
	private int payment_no;
	private int cost;
	private Date payment_time;
	private String method;
	private String card_name;
	
	public PaymentDTO() {}

	public PaymentDTO(int payment_no, int cost, Date payment_time, String method, String card_name) {
		super();
		this.payment_no = payment_no;
		this.cost = cost;
		this.payment_time = payment_time;
		this.method = method;
		this.card_name = card_name;
	}

	public int getPayment_no() {
		return payment_no;
	}

	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public Date getPayment_time() {
		return payment_time;
	}

	public void setPayment_time(Date payment_time) {
		this.payment_time = payment_time;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getCard_name() {
		return card_name;
	}

	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}

	@Override
	public String toString() {
		return "PaymentDTO [payment_no=" + payment_no + ", cost=" + cost + ", payment_time=" + payment_time
				+ ", method=" + method + ", card_name=" + card_name + "]";
	}
}
