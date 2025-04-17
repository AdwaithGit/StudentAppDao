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

@WebServlet("/signup")

public class Signup extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//Creation of Student object
				Student s = new Student();
				
				//Creation of reference of StudentDAO
				StudentDAO sdao = new StudentDAOImplementation();
				
				//Creation of reference of PrintWriter abstract class
				//PrintWriter out = resp.getWriter();
				
				//collecting the data from the UI(getParameter())
				
				//String name = req.getParameter("name")
				//s.setName(name)
				
				s.setName(req.getParameter("name"));
				
				//String phone = req.getParameter("phone")
				//long phone1 = Long.parseLong(phone)
				//s.setPhone(phone1)
				
				s.setPhone(Long.parseLong(req.getParameter("phone")));
				s.setMail(req.getParameter("mail"));
				s.setBranch(req.getParameter("branch"));
				s.setLoc(req.getParameter("loc"));
				if(req.getParameter("password").equals(req.getParameter("confirmpassword")))
				{
					s.setPassword(req.getParameter("password"));
					
					//JDBC logic
					if(sdao.insertStudent(s))
					{
						//out.println("<h1>Data saved successfully</h1>");
						req.setAttribute("success","Data Saved Successfully");
						RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
						rd.forward(req, resp);
					}
					else {
						//out.println("<h1>Failed to save the data</h1>");
						req.setAttribute("error", "Failed to save the data");
						RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
						rd.forward(req, resp);
								
					}
				}
				else {
					//out.println("<h1>Failed to save the data</h1>");
					req.setAttribute("error", "Failed to save the data");
					RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
					rd.forward(req, resp);
				}
	}
}
