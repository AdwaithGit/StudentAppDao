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

@WebServlet("/forgotpassword")
public class ForgotPassword extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		StudentDAO sdao = new StudentDAOImplementation();
		//PrintWriter out = resp.getWriter();
		Long.parseLong(req.getParameter("phone"));
		req.getParameter("mail");
		Student s = sdao.getStudent(Long.parseLong(req.getParameter("phone")),req.getParameter("mail"));
		if(s!=null)
		{
			if(req.getParameter("password").equals(req.getParameter("confirmpassword")))
			{
				s.setPassword(req.getParameter("password"));
				if(sdao.updateStudent(s))
				{
					//out.println("<h1>Password updated successfully</h1>");
					req.setAttribute("pass", "Password Updated Successfully");
					RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
					rd.forward(req, resp);
				}
				else {
					//out.println("<h1>Failed to update password</h1>");
					req.setAttribute("fail", "Password not updated");
					RequestDispatcher rd = req.getRequestDispatcher("forgotpassword.jsp");
					rd.forward(req, resp);
				}
			}
			else {
				//out.println("<h1>Password mismatch</h1>");
				req.setAttribute("fail", "Password mismatch");
				RequestDispatcher rd = req.getRequestDispatcher("forgotpassword.jsp");
				rd.forward(req, resp);
			}
		}
		else {
			//out.println("<h1>Student not found</h1>");
			req.setAttribute("fail", "Student not found");
			RequestDispatcher rd = req.getRequestDispatcher("forgotpassword.jsp");
			rd.forward(req, resp);
		}
	}
	
}
