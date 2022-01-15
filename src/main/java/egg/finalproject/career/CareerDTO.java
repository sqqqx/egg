package egg.finalproject.career;

public class CareerDTO {

	private int career_no;
	private String original_name;
	private String system_name;
	private String expert_id;
	
	public CareerDTO() {}

	public CareerDTO(int career_no, String original_name, String system_name, String expert_id) {
		super();
		this.career_no = career_no;
		this.original_name = original_name;
		this.system_name = system_name;
		this.expert_id = expert_id;
	}

	public int getCareer_no() {
		return career_no;
	}

	public void setCareer_no(int career_no) {
		this.career_no = career_no;
	}

	public String getOriginal_name() {
		return original_name;
	}

	public void setOriginal_name(String original_name) {
		this.original_name = original_name;
	}

	public String getSystem_name() {
		return system_name;
	}

	public void setSystem_name(String system_name) {
		this.system_name = system_name;
	}

	public String getExpert_id() {
		return expert_id;
	}

	public void setExpert_id(String expert_id) {
		this.expert_id = expert_id;
	}
	
	
}
