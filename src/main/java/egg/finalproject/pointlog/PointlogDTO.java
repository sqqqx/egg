package egg.finalproject.pointlog;

import java.util.Date;

public class PointlogDTO {
	private int pointlog_no;
	private Date log_date;
	private String user_id;
	private int editp;
	private int balance;
	
	public PointlogDTO() {}

	public PointlogDTO(int pointlog_no, Date log_date, String user_id, int editp, int balance) {
		super();
		this.pointlog_no = pointlog_no;
		this.log_date = log_date;
		this.user_id = user_id;
		this.editp = editp;
		this.balance = balance;
	}

	public int getPointlog_no() {
		return pointlog_no;
	}

	public void setPointlog_no(int pointlog_no) {
		this.pointlog_no = pointlog_no;
	}

	public Date getLog_date() {
		return log_date;
	}

	public void setLog_date(Date log_date) {
		this.log_date = log_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getEditp() {
		return editp;
	}

	public void setEditp(int editp) {
		this.editp = editp;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	@Override
	public String toString() {
		return "PointlogDTO [pointlog_no=" + pointlog_no + ", log_date=" + log_date + ", user_id=" + user_id
				+ ", editp=" + editp + ", balance=" + balance + "]";
	}
	
}
