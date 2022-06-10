package travel.DTO;

import java.sql.Date;

public class UserDTO {
	
	private String user_id;
	private String user_pass;
	private String user_name;
	private String u_image_path;
	private String user_email;
	private String nickname;
	private String user_phone;
	private int host;
	private int manager;
	private Date birth;
	private String favorite;
	private int confirm;

	
	public UserDTO() {
		super();
	}


	public UserDTO(String user_id, String user_pass, String user_name, String u_image_path, String user_email,
			String nickname, String user_phone, int host, int manager, Date birth, String favorite, int confirm) {
		super();
		this.user_id = user_id;
		this.user_pass = user_pass;
		this.user_name = user_name;
		this.u_image_path = u_image_path;
		this.user_email = user_email;
		this.nickname = nickname;
		this.user_phone = user_phone;
		this.host = host;
		this.manager = manager;
		this.birth = birth;
		this.favorite = favorite;
		this.confirm = confirm;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getUser_pass() {
		return user_pass;
	}


	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public String getU_image_path() {
		return u_image_path;
	}


	public void setU_image_path(String u_image_path) {
		this.u_image_path = u_image_path;
	}


	public String getUser_email() {
		return user_email;
	}


	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getUser_phone() {
		return user_phone;
	}


	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}


	public int getHost() {
		return host;
	}


	public void setHost(int host) {
		this.host = host;
	}


	public int getManager() {
		return manager;
	}


	public void setManager(int manager) {
		this.manager = manager;
	}


	public Date getBirth() {
		return birth;
	}


	public void setBirth(Date birth) {
		this.birth = birth;
	}


	public String getFavorite() {
		return favorite;
	}


	public void setFavorite(String favorite) {
		this.favorite = favorite;
	}


	public int getConfirm() {
		return confirm;
	}


	public void setConfirm(int confirm) {
		this.confirm = confirm;
	}


	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_pass=" + user_pass + ", user_name=" + user_name + ", u_image_path="
				+ u_image_path + ", user_email=" + user_email + ", nickname=" + nickname + ", user_phone=" + user_phone
				+ ", host=" + host + ", manager=" + manager + ", birth=" + birth + ", favorite=" + favorite
				+ ", confirm=" + confirm + "]";
	}
	
	
}
