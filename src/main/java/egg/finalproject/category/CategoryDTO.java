package egg.finalproject.category;

public class CategoryDTO {

	private int category_no;
	private String parent_group;
	private String child_group;
	
	public CategoryDTO() {}

	public CategoryDTO(int category_no, String parent_group, String child_group) {
		super();
		this.category_no = category_no;
		this.parent_group = parent_group;
		this.child_group = child_group;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}

	public String getParent_group() {
		return parent_group;
	}

	public void setParent_group(String parent_group) {
		this.parent_group = parent_group;
	}

	public String getChild_group() {
		return child_group;
	}

	public void setChild_group(String child_group) {
		this.child_group = child_group;
	}
	
	
}
