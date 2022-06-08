package travel.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import travel.DTO.UserDTO;
import travel.model.UserService;
import travel.util.DateUtil;
import travel.util.UploadFileHelper;



public class SignUpController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		UserService service = new UserService();
		String dir = request.getServletContext().getRealPath("uploads");
		
		Map<String, Object> map = UploadFileHelper.uploadFile("uploads", request);
		
		
		int result = service.insertUser(makeUser(map));
		
		request.setAttribute("result", result);
		
		return "confirmlogin.jsp";
	}

	private UserDTO makeUser(Map<String, Object> map) {
		UserDTO user = new UserDTO();
		
		List<String> potos = (List<String>)map.get("potos");
		System.out.println(potos);
		
		Map<String,String> params = (Map<String,String>)map.get("params");
		
		user.setUser_id(params.get("id"));
		user.setUser_pass(params.get("password"));
		user.setUser_name(params.get("name"));
		user.setU_image_path(potos.get(0));
		user.setUser_email(params.get("email"));
		user.setNickname(params.get("nickname"));                                                
		user.setUser_phone(params.get("phone"));
		user.setBirth(DateUtil.convertToDate(params.get("birth")));
		user.setFavorite(params.get("favorite"));
		user.setHost(Integer.parseInt(params.get("host")));
		
		return user;
	}

}
