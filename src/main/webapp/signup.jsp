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

	</style>
</head>
<body>
	<div class="container">
		<div class="container-1">
		<h1>Pentagon Space</h1>
		<h2>Application form</h2>
		<% String successMessage = (String)request.getAttribute("success");
		if(successMessage != null){%>
		<h3 class = "success"><%= successMessage%></h3>
		<%}%> 
		
		<%String errorMessage = (String)request.getAttribute("error"); 
		if(errorMessage != null){%>
		<h3 class = "error"><%=errorMessage %></h3>
		<%} %>
		
		
		
		</div>
		
		<form action="signup" method="post">
			<div class="mb-3 row">
    			<label>Enter your name :</label>
    			<div class="col-sm-10">
      				<input type="text" class="form-control" name="name">
   		 		</div>
  			</div>

  			<div class="mb-3 row">
    			<label>Enter phone number :</label>
    			<div class="col-sm-10">
      				<input type="tel" class="form-control" name="phone">
    			</div>
  			</div>

  			<div class="mb-3 row">
    			<label>Enter the mail ID :</label>
    			<div class="col-sm-10">
      				<input type="email" class="form-control" name="mail">
    			</div>
  			</div>

  			<div class="mb-3 row">
    			<label>Enter the branch :</label>
    			<div class="col-sm-10">
      				
      				<select class="form-select" aria-label="Default select example" name="branch">
						  <option selected>Select Branch</option>
						  <option>ISE</option>
						  <option>CSE</option>
						  <option>ECE</option>
						  <option>CIV</option>
						  <option>MECH</option>
					</select>
    			</div>
  			</div>


  			<div class="mb-3 row">
    			<label>Enter the location :</label>
    			<div class="col-sm-10">
      				<!-- <input type="text" class="form-control" name="loc"> -->
      				<select class="form-select" aria-label="Default select example" name="loc">
						  <option selected>Select Location</option>
						  <option>Bengaluru</option>
						  <option>Mandya</option>
						  <option>Mangaluru</option>
						  <option>Pune</option>
						  <option>Kochi</option>
					</select>
    			</div>
  			</div>

  			<div class="mb-3 row">
    			<label>Enter the password :</label>
    			<div class="col-sm-10">
      				<input type="password" class="form-control" name="password">
    			</div>
  			</div>

  			<div class="mb-3 row">
    			<label>Confirm password :</label>
    			<div class="col-sm-10">
      				<input type="password" class="form-control" name="confirmpassword">
    			</div>
  			</div>

  			<div class="button-para">
  				<button type="submit" class="btn btn-primary">create account</button>
  				<p>already have an account?<a href="login.jsp"> login</a></p>
  			</div>


		</form>
	</div>
</body>
</html>