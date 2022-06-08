package travel.model;

import java.util.List;

import travel.DTO.Room_InquiryDto;

public class Room_InquiryService {
	Room_InquiryDAO rinquirydao = new Room_InquiryDAO();
	
	public int insertRinquiry(Room_InquiryDto rinquiry) {
		return rinquirydao.insertRinquiry(rinquiry);
	}
	
	public List<Room_InquiryDto> selectAllRinquiry() {
		return rinquirydao.selectAllRinquiry();
	}
	
	public List<Room_InquiryDto> selectAccoRinquiry(String acco_id) {
		return rinquirydao.selectAccoRinquiry(acco_id);
	}
	
	public List<Room_InquiryDto> selectUserRinquiry(String user_id) {
		return rinquirydao.selectUserRinquiry(user_id);
	}
	
	public List<Room_InquiryDto> selectHostRinquiry(String host_id) {
		return rinquirydao.selectHostRinquiry(host_id);
	}
}
