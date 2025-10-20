package ajaxReply;

import java.io.IOException;
import java.util.ArrayList;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ajaxReply/rlist.bo")
public class replyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));

		ArrayList<Reply> aList = new ReplyDao().getReplyList(bno);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(aList, response.getWriter());

	}

}
