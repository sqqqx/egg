package egg.finalproject.expert;

public class ExpertDTO {
	
	private String expert_id;
	private String active_area;
	private String introduction;
	private int point;
	
	public ExpertDTO() {}

	public ExpertDTO(String expert_id, String active_area, String introduction, int point) {
		super();
		this.expert_id = expert_id;
		this.active_area = active_area;
		this.introduction = introduction;
		this.point = point;
	}

	public String getExpert_id() {
		return expert_id;
	}

	public void setExpert_id(String expert_id) {
		this.expert_id = expert_id;
	}

	public String getActive_area() {
		return active_area;
	}

	public void setActive_area(String active_area) {
		this.active_area = active_area;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "ExpertDTO [expert_id=" + expert_id + ", active_area=" + active_area + ", introduction=" + introduction
				+ ", point=" + point + "]";
	}
	
	

}
