package travel.model;

import java.util.List;

import travel.DTO.AccommodationDto;
import travel.DTO.RoomDto;

public class RoomService {
	RoomDAO roomdao = new RoomDAO();
	
	public int InsertRoom(RoomDto room) {
		
		return roomdao.InsertRoom(room);
}
}