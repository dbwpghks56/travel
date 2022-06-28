package travel.model;

import java.sql.SQLException;
import java.util.List;

import travel.DTO.ReservationDTO;
import travel.util.DBUtil;

public class ReservationService {

	ReservationDAO rDAO = new ReservationDAO();
	
	//�����ϱ�
	public int resevation(ReservationDTO rsv) {
		return rDAO.resevation(rsv);
	}
	
	
	//���� �����ϱ�
	public int rsvUpdate(ReservationDTO rsv) {
		return rDAO.rsvUpdate(rsv);
	}
	
	
	//��������ϱ�
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
	
	//���� ���
	public List<ReservationDTO> rsvAll(String user_id){
		return rDAO.rsvAll(user_id);
	}
	
	//���� ��
	public ReservationDTO selectByRsvNo(int rsv_no) {
		return rDAO.selectByRsvNo(rsv_no);
	}
	
	//���� �� �ٷ� �󼼺���
	public int insertAfterRsv(String user_id) {
		return rDAO.insertAfterRsv(user_id);
	}
	
	//host�� ����� ���ҿ� ����� list
	public List<ReservationDTO> hostRsvAll(String user_id) {
		return rDAO.hostRsvAll(user_id);
	}
	
	//host�� ����� ���ҿ� ����� detail
	public ReservationDTO selectByHostRsvNo(int rsv_no) {
		return rDAO.selectByHostRsvNo(rsv_no);
	}
	
	//������ �� ������ �ش� ���� ����
	public ReservationDTO selectByRoomId(int room_id) {
		return rDAO.selectByRoomId(room_id);
	}
	
	public List<ReservationDTO> selectByCheckInOut(int room_id) {
		return rDAO.selectByCheckInOut(room_id);
	}
	public int deleteAll(String userid) {
		return rDAO.deleteAll(userid);
	}
	public int ddAll(String userid) {
		
		return rDAO.ddAll(userid);
	}
}
