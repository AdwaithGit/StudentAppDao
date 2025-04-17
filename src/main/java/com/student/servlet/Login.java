package com.student.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.student.dao.StudentDAO;
import com.student.dao.StudentDAOImplementation;
import com.student.dto.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//creating Student pojo class object
		Student s = new Student();
		
		//StudentDAO ref object created
		StudentDAO sdao = new StudentDAOImplementation();
		//PrintWriter out = resp.getWriter();
		
		//object creation of session
		HttpSession session = req.getSession(true);
		
		//or Student s = sdao.get.....
		s = sdao.getStudent(req.getParameter("mail"),req.getParameter("password"));
		if(s!=null)
		{
			
			//out.println("<h1 style=\"color:green;\">Login successful,Welcome "+s.getName()+"</h1>");
//			req.setAttribute("student", s);
			session.setAttribute("student", s);
			req.setAttribute("success","login successful");
			RequestDispatcher rd = req.getRequestDispatcher("dashboard.jsp");
			rd.forward(req, resp);
			
		}
		else {
			//out.println("<h1 style = \"color:red;\">Invalid credentials</h1>");
			req.setAttribute("failtwo","login successfully failed");
			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		}
		
		
		
		
	}
}
