package egg.finalproject.comment;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReplyDTO {
	private int comment_no;
	private int type;
	private int parent_no;
	private int reference_no;
	private String user_nickname;
	private String content;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date written_date;
	private int post_no;
	private String user_id;
	private String reference_nickname;
	
	public ReplyDTO() {}

	public ReplyDTO(int comment_no, int type, int parent_no, int reference_no, String user_nickname, String content,
			Date written_date, int post_no, String user_id, String reference_nickname) {
		super();
		this.comment_no = comment_no;
		this.type = type;
		this.parent_no = parent_no;
		this.reference_no = reference_no;
		this.user_nickname = user_nickname;
		this.content = content;
		this.written_date = written_date;
		this.post_no = post_no;
		this.user_id = user_id;
		this.reference_nickname = reference_nickname;
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getParent_no() {
		return parent_no;
	}

	public void setParent_no(int parent_no) {
		this.parent_no = parent_no;
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

	public String getReference_nickname() {
		return reference_nickname;
	}

	public void setReference_nickname(String reference_nickname) {
		this.reference_nickname = reference_nickname;
	}
	
	
}

	
