package travel.DTO;

import java.sql.Date;

public class InteAccoDTO {
	@Override
	public String toString() {
		return "AccommodationDto [Accommodation_id=" + Accommodation_id + ", user_id=" + user_id
				+ ", Accommodation_name=" + Accommodation_name + ", address=" + address + ", location_detail="
				+ location_detail + ", cleaning_star=" + cleaning_star + ", location_star=" + location_star
				+ ", satisfied_star=" + satisfied_star + ", a_image_path=" + a_image_path + ", a_option=" + a_option
				+ ", mail_num=" + mail_num + ", new_mail_num=" + new_mail_num + ", x=" + x + ", y=" + y
				+ ", new_address=" + new_address + "]";
	}
	
	public String toStringRSV() {
		return "ReservationDTO [rsv_no=" + rsv_no + ", usre_id=" + usre_id + ", room_id=" + room_id + ", check_in="
				+ check_in + ", check_out=" + check_out + ", rsv_date=" + rsv_date + ", personnel=" + personnel
				+ ", request=" + request + ", rsv_status=" + rsv_status + "]";
	}
	public String toStringRoom() {
		return "RoomDto [room_id=" + room_id + ", Accommodation_id=" + Accommodation_id + ", min_personnel="
				+ min_personnel + ", max_personnel=" + max_personnel + ", min_day=" + min_day + ", max_day=" + max_day
				+ ", price_by_day=" + price_by_day + ", romm_name=" + room_name + ", r_image_path=" + r_image_path
				+ ", r_option=" + r_option + "]";
	}
	private int Accommodation_id;
	private String user_id;
	private String Accommodation_name;
	private String address;
	private String location_detail;
	private int cleaning_star;
	private int location_star;
	private int satisfied_star;
	private String[] a_image_path;
	private String[] a_option;
	private int mail_num;
	private int new_mail_num;
	private float x;
	private float y;
	private String new_address;
	private int room_id;
	private int min_personnel;
	private int max_personnel;
	private int min_day;
	private int max_day;
	private int price_by_day;
	private String room_name;
	private String[] r_image_path;
	private String[] r_option;
	private int rsv_no;
	private String usre_id;
	private Date check_in;
	private Date check_out;
	private Date rsv_date;
	private int personnel;
	private String request;
	private String rsv_status;
		
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
	public String[] getA_image_path() {
		return a_image_path;
	}
	public void setA_image_path(String[] a_image_path) {
		this.a_image_path = a_image_path;
	}
	public String[] getA_option() {
		return a_option;
	}
	public void setA_option(String[] a_option) {
		this.a_option = a_option;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
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
	public String[] getR_image_path() {
		return r_image_path;
	}
	public void setR_image_path(String[] r_image_path) {
		this.r_image_path = r_image_path;
	}
	public String[] getR_option() {
		return r_option;
	}
	public void setR_option(String[] r_option) {
		this.r_option = r_option;
	}
	public int getRsv_no() {
		return rsv_no;
	}
	public void setRsv_no(int rsv_no) {
		this.rsv_no = rsv_no;
	}
	public String getUsre_id() {
		return usre_id;
	}
	public void setUsre_id(String usre_id) {
		this.usre_id = usre_id;
	}
	public Date getCheck_in() {
		return check_in;
	}
	public void setCheck_in(Date check_in) {
		this.check_in = check_in;
	}
	public Date getCheck_out() {
		return check_out;
	}
	public void setCheck_out(Date check_out) {
		this.check_out = check_out;
	}
	public Date getRsv_date() {
		return rsv_date;
	}
	public void setRsv_date(Date rsv_date) {
		this.rsv_date = rsv_date;
	}
	public int getPersonnel() {
		return personnel;
	}
	public void setPersonnel(int personnel) {
		this.personnel = personnel;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public String getRsv_status() {
		return rsv_status;
	}
	public void setRsv_status(String rsv_status) {
		this.rsv_status = rsv_status;
	}
	
}
