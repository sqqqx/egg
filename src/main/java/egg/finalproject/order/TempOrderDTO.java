package egg.finalproject.order;

public class TempOrderDTO {
	private int product_no;
	private String name;
	private int price;
	private int stock;
	private String content;
	private String image_path;
	private int quantity;
	
	public TempOrderDTO() {}

	public TempOrderDTO(int product_no, String name, int price, int stock, String content, String image_path,
			int quantity) {
		super();
		this.product_no = product_no;
		this.name = name;
		this.price = price;
		this.stock = stock;
		this.content = content;
		this.image_path = image_path;
		this.quantity = quantity;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getName() {
		return name;
	}

	public void setProductName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage_path() {
		return image_path;
	}

	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	// (마이페이지) 주문 결제 확인을 위한 메서드추가
	@Override
	public String toString() {
		return "TempOrderDTO [product_no=" + product_no + ", name=" + name + ", price=" + price + ", stock=" + stock
				+ ", content=" + content + ", image_path=" + image_path + ", quantity=" + quantity + "]";
	}
	
}
