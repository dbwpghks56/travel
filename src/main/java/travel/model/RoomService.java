package travel.model;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import travel.DTO.InteAccoDTO;
import travel.DTO.RoomDto;

import travel.util.DBUtil;

public class RoomService {
	RoomDAO roomdao = new RoomDAO();


	public List<RoomDto> selectByName(int accoId, int person) {
		return roomdao.selectByName(accoId, person);
	}

	public List<RoomDto> selectByDate(int accoId, Date check_in, Date check_out) {
		return roomdao.selectByDate(accoId, check_in, check_out);
	}

	public int InsertRoom(RoomDto room) {

		return roomdao.InsertRoom(room);
	}

	public List<String[]> selectImg(int accoId) {
		return roomdao.selectImg(accoId);
	}

	public List<RoomDto> selectByAcco(int accoId) {
		return roomdao.selectByAcco(accoId);
	}

}
