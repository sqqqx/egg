package egg.finalproject.like;

import java.sql.Date;

public class LikeDTO {

	private String user_id;
	private int post_no;
	private Date like_date;
	
	public LikeDTO() {}

	public LikeDTO(String user_id, int post_no, Date like_date) {
		super();
		this.user_id = user_id;
		this.post_no = post_no;
		this.like_date = like_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public Date getLike_date() {
		return like_date;
	}

	public void setLike_date(Date like_date) {
		this.like_date = like_date;
	}
	
	
}
