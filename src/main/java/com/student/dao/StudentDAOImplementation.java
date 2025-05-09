package com.student.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.student.connection.Connector;
import com.student.dto.Student;

public class StudentDAOImplementation implements StudentDAO{
	
	private Connection con;
	
	public StudentDAOImplementation()
	{
		this.con = Connector.requestConnection();
	}

	//Here we will be writing all the JDBC implementation/logics.
	
	@Override
	public boolean insertStudent(Student s) {
		int i = 0;
		String query = "INSERT INTO STUDENT VALUES(0,?,?,?,?,?,?,SYSDATE())";
		try {
			PreparedStatement ps = con.prepareStatement(query);
	
			ps.setString(1, s.getName());
			ps.setLong(2,s.getPhone());
			ps.setString(3, s.getMail());
			ps.setString(4, s.getBranch());
			ps.setString(5, s.getLoc());
			ps.setString(6, s.getPassword());
			
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(i>0)
		{
			return true;
		}
		else {
			return false;
		}
		
	}

	@Override
	public boolean updateStudent(Student s) {
		String query="UPDATE STUDENT SET NAME=?,PHONE=?,MAIL=?,BRANCH=?,LOCATION=?,PASSWORD=? WHERE ID=?";
	    int i=0;
	    try {
	      PreparedStatement ps=con.prepareStatement(query);
	      ps.setString(1, s.getName());
	      ps.setLong(2, s.getPhone());
	      ps.setString(3, s.getMail());
	      ps.setString(4, s.getBranch());
	      ps.setString(5, s.getLoc());
	      ps.setString(6, s.getPassword());
	      ps.setInt(7, s.getId());
	      i=ps.executeUpdate();
	    } catch (SQLException e) {
	      // TODO Auto-generated catch block
	      e.printStackTrace();
	    }
	    if(i>0) {
	      return true;
	      
	    }
	    else {
	    return false;
	    }
		
	}

	@Override
	public boolean deleteStudent(Student s) {
		String query = "DELETE FROM STUDENT WHERE ID = ?";
		int i = 0;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setInt(1, s.getId());
			i = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0)
		{
			return true;
		}
		else {
		return false;
		}
	}

	@Override
	public Student getStudent(String mail, String password) {
		
		Student s = null;
		String query = "SELECT * FROM STUDENT WHERE MAIL = ? AND PASSWORD = ?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1, mail);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
//				int id = rs.getInt("ID");
//				s.setId(id);
				
				s = new Student();
				
				//should pass the values to the Student object
				//int id = rs.getInt("ID");
				//s.setId(id);
				s.setId(rs.getInt("ID"));
				s.setName(rs.getString("NAME"));
				s.setPhone(rs.getLong("PHONE"));
				s.setMail(rs.getString("MAIL"));
				s.setBranch(rs.getString("BRANCH"));
				s.setLoc(rs.getString("LOCATION"));
				s.setPassword(rs.getString("PASSWORD"));
				s.setDate(rs.getString("DATE"));
				//finally Student object is non-empty(completely filled object)
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return s; //returning the filled object
	}

	@Override
	public Student getStudent(long phone, String mail) {
		Student s = null;
		String query = "SELECT * FROM STUDENT WHERE PHONE = ? AND MAIL = ?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setLong(1, phone);
			ps.setString(2, mail);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
//				int id = rs.getInt("ID");
//				s.setId(id);
				
				s = new Student();
				
				//should pass the values to the Student object
				//int id = rs.getInt("ID");
				//s.setId(id);
				s.setId(rs.getInt("ID"));
				s.setName(rs.getString("NAME"));
				s.setPhone(rs.getLong("PHONE"));
				s.setMail(rs.getString("MAIL"));
				s.setBranch(rs.getString("BRANCH"));
				s.setLoc(rs.getString("LOCATION"));
				s.setPassword(rs.getString("PASSWORD"));
				s.setDate(rs.getString("DATE"));
				//finally Student object is non-empty(completely filled object)
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return s; 
		
	}

	@Override
	public ArrayList<Student> getStudent() {
		String query="SELECT * FROM STUDENT";
	    ArrayList<Student> studentsList=new ArrayList<Student>();
	    Student s=null;
	    try {
	      PreparedStatement ps=con.prepareStatement(query);
	      ResultSet rs=ps.executeQuery();
	      while(rs.next()) {
	        s=new Student();
	        s.setId(rs.getInt("ID"));
	        s.setName(rs.getString("NAME"));
	        s.setPhone( rs.getLong("PHONE"));
	        s.setMail( rs.getString("MAIL"));
	        s.setBranch( rs.getString("BRANCH"));
	        s.setLoc( rs.getString("LOCATION"));
	        s.setPassword( rs.getString("PASSWORD"));
	        s.setDate( rs.getString("DATE"));
	        
	        
	        studentsList.add(s);
	        
	      }
	    } catch (SQLException e) {
	      // TODO Auto-generated catch block
	      e.printStackTrace();
	    }
	    // TODO Auto-generated method stub
	    return studentsList;
	  
	}

	@Override
	public Student getStudent(String name) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
