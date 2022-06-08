package travel.model;

import java.sql.SQLException;

import travel.DTO.UserDTO;
import travel.util.DBUtil;

public class UserService {
	UserDAO userdao = new UserDAO();
	
	public int insertUser(UserDTO user) {
		return userdao.insertUser(user);
	}
	
	public UserDTO loginUser(String user_id, String user_pass) {
		return userdao.loginUser(user_id, user_pass);
	}
	
	public int confirmUserid(String user_id) {
		return userdao.confirmUserid(user_id);
	}
	
	public int confirmNickname(String nickname) {
		return userdao.confirmNickname(nickname);
	}
	
	public int updateUser(String user_id) {
		return userdao.updateUser(user_id);
	}
	public String selectNick(String user_id) {
		return userdao.selectNick(user_id);
	}
}
