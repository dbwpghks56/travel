/*
 * package travel.controller;
 * 
 * import java.io.PrintWriter; import javax.servlet.http.HttpServletRequest;
 * import travel.DTO.UserDTO; import travel.model.UserService;
 * 
 * public class UserCheckController implements Command {
 * 
 * @Override public String execute(HttpServletRequest request) { String id =
 * request.getParameter("user_id");
 * 
 * if (id == null) return null;
 * 
 * System.out.println("user_id" + id);
 * 
 * UserService service = new UserService(); int result = service.selectByID(id);
 * //PrintWriter out = response.getWriter(); out.print(result == 0 ? 0 : 1);
 * 
 * }
 * 
 * }
 */