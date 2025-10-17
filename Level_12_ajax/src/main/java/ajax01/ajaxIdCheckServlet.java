package ajax01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ajax01/idCheck.me")
public class ajaxIdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");

		boolean res = new MemberDao().checkId(id);
		
		if(res) {
			response.getWriter().print("idN");
		} else {
			response.getWriter().print("idY");
		}
	}

}
