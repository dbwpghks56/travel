package travel.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.security.crypto.core.PrivateKeyPKCS8;
import travel.DTO.UserDTO;
import travel.util.DBUtil;

public class UserDAO {
	private static final String SQL_SELECT_IMAGE = "select u_image_path from users where user_id = ?";
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	int result = 0;
	
	public int insertUser(UserDTO user) {
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement("INSERT INTO users values(?, ?, ?, ?, ?, ?, ?, ?, 0, ?, ?, 0)");
			pst.setString(1, user.getUser_id());
			pst.setString(2, user.getUser_pass());
			pst.setString(3, user.getUser_name());
			pst.setString(4, user.getU_image_path());
			pst.setString(5, user.getUser_email());
			pst.setString(6, user.getNickname());
			pst.setString(7, user.getUser_phone());
			pst.setInt(8, user.getHost());
			pst.setDate(9, user.getBirth());
			pst.setString(10, user.getFavorite());
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		
		
		return result;
	}
	
	public String nickToId(String user_id) {
		conn = DBUtil.getConnection();
		String nickname = "";
		
		try {
			pst = conn.prepareStatement("select nickname from users where user_id = ?");
			
			pst.setString(1, user_id);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				nickname = rs.getString("nickname");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return nickname;
	}
	
	public UserDTO loginUser(String user_id, String user_pass) {
		conn = DBUtil.getConnection();
		UserDTO user = new UserDTO();
	
		try {
			pst = conn.prepareStatement("select * from users where user_id = ? and user_password = ?");
			
			pst.setString(1, user_id);
			pst.setString(2, user_pass);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				user = makeUser(rs);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}
	
	public UserDTO loginKakaoUser(String user_id) {
		conn = DBUtil.getConnection();
		UserDTO user =  null;
	
		try {
			pst = conn.prepareStatement("select * from users where user_id = ?");
			
			pst.setString(1, user_id);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				user = makeUser(rs);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}
	
	public int confirmUserid(String user_id) {
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement("select * from users where user_id = ?");
			
			pst.setString(1, user_id);
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int confirmNickname(String nickname) {
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement("select * from users where nickname = ?");
			
			pst.setString(1, nickname);
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	public int updateUser(UserDTO user, String user_id) {
		conn = DBUtil.getConnection();
	
		try {
			pst = conn.prepareStatement("update users set user_password = ?, user_name = ?, u_image_path = ?, user_email = ?, nickname = ?, "
					+ "user_phone = ?, host = ?, birth = ?, favorite = ? where user_id = ?");
			
			pst.setString(1, user.getUser_pass());
			pst.setString(2, user.getUser_name());
			pst.setString(3, user.getU_image_path());
			pst.setString(4, user.getUser_email());
			pst.setString(5, user.getNickname());
			pst.setString(6, user.getUser_phone());
			pst.setInt(7, user.getHost());
			pst.setDate(8, user.getBirth());
			pst.setString(9, user.getFavorite());
			pst.setString(10, user_id);
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	public String selectImg(String user_id) {
		conn = DBUtil.getConnection();
		String img = null;
		try {
			pst = conn.prepareStatement(SQL_SELECT_IMAGE);
			pst.setString(1, user_id);
			rs = pst.executeQuery();
			rs.next();
			img = rs.getString("u_image_path");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return img;
	}
	
	private UserDTO makeUser(ResultSet rs2) throws SQLException {
		UserDTO user = new UserDTO();
		
		user.setUser_id(rs2.getString("user_id"));
		user.setUser_pass(rs2.getString("user_password"));
		user.setUser_name(rs2.getString("user_name"));
		user.setU_image_path(rs2.getString("u_image_path"));
		user.setUser_email(rs2.getString("user_email"));
		user.setNickname(rs2.getString("nickname"));
		user.setUser_phone(rs2.getString("user_phone"));
		user.setHost(rs2.getInt("host"));
		user.setManager(rs2.getInt("manager"));
		user.setBirth(rs2.getDate("birth"));
		user.setFavorite(rs2.getString("favorite"));
		user.setConfirm(rs2.getInt("confirm"));
		
		return user;
	}
	
	//아이디 중복체크
	
	public int selectByID(String id) {
		int result = 0;
		conn = DBUtil.getConnection();
	 try {
			pst = conn.prepareStatement("select count(*)  from users where user_id = ?");
			pst.setString(1, id); 
			rs = pst.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return result;
}
	
	//회원탈퇴
	public int userDelete(String user_id , String user_pass ) {
		int result =0;
		conn = DBUtil.getConnection();
		 try {
				pst = conn.prepareStatement("DELETE FROM users WHERE user_id = ? and user_password = ? " );     
				pst.setString(1, user_id); 
				pst.setString(2, user_pass); 
				
				result = pst.executeUpdate();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.dbClose(rs, pst, conn);
			}
			
		return result; 
	}
}
















