package travel.DTO;

public class ManagerDTO {
	
	private String user_id;
	private String rank;
	
	public ManagerDTO() {}
	public ManagerDTO(String user_id, String rank) {
		super();
		this.user_id = user_id;
		this.rank = rank;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}

	
	
}
