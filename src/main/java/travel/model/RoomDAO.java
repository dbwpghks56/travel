package travel.model;

import java.sql.Connection;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import travel.DTO.InteAccoDTO;
import travel.DTO.RoomDto;
import travel.util.DBUtil;

public class RoomDAO {

	Connection conn;
	PreparedStatement pst;
	Statement st;
	ResultSet rs;
	private static final String SQL_INSERT_ROOM = "INSERT INTO Room VALUES (seq_room.nextval,? , ? , ? , ? , ? , ? , ? , ? , ?)";
	private static final String SQL_SELECT_BY_NAME = "select * from room\r\n"
			+ "join accommodation using(accommodation_id)\r\n" + "where accommodation_id = ?\r\n"
			+ "and (min_personnel<=? and max_personnel>= ?)\r\n";
	private static final String SQL_SELECT_BY_DATE = "select * from room\r\n"
			+ "join accommodation using(accommodation_id)\r\n" + "join reservation using(room_id)\r\n"
			+ "where (accommodation_id = ?)\r\n" + "and((check_in<= ? and check_out>= ?)\r\n"
			+ "or (check_in<= ? and check_out>= ?))\r\n";


	

	public List<RoomDto> selectByName(int accoId, int person) {
		List<RoomDto> accoList = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_SELECT_BY_NAME);
			pst.setInt(1, accoId);
			pst.setInt(2, person);
			pst.setInt(3, person);
			rs = pst.executeQuery();
			while(rs.next()) {
				RoomDto room = makeRoom(rs);
				accoList.add(room);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return accoList;
	}

	public List<String[]> selectImg(int accoId){
		List<String[]> imgList = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_SELECT_IMG);
			pst.setInt(1, accoId);
			rs = pst.executeQuery();
			while(rs.next()) {
				String[] arr = rs.getString("image_path").split(",");
				imgList.add(arr);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return imgList;
	}
	public List<RoomDto> selectByAcco(int accoId){
		List<RoomDto> rList = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_SELECT_BY_ACCO);
			pst.setInt(1, accoId);
			rs = pst.executeQuery();
			while(rs.next()) {
				RoomDto room = makeRoom(rs);
				rList.add(room);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return rList;
	}
	private RoomDto makeRoom(ResultSet rs2) {
		RoomDto room = new RoomDto();
		try {
			room.setRoom_id(rs2.getInt("room_id"));
			room.setPrice_by_day(rs2.getInt("price_by_day"));
			room.setMax_day(rs2.getInt("max_day"));
			room.setMax_personnel(rs2.getInt("max_personnel"));
			String[] images = rs2.getString("image_path").split(",");
			String[] options = rs2.getString("r_option").split(",");
			room.setRoom_name(rs2.getString("room_name"));
			String[] aImges= rs2.getString("a_image_path").split(",");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return room;
	}
	
	public int InsertRoom(RoomDto room) {
		int result = 0;
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_INSERT_ROOM);
			pst.setInt(1, room.getAccommodation_id());
			pst.setInt(2, room.getMin_personnel());
			pst.setInt(3, room.getMax_personnel());
			pst.setInt(4, room.getMin_day());
			pst.setInt(5, room.getMax_day());
			pst.setInt(6, room.getPrice_by_day());
			pst.setString(7, room.getRoom_name());
			pst.setString(8, room.getR_image_path());
			pst.setString(9, room.getR_option());

			result = pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}

		return result;
	}
}


