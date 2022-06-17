package travel.model;

import java.util.List;

import travel.DTO.ReservationDTO;

public class ReservationService {

	ReservationDAO rDAO = new ReservationDAO();
	
	//예약하기
	public int resevation(ReservationDTO rsv) {
		return rDAO.resevation(rsv);
	}
	
	
	//예약 수정하기
	public int rsvUpdate(ReservationDTO rsv) {
		return rDAO.rsvUpdate(rsv);
	}
	
	
	//예약취소하기
	public int rsvDelete(int rsv_no) {
		return rDAO.rsvDelete(rsv_no);
	}
	
	public List<ReservationDTO> rsvDeleteAll(String user_id){
		return rDAO.rsvDeleteAll(user_id);
	}
	
	public ReservationDTO rsvDeleteAllDetail(int d_rsv_no) {
		return rDAO.rsvDeleteAllDetail(d_rsv_no);
	}
	
	public int dRsvNoDelete(int d_rsv_no) {
		return rDAO.dRsvNoDelete(d_rsv_no);
	}
	
	public List<ReservationDTO> rsvDeleteAllhost(String user_id){
		return rDAO.rsvDeleteAllhost(user_id);
	}
	
	public ReservationDTO rsvDeleteDetailHost(int d_rsv_no) {
		return rDAO.rsvDeleteDetailHost(d_rsv_no);
	}
	
	//예약 목록
	public List<ReservationDTO> rsvAll(String user_id){
		return rDAO.rsvAll(user_id);
	}
	
	//예약 상세
	public ReservationDTO selectByRsvNo(int rsv_no) {
		return rDAO.selectByRsvNo(rsv_no);
	}
	
	//예약 후 바로 상세보기
	public int insertAfterRsv(String user_id) {
		return rDAO.insertAfterRsv(user_id);
	}
	
	//host가 등록한 숙소에 예약된 list
	public List<ReservationDTO> hostRsvAll(String user_id) {
		return rDAO.hostRsvAll(user_id);
	}
	
	//host가 등록한 숙소에 예약된 detail
	public ReservationDTO selectByHostRsvNo(int rsv_no) {
		return rDAO.selectByHostRsvNo(rsv_no);
	}
	
	//예약할 때 나오는 해당 숙소 정보
	public ReservationDTO selectByRoomId(int room_id) {
		return rDAO.selectByRoomId(room_id);
	}
	
	public List<ReservationDTO> selectByCheckInOut(int room_id) {
		return rDAO.selectByCheckInOut(room_id);
	}
}
