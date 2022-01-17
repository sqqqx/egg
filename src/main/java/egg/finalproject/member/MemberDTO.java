package egg.finalproject.member;

import java.sql.Date;

public class MemberDTO {

	private String user_id;
	private String password;
	private String nickname;
	private String phone;
	private String email;
	private String address;
	private Date signup_date;
	private String profile_path;
	private int type;
	private int blacklist;
	
	public MemberDTO() {}

	public MemberDTO(String user_id, String password, String nickname, String phone, String email, String address,
			Date signup_date, String profile_path, int type, int blacklist) {
		super();
		this.user_id = user_id;
		this.password = password;
		this.nickname = nickname;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.signup_date = signup_date;
		this.profile_path = profile_path;
		this.type = type;
		this.blacklist = blacklist;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getSignup_date() {
		return signup_date;
	}

	public void setSignup_date(Date signup_date) {
		this.signup_date = signup_date;
	}

	public String getProfile_path() {
		return profile_path;
	}

	public void setProfile_path(String profile_path) {
		this.profile_path = profile_path;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getBlacklist() {
		return blacklist;
	}

	public void setBlacklist(int blacklist) {
		this.blacklist = blacklist;
	}

	@Override
	public String toString() {
		return "MemberDTO [user_id=" + user_id + ", password=" + password + ", nickname=" + nickname + ", phone="
				+ phone + ", email=" + email + ", address=" + address + ", signup_date=" + signup_date
				+ ", profile_path=" + profile_path + ", type=" + type + ", blacklist=" + blacklist + "]";
	}

	
	
}
