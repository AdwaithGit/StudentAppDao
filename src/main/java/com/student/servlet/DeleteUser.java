package com.student.servlet;

import java.io.IOException;

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

@WebServlet("/deleteusers")
public class DeleteUser extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		HttpSession session = req.getSession(false);
		
		StudentDAO sdao = new StudentDAOImplementation();
		Student s = new Student();
		s.setId(Integer.parseInt(req.getParameter("id")));
		if(sdao.deleteStudent(s))
		{
			req.setAttribute("success", "Data deleted successfully");
			RequestDispatcher rd = req.getRequestDispatcher("viewuser.jsp");
			rd.forward(req, resp);
		}
		else {
			req.setAttribute("error", "Data could not be deleted");
			RequestDispatcher rd = req.getRequestDispatcher("viewuser.jsp");
			rd.forward(req, resp);
		}
	}
}
