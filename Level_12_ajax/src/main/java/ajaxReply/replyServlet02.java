package ajaxReply;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ajaxReply/rinsert.bo")
public class replyServlet02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String replyContent = request.getParameter("content");
		int bno = Integer.parseInt(request.getParameter("bno"));
		String name = request.getParameter("name");
		
		Reply bean = new Reply();
		bean.setContent(replyContent);
		bean.setName(name);
		bean.setRef(bno);
		
		int res = new ReplyDao().insertReply(bean);
		
		response.getWriter().print(res);
	}
}
