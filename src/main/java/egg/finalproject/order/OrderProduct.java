package egg.finalproject.order;

public class OrderProduct {
	private String order_no;
	private int product_no;
	private int quantity;
	
	public OrderProduct() {}

	public OrderProduct(String order_no, int product_no, int quantity) {
		super();
		this.order_no = order_no;
		this.product_no = product_no;
		this.quantity = quantity;
	}

	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
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

	@Override
	public String toString() {
		return "OrderProduct [order_no=" + order_no + ", product_no=" + product_no + ", quantity=" + quantity + "]";
	}
}
