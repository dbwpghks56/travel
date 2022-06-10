package travel.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String method = req.getMethod(); // "GET of "POST"
		System.out.println(req.getRequestURI());
		System.out.println(req.getContextPath());

		String uri = req.getRequestURI().substring(req.getContextPath().length());

		System.out.println(uri);
		String page = "";

		Command command = null;

		if (uri.equals("/jsp/search.do")) {
			command = new SearchController();
		} else if (uri.equals("/user/login.do")) {
			command = new LoginUserController();
		} else if (uri.equals("/user/signup.do")) {
			command = new SignUpController();
		} else if(uri.equals("/accommodation/selectRoom.do")) {
			command = new SelectRoomController();
		} else if (uri.equals("/accommodation/insertAcco.do")) {
			command = new InsertAccoController();
		} else if(uri.equals("/reservation/reservation.do")) {
			command = new RsvController();
		} else if(uri.equals("/reservation/rsvlist.do")) {
			command = new RsvListController();
		} else if(uri.equals("/reservation/rsvdetail.do")) {
			command = new RsvDetailController();
		} else if(uri.equals("/reservation/rsvdelete.do")) {
			command = new RsvDeleteController();
<<<<<<< HEAD
		} else if (uri.equals("/accommodation/insertRoom.do")) {
			command = new InsertRoomController();
		} else if(uri.equals("/accommodation/updateReviewReport.do")) {
			command = new updateReportController();
		} else if(uri.equals("/user/UserCheck.do")) {
			command = new UserCheckController();
=======
		}else if(uri.equals("/reservation/hostlist.do")) {
			command = new RsvListHostController();
>>>>>>> refs/remotes/origin/hyun
		}
<<<<<<< HEAD
				
		
=======

>>>>>>> refs/remotes/origin/hyun
		page = command.execute(req);
		
		// "rest:10", "rest:0"
		if(page.contains("rest:")) {
			String[] mulstr = page.split(":"); // "rest", "10", "0"
			int result = Integer.parseInt(mulstr[1]); // 10, 0
			PrintWriter out = resp.getWriter(); 
			out.print(result == 0 ? 0 : 1);
		}
		
		else {
			RequestDispatcher rd = req.getRequestDispatcher(page);
			rd.forward(req, resp);
		}

	}
}
