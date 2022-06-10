package travel.DTO;

import java.sql.Date;

public class ReservationDTO {
	



	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ReservationDTO [rsv_no=").append(rsv_no).append(", user_id=").append(user_id)
				.append(", room_id=").append(room_id).append(", check_in=").append(check_in).append(", check_out=")
				.append(check_out).append(", rsv_date=").append(rsv_date).append(", personnel=").append(personnel)
				.append(", request=").append(request).append(", rsv_status=").append(rsv_status)
				.append(", accommodation_name=").append(accommodation_name)
				.append(", room_name=").append(room_name).append("]");
		return builder.toString();
	}
	
	private int rsv_no;
	private String user_id;
	private int room_id;
	private Date check_in;
	private Date check_out;
	private Date rsv_date;
	private int personnel;
	private String request;
	private String rsv_status;
	
	private String accommodation_name;
	private String phone; 
	
	private int price_by_day;
	private String room_name;
	
	private String user_name;
	private String user_phone;

	public ReservationDTO() {}
	public ReservationDTO(int rsv_no, String user_id, int room_id, Date check_in, Date check_out, Date rsv_date,
			int personnel, String request, String rsv_status) {
		super();
		this.rsv_no = rsv_no;
		this.user_id = user_id;
		this.room_id = room_id;
		this.check_in = check_in;
		this.check_out = check_out;
		this.rsv_date = rsv_date;
		this.personnel = personnel;
		this.request = request;
		this.rsv_status = rsv_status;
	}	

	
	public int getRsv_no() {
		return rsv_no;
	}
	public void setRsv_no(int rsv_no) {
		this.rsv_no = rsv_no;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
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
	
	public String getAccommodation_name() {
		return accommodation_name;
	}
	public void setAccommodation_name(String accommodation_name) {
		this.accommodation_name = accommodation_name;
	}	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	
	
	
	
	
}