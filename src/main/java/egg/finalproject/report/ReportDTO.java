package egg.finalproject.report;

import java.sql.Date;

public class ReportDTO {
	private int report_no;
	private int type;
	private int target_no;
	private int report_title;
	private String report_content;
	private int yn;
	private String user_id;
	
	public ReportDTO() {}

	public ReportDTO(int report_no, int type, int target_no, int report_title, String report_content, int yn,
			String user_id) {
		super();
		this.report_no = report_no;
		this.type = type;
		this.target_no = target_no;
		this.report_title = report_title;
		this.report_content = report_content;
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

	public int getReport_title() {
		return report_title;
	}

	public void setReport_title(int report_title) {
		this.report_title = report_title;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
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
