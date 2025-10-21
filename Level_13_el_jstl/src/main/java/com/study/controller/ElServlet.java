package com.study.controller;

import java.io.IOException;

import com.study.dto.person;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ElServlet
 */
@WebServlet("/el.do")
public class ElServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 데이터를 담을 수 있는 JSP 내장 객체 종류
		 * 1. ServletContext(application Scope)
		 * -> 한 애플리케이션당 단 하나만 존재하는 개체
		 * 	  이 영역에 데이터를 담으면 애플리케이션 전역에서 사용 가능
		 * 	  공유 범위가 가장 큼 (jsp / servlet / java)
		 * 2. HttpSession(session Scope)
		 * -> 한 브라우저당 하나가 존재함
		 * 	  이 영역에 데이터를 담으면 jsp / servlet 단에서 사용 가능
		 *    공유 범위가 다소 제한적임
		 * 3. HttpServletRequest(request Scope)
		 * -> 요청 때마다 매번 생성됨
		 * 	  이 영역에 데이터를 담으면 해당 request 객체를 포워딩 받는 응답
		 * 	  (jsp / servlet 영역에서 사용 가능
		 * 	  공유 범위가 가장 작음
		 * 4. PageContext(page Scope)
		 * -> jsp마다 존재함
		 * 	  해당 페이지에서만 사용 가능
		 * 	  공유 범위가 가장 작음
		 * 
		 * 위 네 객체들에 데이터를 담을 때
		 * .setAttribute("키", 담으려고 하는 데이터)
		 * 
		 * 꺼낼 때
		 * .getAttribute("키") -> 담겨있는 데이터를 꺼낼 수 있다
		 * 
		 * 삭제할 때
		 * .removeAttribute("키")
		 */
		
		// requestScope에 담기
		request.setAttribute("classRoom", "801호 강의실");
		request.setAttribute("student", new person("김두한",23,"남성"));
		
		// sessionScope에 담기
		HttpSession session = request.getSession();
		session.setAttribute("academy","프로아카데미");
		session.setAttribute("teacher", new person("조병옥",53,"남성"));
		
		// 둘 다 동일한 키라면
		request.setAttribute("scope", "request");
		session.setAttribute("scope", "session");
				
		// applicationScope면
		ServletContext application = request.getServletContext();
		application.setAttribute("scope","application");
		// 응답 페이지 지정으로 그곳에 포워딩되게 하기
		request.getRequestDispatcher("views/1_EL/01.el.jsp").forward(request, response);
		
	}

}
