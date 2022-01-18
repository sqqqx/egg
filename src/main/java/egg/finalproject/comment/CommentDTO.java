package egg.finalproject.comment;

import java.sql.Date;

public class CommentDTO {
	
	private int comment_no;
	private int depth;
	private int reference_no;
	private String user_nickname;
	private String content;
	private Date written_date;
	private int post_no;
	private String user_id;
	
	public CommentDTO() {}

	public CommentDTO(int comment_no, int depth, int reference_no, String user_nickname, String content, Date written_date,
			int post_no, String user_id) {
		super();
		this.comment_no = comment_no;
		this.depth = depth;
		this.reference_no = reference_no;
		this.user_nickname = user_nickname;
		this.content = content;
		this.written_date = written_date;
		this.post_no = post_no;
		this.user_id = user_id;
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getReference_no() {
		return reference_no;
	}

	public void setReference_no(int reference_no) {
		this.reference_no = reference_no;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWritten_date() {
		return written_date;
	}

	public void setWritten_date(Date written_date) {
		this.written_date = written_date;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
}
