package travel.model;

import java.util.List;

import travel.DTO.ReservationDTO;

public class ReservationService {

	ReservationDAO rDAO = new ReservationDAO();
	
	//예약하기
	public int resevation(ReservationDTO rsv) {
		return rDAO.resevation(rsv);
	}
	
	//
	public int rsvUpdate(ReservationDTO rsv) {
		return rDAO.rsvUpdate(rsv);
	}
	
	
	//예약취소하기
	public int rsvDelete(int rsv_no) {
		return rDAO.rsvDelete(rsv_no);
	}
	
	//예약 전체 조회하기(최근 예약순으로)
	public List<ReservationDTO> rsvAll(){
		return rDAO.rsvAll();
	}
}
