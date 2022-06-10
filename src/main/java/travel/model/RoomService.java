package travel.model;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import travel.DTO.InteAccoDTO;
<<<<<<< HEAD
import travel.DTO.RoomDto;
import travel.util.DBUtil;


=======
>>>>>>> refs/remotes/origin/hyun

public class RoomService {
	
<<<<<<< HEAD

	public List<RoomDto> selectByName(int accoId, int person) {
		return roomdao.selectByName(accoId, person);
=======
	RoomDAO roomDAO = new RoomDAO();
	public List<InteAccoDTO> selectByName(int accoId, int person) {
		return roomDAO.selectByName(accoId, person);
>>>>>>> refs/remotes/origin/hyun
	}
<<<<<<< HEAD
	public List<RoomDto> selectByDate(int accoId, Date check_in, Date check_out){
		return roomdao.selectByDate(accoId, check_in, check_out);
	}
	
	public int InsertRoom(RoomDto room) {
		
		return roomdao.InsertRoom(room);
=======
	public List<InteAccoDTO> selectByDate(int accoId, Date check_in, Date check_out){
		return roomDAO.selectByDate(accoId, check_in, check_out);
>>>>>>> refs/remotes/origin/hyun
	}
	public List<String[]> selectImg(int accoId){
		return roomdao.selectImg(accoId);
	}
	public List<RoomDto> selectByAcco(int accoId){
		return roomdao.selectByAcco(accoId);
	}
}
