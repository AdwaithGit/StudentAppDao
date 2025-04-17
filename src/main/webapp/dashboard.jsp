<%@page import="com.student.dto.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Arial', sans-serif;
    }
    .navbar {
      background-color: black; /* Blue background for navbar */
    }
    .navbar-brand {
      color: white !important;
    }
    .nav-link {
      color: white !important;
    }
    .logout-btn {
      background-color: #e74a3b; /* Red color for logout button */
      color: white;
      border-radius: 5px;
      padding: 8px 16px;
    }
    .logout-btn:hover {
      background-color: #c0392b;
    }
    .container {
      margin-top: 30px;
    }
    table th, table td {
      text-align: center;
    }
    body{
      background-color: #fafad2;
    }

    .mt-4{
      border:1px solid black;
    }    
  </style>
</head>
<body>
	
	<% Student user = (Student)session.getAttribute("student");
	if(user!=null){%>
	

  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Welcome <%=user.getName() %></a>
      <div class="collapse navbar-collapse">
        <ul class="navbar-nav ms-auto"> <!-- ms-auto to align items to the right -->
        
        <%if(user.getId()==4){%>
         <li class="nav-item">
            <a class="nav-link" href="viewuser.jsp">View Users</a>
          </li>
          <%} %>
         
          <li class="nav-item">
            <a class="nav-link" href="forgotpassword.jsp">Reset Password</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="updateaccount.jsp">Update Data</a>
          </li>
          <li class="nav-item">
           <!--  <button type="submit" class="logout-btn" href="logout">Logout</button> -->
           <form action="logout" method="post">
           		<button type="submit" class="logout-btn">Logout</button>
           </form>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Dashboard Content -->
  
  <div class="container">
    <center><h2>Dashboard</h2></center>
    <center>
    	<% String successMes = (String)request.getAttribute("success");
    	if(successMes != null){%>
    	<h4><%=successMes %></h4>
    	<%} %>
    	
    	
    </center>
    <h4>View your data</h4>

    <!-- Table -->
    
    <table class="table table-bordered mt-4">
      <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Phone</th>
          <th>Mail ID</th>
          <th>Branch</th>
          <th>Location</th>
        </tr>
      </thead>
      
      <tbody>
      	<tr>
      		<td><%=user.getId() %></td>
      		<td><%=user.getName() %></td>
      		<td><%=user.getPhone() %></td>
      		<td><%=user.getMail() %></td>
      		<td><%=user.getBranch() %></td>
      		<td><%=user.getLoc() %></td>
      	<tr>
      </tbody>
    </table>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
  <%} %>
</body>
</html>
