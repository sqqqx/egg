package egg.finalproject.offer;

public class OfferDTO {

	private int offer_no;
	private String writer;
	private String cost;
	private String content;
	private int post_no;
	
	public OfferDTO() {}

	public OfferDTO(int offer_no, String writer, String cost, String content, int post_no) {
		super();
		this.offer_no = offer_no;
		this.writer = writer;
		this.cost = cost;
		this.content = content;
		this.post_no = post_no;
	}

	public int getOffer_no() {
		return offer_no;
	}

	public void setOffer_no(int offer_no) {
		this.offer_no = offer_no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	
	
}
