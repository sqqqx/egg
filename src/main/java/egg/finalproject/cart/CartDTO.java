package egg.finalproject.cart;

public class CartDTO {

	private String user_id;
	private int product_no;
	private int quantity;
	
	public CartDTO() {}

	public CartDTO(String user_id, int product_no, int quantity) {
		super();
		this.user_id = user_id;
		this.product_no = product_no;
		this.quantity = quantity;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
