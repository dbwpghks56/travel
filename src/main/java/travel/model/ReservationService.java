package travel.model;

import java.util.List;

import travel.DTO.ReservationDTO;

public class ReservationService {

	ReservationDAO rDAO = new ReservationDAO();
	
	//�����ϱ�
	public int resevation(ReservationDTO rsv) {
		return rDAO.resevation(rsv);
	}
	
	//
	public int rsvUpdate(ReservationDTO rsv) {
		return rDAO.rsvUpdate(rsv);
	}
	
	
	//��������ϱ�
	public int rsvDelete(int rsv_no) {
		return rDAO.rsvDelete(rsv_no);
	}
	
	//���� ��ü ��ȸ�ϱ�(�ֱ� ���������)
	public List<ReservationDTO> rsvAll(){
		return rDAO.rsvAll();
	}
}
