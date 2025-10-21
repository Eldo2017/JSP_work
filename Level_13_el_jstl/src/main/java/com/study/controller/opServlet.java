package com.study.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.study.dto.person;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/op.do")
public class opServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("big", 123);
		request.setAttribute("small", 102);
		
		request.setAttribute("sOne", "");
		request.setAttribute("sTwo", "");
		request.setAttribute("sThree", "이것은 수류탄이여!");
		
		request.setAttribute("pOne", new person("",35,""));
		request.setAttribute("pTwo", null);
		
		ArrayList<String> ls1 = new ArrayList<>();
		request.setAttribute("aOne", ls1);
		
		ArrayList<String> ls2 = new ArrayList<>();
		ls2.add("신불출");
		request.setAttribute("aTwo", ls2);
		
		request.getRequestDispatcher("views/1_EL/02.elOp.jsp").forward(request, response);
	
		
	}
}
