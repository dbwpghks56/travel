package travel.DTO;

public class SightDTO {
	 private int sights_id;
	private String address;
	private String sight_type;
	private String s_image_path;
	private String address_detail;
	private String phone;
	public int getSights_id() {
		return sights_id;
	}
	public void setSights_id(int sights_id) {
		this.sights_id = sights_id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSight_type() {
		return sight_type;
	}
	public void setSight_type(String sight_type) {
		this.sight_type = sight_type;
	}
	public String getS_image_path() {
		return s_image_path;
	}
	public void setS_image_path(String s_image_path) {
		this.s_image_path = s_image_path;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "SightDTO [sights_id=" + sights_id + ", address=" + address + ", sight_type=" + sight_type
				+ ", s_image_path=" + s_image_path + ", address_detail=" + address_detail + ", phone=" + phone + "]";
	}
	public SightDTO(int sights_id, String address, String sight_type, String s_image_path, String address_detail) {
		super();
		this.sights_id = sights_id;
		this.address = address;
		this.sight_type = sight_type;
		this.s_image_path = s_image_path;
		this.address_detail = address_detail;
	}
	public SightDTO() {
		super();
	}
	
}
