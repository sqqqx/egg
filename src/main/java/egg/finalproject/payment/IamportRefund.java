package egg.finalproject.payment;

public class IamportRefund {
	private String merchant_uid;	// 결제건의 주문번호
	private int cancel_request_amount;	// 환불금액
	private String reason;	// 환불사유
	private String refund_holder;	// 환불 수령계좌 예금주
	private int refund_bank;	// 환불 수령계좌 은행코드
	private String refund_account;	// 환불 수량계좌 번호
	
	public IamportRefund() {}

	public IamportRefund(String merchant_uid, int cancel_request_amount, String reason, String refund_holder,
			int refund_bank, String refund_account) {
		super();
		this.merchant_uid = merchant_uid;
		this.cancel_request_amount = cancel_request_amount;
		this.reason = reason;
		this.refund_holder = refund_holder;
		this.refund_bank = refund_bank;
		this.refund_account = refund_account;
	}

	public String getMerchant_uid() {
		return merchant_uid;
	}

	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}

	public int getCancel_request_amount() {
		return cancel_request_amount;
	}

	public void setCancel_request_amount(int cancel_request_amount) {
		this.cancel_request_amount = cancel_request_amount;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getRefund_holder() {
		return refund_holder;
	}

	public void setRefund_holder(String refund_holder) {
		this.refund_holder = refund_holder;
	}

	public int getRefund_bank() {
		return refund_bank;
	}

	public void setRefund_bank(int refund_bank) {
		this.refund_bank = refund_bank;
	}

	public String getRefund_account() {
		return refund_account;
	}

	public void setRefund_account(String refund_account) {
		this.refund_account = refund_account;
	}

	@Override
	public String toString() {
		return "IamportRefund [merchant_uid=" + merchant_uid + ", cancel_request_amount=" + cancel_request_amount
				+ ", reason=" + reason + ", refund_holder=" + refund_holder + ", refund_bank=" + refund_bank
				+ ", refund_account=" + refund_account + "]";
	}
	
	
}
