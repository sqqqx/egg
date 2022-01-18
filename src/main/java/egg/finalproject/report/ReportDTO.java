package egg.finalproject.report;

import java.sql.Date;

public class ReportDTO {

	private int report_no;
	private int type;
	private int target_no;
	private Date report_date;
	private int yn;
	private String user_id;
	
	public ReportDTO() {}

	public ReportDTO(int report_no, int type, int target_no, Date report_date, int yn, String user_id) {
		super();
		this.report_no = report_no;
		this.type = type;
		this.target_no = target_no;
		this.report_date = report_date;
		this.yn = yn;
		this.user_id = user_id;
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getTarget_no() {
		return target_no;
	}

	public void setTarget_no(int target_no) {
		this.target_no = target_no;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}

	public int getYn() {
		return yn;
	}

	public void setYn(int yn) {
		this.yn = yn;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
}
