package travel.model;

import travel.DTO.UserDTO;

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
	
	public String nickToId(String user_id) {
		return userdao.nickToId(user_id);
	}
}
