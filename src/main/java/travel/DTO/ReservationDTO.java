package travel.DTO;

import java.sql.Date;

public class ReservationDTO {
	
	private int rsv_no;
	private String usre_id;
	private int room_id;
	private Date check_in;
	private Date check_out;
	private Date rsv_date;
	private int personnel;
	private String request;
	private String rsv_status;
	
	public ReservationDTO() {}
	public ReservationDTO(int rsv_no, String usre_id, int room_id, Date check_in, Date check_out, Date rsv_date,
			int personnel, String request, String rsv_status) {
		super();
		this.rsv_no = rsv_no;
		this.usre_id = usre_id;
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
	public String getUsre_id() {
		return usre_id;
	}
	public void setUsre_id(String usre_id) {
		this.usre_id = usre_id;
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
	
	
	
	
	
}