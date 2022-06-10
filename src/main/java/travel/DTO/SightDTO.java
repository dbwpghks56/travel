package travel.DTO;

public class SightDTO {
	private int sights_id;
	private String sights_name;
	private float x ;
	private float y;
	private String sights_type;
	private String address;
	private String phone;
	public int getSights_id() {
		return sights_id;
	}
	public void setSights_id(int sights_id) {
		this.sights_id = sights_id;
	}
	public String getSights_name() {
		return sights_name;
	}
	public void setSights_name(String sights_name) {
		this.sights_name = sights_name;
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
	public String getSights_type() {
		return sights_type;
	}
	public void setSights_type(String sights_type) {
		this.sights_type = sights_type;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "SightDTO [sights_id=" + sights_id + ", sights_name=" + sights_name + ", x=" + x + ", y=" + y
				+ ", sights_type=" + sights_type + ", address=" + address + ", phone=" + phone + "]";
	}
	
	
}
