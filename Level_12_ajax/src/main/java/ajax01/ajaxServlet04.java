package ajax01;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ajax01/ajax4.do")
public class ajaxServlet04 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Member bean = new MemberDao().getMember(id);
		
		System.out.println(bean);
		
		/* 1.
		// JSONObject({key:value, key:value, ... })
		JSONObject jobj = new JSONObject();
		jobj.put("userId", bean.getId());
		jobj.put("userName", bean.getName());
		jobj.put("gender", bean.getGender());
		jobj.put("email", bean.getEmail());
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jobj);
		*/
		
		/*  2. 
		JSONObject jobj = new JSONObject();
		if(bean.getId() == null) {
			jobj.put("status", "fail");
			jobj.put("message", "해당 ID를 찾을 수 없습니다");	
		} else {
			jobj.put("status", "success");
			jobj.put("userId", bean.getId());
			jobj.put("userName", bean.getName());
			jobj.put("gender", bean.getGender());
			jobj.put("email", bean.getEmail());
		}
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jobj);
		*/
		
		// 3.
		/*
		// GSON : 객체를 알아서 JSONObject로 변경해줌
		// 메소드 : toJson(응답할자바객체, 응답할스트림);
		Gson gson = new Gson();
		gson.toJson(bean, response.getWriter());
		
		// 위의 2줄을 한줄로 줄이면
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(bean, response.getWriter());
		*/
		
		// 4. GSON으로 fail과 success 넣기
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();
		
		if(bean.getId() == null) {
			Map<String, String> result = new HashMap<>();
			result.put("status", "fail");
			result.put("message", "해당 ID를 찾을 수 없습니다");
			gson.toJson(result, response.getWriter());
		} else {
			Map<String, Object> result = new HashMap<>();
			result.put("status", "success");
			result.put("member", bean);
			gson.toJson(result, response.getWriter());
		}
	}
}