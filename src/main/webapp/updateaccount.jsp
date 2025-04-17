<%@page import="com.student.dto.Student"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Sign Up page</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

	<style>
		.container{
			width:500px;
			background-color: #799e15;
			border-radius: 10px;
			box-shadow: 0px 0px 20px #b54135;
			margin-left: 470px;
		}

		/*.col-sm-2{
			padding:20px;
		}*/

		.button-para{
			display: flex;
			align-items: center;
		}

		.btn-primary{
			width: 150px;
		}

		p{
			margin-top: 10px;
			margin-left: 30px;
			color: #b9e6eb;
			font-size: 20px;
		}
		a{
			color: #103d18;
		}

		form{
			margin-top: 20px;

		}

		h1{
			margin-left: 90px;
			color: #deedb4;
		}
		h2{
			margin-left: 110px;
			color: #deedb4;
		}
		label{
			color: #b9e6eb;
			font-size: 20px;
			margin-left: 30px;
		}
		.col-sm-10{
			margin-left: 30px;
		}
		
		.success{
			margin-left: 90px;
			color:green;
		}
		
		.error{
			margin-left: 90px;
			color:red;
		}
		
		.btn

	</style>
</head>
<body>
	<div class="container">
		<div class="container-1">
		<h1>Update Account</h1>
		<%Student user = (Student)session.getAttribute("student"); 
		if(user != null){%>
		
		
		<% String successMessage = (String)request.getAttribute("success");
		if(successMessage != null){%>
		<h3 class = "success"><%= successMessage%></h3>
		<%}%> 
		
		<%String errorMessage = (String)request.getAttribute("error"); 
		if(errorMessage != null){%>
		<h3 class = "error"><%=errorMessage %></h3>
		<%} %>
		
		
		
		</div>
		
		<form action="updateaccount" method="post">
			<div class="mb-3 row">
			<h3>Update your account</h3>
    			<label>Enter your name :</label>
    			<div class="col-sm-10">
      				<input type="text" class="form-control" name="name" value = "<%=user.getName() %>">
   		 		</div>
  			</div>

  			<div class="mb-3 row">
    			<label>Enter phone number :</label>
    			<div class="col-sm-10">
      				<input type="tel" class="form-control" name="phone" value="<%=user.getPhone() %>">
    			</div>
  			</div>

  			<div class="mb-3 row">
    			<label>Enter the mail ID :</label>
    			<div class="col-sm-10">
      				<input type="email" class="form-control" name="mail" value="<%=user.getMail() %>">
    			</div>
  			</div>

  			<div class="mb-3 row">
    			<label>Enter the branch :</label>
    			<div class="col-sm-10">
      				
      				<%-- <select class="form-select" aria-label="Default select example" name="branch" value="<%=user.getBranch() %>">
						  <!-- <option>Select Branch</option> -->
						  <option>ISE</option>
						  <option>CSE</option>
						  <option>ECE</option>
						  <option>CIV</option>
						  <option>MECH</option>
					</select> --%>
					
					<input type="text" class="form-control" name="branch" value="<%=user.getBranch()%>">
    			</div>
  			</div>


  			<div class="mb-3 row">
    			<label>Enter the location :</label>
    			<div class="col-sm-10">
      				<!-- <input type="text" class="form-control" name="loc"> -->
      				<%-- <select class="form-select" aria-label="Default select example" name="loc" value="<%=user.getLoc() %>">
						  <option>Select Location</option>
						  <option>Bengaluru</option>
						  <option>Mandya</option>
						  <option>Mangaluru</option>
						  <option>Pune</option>
						  <option>Kochi</option>
					</select> --%>
					<input type="text" class="form-control" name="location" value="<%=user.getLoc() %>">
    			</div>
  			</div>

  			

  			<div class="button-para">
  				<button type="submit" class="btn btn-primary">update account</button>
  				<button type = "submit" class="btn-back"><a href="dashboard.jsp">back</a></button>
  			</div>

	
		</form>
		<%}else{%>
		<h3>Student not found</h3>
		<%} %>
		
		
		 
	</div>
</body>
</html>