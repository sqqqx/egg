package egg.finalproject.message;

import java.sql.Date;

public class MessageDTO {

	private int message_no;
	private String content;
	private Date message_date;
	private String from_id;
	private String to_id;
	
	public MessageDTO() {}
	
	public MessageDTO(int message_no, String content, Date message_date, String from_id, String to_id) {
		super();
		this.message_no = message_no;
		this.content = content;
		this.message_date = message_date;
		this.from_id = from_id;
		this.to_id = to_id;
	}

	public int getMessage_no() {
		return message_no;
	}

	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getMessage_date() {
		return message_date;
	}

	public void setMessage_date(Date message_date) {
		this.message_date = message_date;
	}

	public String getFrom_id() {
		return from_id;
	}

	public void setFrom_id(String from_id) {
		this.from_id = from_id;
	}

	public String getTo_id() {
		return to_id;
	}

	public void setTo_id(String to_id) {
		this.to_id = to_id;
	}
	
	
}
