
package travel.controller;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import travel.DTO.UserDTO;
import travel.model.UserService;

public class NickCheckController implements Command {
	@Override
	public String execute(HttpServletRequest request) {
		String nick = request.getParameter("nickname");

		if (nick == null) 
			return null;
		System.out.println("nickname" + nick);

		UserService service = new UserService();
		
		int result = service.confirmNickname(nick);
		//PrintWriter out = response.getWriter(); out.print(result == 0 ? 0 : 1);
		return "rest:" + result;
	}
 
}
