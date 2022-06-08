package travel.DTO;

public class RoomDto {
	private int room_id;
	private int Accommodation_id;
	private int min_personnel;
	private int max_personnel;
	private int min_day;
	private int max_day;
	private int price_by_day;
	private String room_name;
	@Override
	public String toString() {
		return "RoomDto [room_id=" + room_id + ", Accommodation_id=" + Accommodation_id + ", min_personnel="
				+ min_personnel + ", max_personnel=" + max_personnel + ", min_day=" + min_day + ", max_day=" + max_day
				+ ", price_by_day=" + price_by_day + ", romm_name=" + room_name + ", r_image_path=" + r_image_path
				+ ", r_option=" + r_option + "]";
	}
	private String r_image_path;
	private String r_option;
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public int getAccommodation_id() {
		return Accommodation_id;
	}
	public void setAccommodation_id(int accommodation_id) {
		Accommodation_id = accommodation_id;
	}
	public int getMin_personnel() {
		return min_personnel;
	}
	public void setMin_personnel(int min_personnel) {
		this.min_personnel = min_personnel;
	}
	public int getMax_personnel() {
		return max_personnel;
	}
	public void setMax_personnel(int max_personnel) {
		this.max_personnel = max_personnel;
	}
	public int getMin_day() {
		return min_day;
	}
	public void setMin_day(int min_day) {
		this.min_day = min_day;
	}
	public int getMax_day() {
		return max_day;
	}
	public void setMax_day(int max_day) {
		this.max_day = max_day;
	}
	public int getPrice_by_day() {
		return price_by_day;
	}
	public void setPrice_by_day(int price_by_day) {
		this.price_by_day = price_by_day;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getR_image_path() {
		return r_image_path;
	}
	public void setR_image_path(String r_image_path) {
		this.r_image_path = r_image_path;
	}
	public String getR_option() {
		return r_option;
	}
	public void setR_option(String r_option) {
		this.r_option = r_option;
	}
	
	
}
