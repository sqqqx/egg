package egg.finalproject.expert_category;

public class Expert_categoryDTO {

	private String expert_id;
	private int category_no;
	
	public Expert_categoryDTO() {}

	public Expert_categoryDTO(String expert_id, int category_no) {
		super();
		this.expert_id = expert_id;
		this.category_no = category_no;
	}

	public String getExpert_id() {
		return expert_id;
	}

	public void setExpert_id(String expert_id) {
		this.expert_id = expert_id;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
	
	
}
