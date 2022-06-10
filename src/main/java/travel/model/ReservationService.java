package travel.model;

import java.util.List;

import travel.DTO.ReservationDTO;

public class ReservationService {

	ReservationDAO rDAO = new ReservationDAO();
	
	//�����ϱ�
	public int resevation(ReservationDTO rsv) {
		return rDAO.resevation(rsv);
	}
	
	
	public int rsvUpdate(ReservationDTO rsv) {
		return rDAO.rsvUpdate(rsv);
	}
	
	
	//��������ϱ�
	public int rsvDelete(int rsv_no) {
		return rDAO.rsvDelete(rsv_no);
	}
	
	//���� ��ü ��ȸ�ϱ�(�ֱ� ���������)
	public List<ReservationDTO> rsvAll(String user_id){
		return rDAO.rsvAll(user_id);
	}
	

	public ReservationDTO selectByRsvNo(int rsv_no) {
		return rDAO.selectByRsvNo(rsv_no);
	}
	
	public int insertAfterRsv() {
		return rDAO.insertAfterRsv();
	}
	
	public List<ReservationDTO> hostRsvAll(String user_id) {
		return rDAO.hostRsvAll(user_id);
	}
	
	public ReservationDTO selectByHostRsvNo(int rsv_no) {
		return rDAO.selectByHostRsvNo(rsv_no);
	}
	
	public ReservationDTO selectByRoomId(int room_id) {
		return rDAO.selectByRoomId(room_id);
	}
}
