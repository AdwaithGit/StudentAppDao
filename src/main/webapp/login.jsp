<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            background-color: #e3f2fd;
        }

        body{
            background-color: #f3e5f5;
        }
        
        .pass{
        	text-align:center;
        	color:blue;
        }
        
        .failtwo{
        	text-align:center;
        	color:red;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-container">
            <h3 class="text-center">Login</h3>
            
            <%String passMessage = (String)request.getAttribute("pass");
  			if(passMessage != null){%>
  			<h3 class="pass"><%=passMessage %></h3>
  			<%} %>
  			
  			<%String failTwoMessage = (String)request.getAttribute("failtwo");
  			if(failTwoMessage != null){%>
  			<h3 class="failtwo"><%=failTwoMessage %></h3>
  			<%} %>
  			
  			
            
            <form action="login" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Email address</label>
                    <input type="email" class="form-control" id="email" placeholder="Enter your email" required name="mail">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" placeholder="Enter your password" required name="password">
                </div>
                <button type="submit" class="btn btn-primary w-100">Login</button>
               	<p>Dont have an account?<a href="signup.jsp">SignUp</a></p>
              
               	<p>Forgot pin?<a href = "forgotpassword.jsp">reset pin</a></p>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
