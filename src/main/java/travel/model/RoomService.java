package travel.model;

import java.sql.Date;
import java.util.List;

import travel.DTO.InteAccoDTO;
import travel.DTO.RoomDto;

public class RoomService {
	
	RoomDAO roomDAO = new RoomDAO();
	public List<InteAccoDTO> selectByName(int accoId, int person) {
		return roomDAO.selectByName(accoId, person);
	}
	public List<InteAccoDTO> selectByDate(int accoId, Date check_in, Date check_out){
		return roomDAO.selectByDate(accoId, check_in, check_out);
	}
	
	public int InsertRoom(RoomDto room) {
		
		return roomDAO.InsertRoom(room);
	}
}

