package travel.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;

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

		if (uri.equals("/accommodation/search.do")) {
			command = new SearchController();
		} else if (uri.equals("/user/login.do")) {
			command = new LoginUserController();
		} else if (uri.equals("/user/signup.do")) {
			command = new SignUpController();
		} else if(uri.equals("/review/insertReview.do")) {
			command = new InsertReview();
		} else if(uri.equals("/review/listReview.do")) {
			command = new ListReview();
		} else if(uri.equals("/review/confirmReview.do")) {
			command = new ConfrimReview();
		} else if(uri.equals("/review/deleteReview.do")) {
			command = new ReviewDeleteController();
		} else if(uri.equals("/accommodation/selectRoom.do")) {
			command = new SelectRoomController();
		} else if (uri.equals("/accommodation/insertAcco.do")) {
			command = new InsertAccoController();
		} else if(uri.equals("/accommodation/insertRoomInquiry.do")) {
			command = new InsertRoomInquiryController();
		} else if(uri.equals("/accommodation/listRoomInquiry.do")) {
			command = new ListRoomInquiryController();
		} else if(uri.equals("/accommodation/answerInquiry.do")) {
			command = new AnswerInquiry();
		} else if (uri.equals("/accommodation/insertRoom.do")) {
			command = new InsertRoomController();
		} else if(uri.equals("/reservation/reservation.do")) {
			command = new RsvController();
		} else if(uri.equals("/reservation/rsvlist.do")) {
			command = new RsvListController();
		} else if(uri.equals("/reservation/rsvdetail.do")) {
			command = new RsvDetailController();
		} else if(uri.equals("/reservation/rsvdelete.do")) {
			command = new RsvDeleteController();
		} else if (uri.equals("/accommodation/insertRoom.do")) {
			command = new InsertRoomController();
		} else if(uri.equals("/accommodation/updateReviewReport.do")) {
			command = new updateReportController();
		} else if(uri.equals("/user/UserCheck.do")) {
			command = new UserCheckController();
		} else if(uri.equals("/reservation/hostlist.do")) {
			command = new RsvListHostController();
		} else if(uri.equals("/reservation/hostrsvdetail.do")) {
			command = new RsvDetailHostController();
		} else if(uri.equals("/user/userDelete.do")) {
			command = new UserDeleteController();
		} else if(uri.equals("/user/NickCheck.do")) {
			command = new NickCheckController();
		}  else if(uri.equals("/reservation/rsvdeletedetail.do")) {
			command = new RsvDeleteDetailController();
		} else if(uri.equals("/reservation/rsvcancellremove.do")) {
			command = new RsvCancellRemoveController();
		} else if(uri.equals("/user/logOut.do")) {
			command = new DeleteSessionUser();
		} else if(uri.equals("/user/userUpdate.do")) {
			command = new UserUpdateController();
		}
		
		page = command.execute(req);
		
		// "rest:10", "rest:0"
		if(page.contains("rest:")) {
			String[] mulstr = page.split(":"); // "rest", "10", "0"
			int result = Integer.parseInt(mulstr[1]); // 10, 0
			PrintWriter out = resp.getWriter(); 
			out.print(result == 0 ? 0 : 1);
		}else if(page.contains("redirect:")){
			resp.sendRedirect(page.substring(9));
		}
		else {
			RequestDispatcher rd = req.getRequestDispatcher(page);
			rd.forward(req, resp);
		}

	}
}
