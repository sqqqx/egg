package egg.finalproject.image;

public class ImageDTO {
	
	private int image_no;
	private String origin_name;
	private String system_name;
	private int post_no;
	
	public ImageDTO() {}

	public ImageDTO(int image_no, String origin_name, String system_name, int post_no) {
		super();
		this.image_no = image_no;
		this.origin_name = origin_name;
		this.system_name = system_name;
		this.post_no = post_no;
	}

	public int getImage_no() {
		return image_no;
	}

	public void setImage_no(int image_no) {
		this.image_no = image_no;
	}

	public String getOrigin_name() {
		return origin_name;
	}

	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}

	public String getSystem_name() {
		return system_name;
	}

	public void setSystem_name(String system_name) {
		this.system_name = system_name;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	
	public String toString() {
		return "post_no : "+post_no+" system_name : "+system_name;
	}

}
