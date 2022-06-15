package travel.DTO;

import java.sql.Date;

public class ReviewDto {
	private int review_id;
	private int accommodation_id;
	private String user_id;
	private String host_id;
	private String content;
	private float cleaning_stars;
	private float location_stars;
	private float satisfied_stars;
	private int report_number;
	private String r_image_path;
	private Date r_regdate;
	private String report_user;
	private int rsv_no;
	
	public int getRsv_no() {
		return rsv_no;
	}
	public void setRsv_no(int rsv_no) {
		this.rsv_no = rsv_no;
	}
	public String getReport_user() {
		return report_user;
	}
	public void setReport_user(String report_user) {
		this.report_user = report_user;
	}
	public String getR_image_path() {
		return r_image_path;
	}
	public void setR_image_path(String r_image_path) {
		this.r_image_path = r_image_path;
	}
	public Date getR_regdate() {
		return r_regdate;
	}
	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
	}
	public void setCleaning_stars(float cleaning_stars) {
		this.cleaning_stars = cleaning_stars;
	}
	public void setLocation_stars(float location_stars) {
		this.location_stars = location_stars;
	}
	public void setSatisfied_stars(float satisfied_stars) {
		this.satisfied_stars = satisfied_stars;
	}
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
	public float getCleaning_stars() {
		return cleaning_stars;
	}
	public float getLocation_stars() {
		return location_stars;
	}
	public float getSatisfied_stars() {
		return satisfied_stars;
	}
	public int getReport_number() {
		return report_number;
	}
	public void setReport_number(int report_number) {
		this.report_number = report_number;
	}
	
	
}
