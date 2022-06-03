package travel.DTO;

public class AccommodationDto {
	@Override
	public String toString() {
		return "AccommodationDto [Accommodation_id=" + Accommodation_id + ", user_id=" + user_id
				+ ", Accommodation_name=" + Accommodation_name + ", address=" + address + ", location_detail="
				+ location_detail + ", cleaning_star=" + cleaning_star + ", location_star=" + location_star
				+ ", satisfied_star=" + satisfied_star + ", a_image_path=" + a_image_path + ", a_option=" + a_option
				+ ", mail_num=" + mail_num + ", new_mail_num=" + new_mail_num + ", x=" + x + ", y=" + y
				+ ", new_address=" + new_address + "]";
	}
	private int Accommodation_id;
	private String user_id;
	private String Accommodation_name;
	private String address;
	private String location_detail;
	private int cleaning_star;
	private int location_star;
	private int satisfied_star;
	private String a_image_path;
	private String a_option;
	private int mail_num;
	private int new_mail_num;
	private float x;
	private float y;
	private String new_address;
		
	public int getMail_num() {
		return mail_num;
	}
	public void setMail_num(int mail_num) {
		this.mail_num = mail_num;
	}
	public int getNew_mail_num() {
		return new_mail_num;
	}
	public void setNew_mail_num(int new_mail_num) {
		this.new_mail_num = new_mail_num;
	}
	public float getX() {
		return x;
	}
	public void setX(float x) {
		this.x = x;
	}
	public float getY() {
		return y;
	}
	public void setY(float y) {
		this.y = y;
	}
	public String getNew_address() {
		return new_address;
	}
	public void setNew_address(String new_address) {
		this.new_address = new_address;
	}
	public int getAccommodation_id() {
		return Accommodation_id;
	}
	public void setAccommodation_id(int accommodation_id) {
		Accommodation_id = accommodation_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getAccommodation_name() {
		return Accommodation_name;
	}
	public void setAccommodation_name(String accommodation_name) {
		Accommodation_name = accommodation_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLocation_detail() {
		return location_detail;
	}
	public void setLocation_detail(String location_detail) {
		this.location_detail = location_detail;
	}
	public int getCleaning_star() {
		return cleaning_star;
	}
	public void setCleaning_star(int cleaning_star) {
		this.cleaning_star = cleaning_star;
	}
	public int getLocation_star() {
		return location_star;
	}
	public void setLocation_star(int location_star) {
		this.location_star = location_star;
	}
	public int getSatisfied_star() {
		return satisfied_star;
	}
	public void setSatisfied_star(int satisfied_star) {
		this.satisfied_star = satisfied_star;
	}
	public String getA_image_path() {
		return a_image_path;
	}
	public void setA_image_path(String a_image_path) {
		this.a_image_path = a_image_path;
	}
	public String getA_option() {
		return a_option;
	}
	public void setA_option(String a_option) {
		this.a_option = a_option;
	}
	
	
}
