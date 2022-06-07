package travel.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import travel.DTO.AccommodationDto;
import travel.DTO.RoomDto;
import travel.util.DBUtil;

public class RoomDAO {

	private static final String SQL_INSERT_ROOM = "INSERT INTO Room VALUES (seq_room.nextval,? , ? , ? , ? , ? , ? , ? , ? , ?)";
			

	Connection conn;
	PreparedStatement pst;
	Statement st;
	ResultSet rs;

//방 등록

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