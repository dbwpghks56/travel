package travel.controller;



import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/jsp/search.do")
public class SearchServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
			req.setCharacterEncoding("utf-8");
			searchContreller controller = new searchContreller();
			RequestDispatcher rd = req.getRequestDispatcher(controller.execute(req));
			rd.forward(req, resp);
			
		}


	

}
