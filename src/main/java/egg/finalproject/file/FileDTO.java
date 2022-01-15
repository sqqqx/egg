package egg.finalproject.file;

public class FileDTO {

	private int file_no;
	private String origin_name;
	private String system_name;
	private int message_no;
	
	public FileDTO() {}

	public FileDTO(int file_no, String origin_name, String system_name, int message_no) {
		super();
		this.file_no = file_no;
		this.origin_name = origin_name;
		this.system_name = system_name;
		this.message_no = message_no;
	}

	public int getFile_no() {
		return file_no;
	}

	public void setFile_no(int file_no) {
		this.file_no = file_no;
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

	public int getMessage_no() {
		return message_no;
	}

	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}
	
	
}
