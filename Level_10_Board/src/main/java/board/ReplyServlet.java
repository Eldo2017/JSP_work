package board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/boardReply")
public class ReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardBean rpBean = new BoardBean();
		rpBean.setName(request.getParameter("name"));
		rpBean.setSubject(request.getParameter("subject"));
		rpBean.setContent(request.getParameter("content"));
		rpBean.setRef(Integer.parseInt(request.getParameter("ref")));
		rpBean.setPos(Integer.parseInt(request.getParameter("pos")));
		rpBean.setDepth(Integer.parseInt(request.getParameter("depth")));
		rpBean.setPass(request.getParameter("pass"));
		rpBean.setIp(request.getParameter("ip"));
		
		System.out.println(rpBean.getContent());
		
		BoardDAO vDao = new BoardDAO();
		vDao.replyUpPos(rpBean.getRef(), rpBean.getPos());
		vDao.replyBoard(rpBean);
		
		response.sendRedirect("list.jsp?nowPage=" + request.getParameter("nowPage"));
	}
}
