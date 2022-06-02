package travle.DTO;

public class ManagerDTO {

	private String rank;

  
	public ManagerDTO() {
		super();  
	} 

	public ManagerDTO(String rank) {
		super();
		this.rank = rank;
	}

	public String getRank() {
		return rank; 
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	@Override 
	public String toString() {
		return "Manager [rank=" + rank + "]"; 
	}
	
	
}
