package travel.DTO;

public class ReviewDto {
	private int review_id;
	private int accommodation_id;
	private String user_id;
	private String host_id;
	private String content;
	private int cleaning_stars;
	private int location_stars;
	private int satisfied_stars;
	private int report_number;
	
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public int getAccommodation_id() {
		return accommodation_id;
	}
	public void setAccommodation_id(int accommodation_id) {
		this.accommodation_id = accommodation_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getHost_id() {
		return host_id;
	}
	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCleaning_stars() {
		return cleaning_stars;
	}
	public void setCleaning_stars(int cleaning_stars) {
		this.cleaning_stars = cleaning_stars;
	}
	public int getLocation_stars() {
		return location_stars;
	}
	public void setLocation_stars(int location_stars) {
		this.location_stars = location_stars;
	}
	public int getSatisfied_stars() {
		return satisfied_stars;
	}
	public void setSatisfied_stars(int satisfied_stars) {
		this.satisfied_stars = satisfied_stars;
	}
	public int getReport_number() {
		return report_number;
	}
	public void setReport_number(int report_number) {
		this.report_number = report_number;
	}
	
	
}
