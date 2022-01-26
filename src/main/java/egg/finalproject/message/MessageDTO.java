package egg.finalproject.message;

import java.sql.Date;

public class MessageDTO {

	private int message_no;
	private String title;
	private String content;
	private String message_check;
	private Date message_date;
	private String from_id;
	private String to_id;
	private String from_delete;
	private String to_delete;
	
	public MessageDTO() {}
	public MessageDTO(int message_no, String title, String content, String message_check, Date message_date,
			String from_id, String to_id, String from_delete, String to_delete) {
		super();
		this.message_no = message_no;
		this.title = title;
		this.content = content;
		this.message_check = message_check;
		this.message_date = message_date;
		this.from_id = from_id;
		this.to_id = to_id;
		this.from_delete = from_delete;
		this.to_delete = to_delete;
	}
	public int getMessage_no() {
		return message_no;
	}
	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMessage_check() {
		return message_check;
	}
	public void setMessage_check(String message_check) {
		this.message_check = message_check;
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
	public String getFrom_delete() {
		return from_delete;
	}
	public void setFrom_delete(String from_delete) {
		this.from_delete = from_delete;
	}
	public String getTo_delete() {
		return to_delete;
	}
	public void setTo_delete(String to_delete) {
		this.to_delete = to_delete;
	}
	
	@Override
	public String toString() {
		return "MessageDTO [message_no=" + message_no + ", title=" + title + ", content=" + content + ", message_check="
				+ message_check + ", message_date=" + message_date + ", from_id=" + from_id + ", to_id=" + to_id
				+ ", from_delete=" + from_delete + ", to_delete=" + to_delete + "]";
	}
}
