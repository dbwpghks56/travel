package travel.model;

import java.sql.Connection;
<<<<<<< HEAD

=======
>>>>>>> refs/remotes/origin/Min
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

	

	public List<InteAccoDTO> selectByName(int accoId, int person) {
		List<InteAccoDTO> accoList = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_SELECT_BY_NAME);
			pst.setInt(1, accoId);
			pst.setInt(2, person);
			pst.setInt(3, person);
			rs = pst.executeQuery();
			while(rs.next()) {
				InteAccoDTO room = makeRoom(rs);
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
	public List<InteAccoDTO> selectByDate(int accoId, Date check_in, Date check_out){
		List<InteAccoDTO> accoList = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_SELECT_BY_DATE);
			pst.setInt(1, accoId);
			pst.setDate(2, check_in);
			pst.setDate(3, check_in);
			pst.setDate(4, check_out);
			pst.setDate(5, check_out);
			rs = pst.executeQuery();
			while(rs.next()) {
				InteAccoDTO room = makeRoom(rs);
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
	
	private InteAccoDTO makeRoom(ResultSet rs2) {
		InteAccoDTO room = new InteAccoDTO();
		try {
			room.setRoom_id(rs2.getInt("room_id"));
			room.setPrice_by_day(rs2.getInt("price_by_day"));
			room.setAccommodation_name(rs2.getString("accommodation_name"));
			room.setAddress(rs2.getString("address"));
			room.setCleaning_star(rs2.getInt("cleaning_stars"));
			room.setLocation_star(rs2.getInt("location_stars"));
			room.setMax_day(rs2.getInt("max_day"));
			room.setMax_personnel(rs2.getInt("max_personnel"));
			String[] images = rs2.getString("image_path").split(",");
			room.setR_image_path(images);
			String[] options = rs2.getString("r_option").split(",");
			room.setR_option(options);
			room.setRoom_name(rs2.getString("room_name"));
			room.setSatisfied_star(rs2.getInt("satisfied_stars"));
			room.setUser_id(rs2.getString("user_id"));
			room.setX(rs2.getFloat("x"));
			room.setY(rs2.getFloat("y"));
			String[] aImges= rs2.getString("a_image_path").split(",");
			room.setA_image_path(aImges);
			room.setAccommodation_type(rs2.getString("accommodation_type"));
			room.setPhone(rs2.getString("phone"));
			String[] aOptions = rs2.getString("a_option").split(",");
			room.setA_option(aOptions);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return room;
	}
//諛� �벑濡�

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


