<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Forgot Pin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #ffdab9;
      font-family: 'Arial', sans-serif;
    }
    .form-container {
      background-color: #afeeee; /* White background for the form */
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      max-width: 400px;
      margin: auto;
      margin-top: 50px;
    }
    .form-title {
      text-align: center;
      font-size: 26px;
      color: #2c3e50; /* Darker color for the title */
      margin-bottom: 30px;
    }
    .form-control {
      border-radius: 5px;
    }
    .btn-custom {
      background-color: #3498db; /* Blue button color */
      color: white;
      width: 100%;
      border-radius: 5px;
      padding: 12px;
    }
    .btn-back {
      width: 100%;
      background-color: #ecf0f1; /* Light gray color */
      color: #3498db;
      padding: 12px;
      border-radius: 5px;
      text-align: center;
    }
    .btn-back:hover {
      background-color: #bdc3c7;
    }
    .btn-custom:hover {
      background-color: #2980b9; /* Darker blue on hover */
    }
    
    .fail{
    	text-align: center;
    	color:red;
    }
  </style>
</head>
<body>

<div class="form-container">
  <h2 class="form-title">Forgot Password?</h2>
  
  
  
  <%String failMessage = (String)request.getAttribute("fail");
  if(failMessage != null){%>
  <h3 class="fail"><%=failMessage %></h3>
  <%} %>
  
  <form action="forgotpassword" method="post">
    <div class="mb-3">
      <label for="phone" class="form-label">Enter Phone Number</label>
      <input type="tel" class="form-control" id="phone"  required name = "phone">
    </div>

    <div class="mb-3">
      <label for="email" class="form-label">Enter Email</label>
      <input type="email" class="form-control" id="email" required name="mail">
    </div>

    <div class="mb-3">
      <label for="password" class="form-label">New Password</label>
      <input type="password" class="form-control" id="password" required name="password">
    </div>

    <div class="mb-3">
      <label for="confirm-password" class="form-label">Confirm Password</label>
      <input type="password" class="form-control" id="confirm-password" required name="confirmpassword">
    </div>

    <button type="submit" class="btn btn-custom mb-3">Update Password</button>
    <a href="login.jsp" class="btn btn-back">Back</a>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
