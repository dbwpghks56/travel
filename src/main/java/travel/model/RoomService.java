package travel.model;


import java.sql.Date;
import java.util.List;

import travel.DTO.AccommodationDto;
import travel.DTO.InteAccoDTO;
import travel.DTO.RoomDto;

public class RoomService {
	RoomDAO roomdao = new RoomDAO();
	
	public int InsertRoom(RoomDto room) {
		
		return roomdao.InsertRoom(room);
	}
	
	public List<InteAccoDTO> selectByName(int accoId, int person) {
		return roomdao.selectByName(accoId, person);
	}
	public List<InteAccoDTO> selectByDate(int accoId, Date check_in, Date check_out){
		return roomdao.selectByDate(accoId, check_in, check_out);
	}
}


