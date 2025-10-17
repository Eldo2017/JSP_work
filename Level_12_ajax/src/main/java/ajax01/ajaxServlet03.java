package ajax01;

import java.io.IOException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ajax01/ajax2.do")
public class ajaxServlet03 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		
		// v1. 응답 데이터가 하나의 문자열이라면
		response.setContentType("text/html; charset=UTF-8");
		String responseData = "이름 : " + name + ", 나이 : " + age;
		
		response.getWriter().print(responseData);
		
		
		
		 /*
		 // v2. 응답 데이터가 여러 개라면 
		 response.setContentType("text/html; charset=UTF-8");
		 response.getWriter().print(name); 
		 response.getWriter().print(age);
		 */

		
		// v3. 응답 데이터가 여러 개라면(단, JSON 사용)
		
		/*
		 * JSON(JavaScript Object Notation : 자바스크립트 객체 표기법)
		 * - ajax 콩신시 데이터 전송에 자주 사용되는 포맷 형식 중 하나
		 *  > [value, value, value] => 자바스크립트의 배열 객체 => JSONArray
		 *  > {key:value, key:value} => 자바스크립트에서의 일반 객체 => JSONObject
		 */
		
		/*
		JSONArray jArr = new JSONArray();
		jArr.add(name);
		jArr.add(age);
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jArr);
		*/
		
		/*
		// v4. JSONObject
		JSONObject jObj= new JSONObject();
		jObj.put("name", name);
		jObj.put("age", age);
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jObj);
		*/
	}

}
