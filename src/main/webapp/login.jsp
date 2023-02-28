<%
	String username=request.getParameter("username");
	String pwd=request.getParameter("password");
	System.out.println(request.getAttribute("username"));
	Cookie[] cookies=request.getCookies();
	
	if(cookies.length>0 && cookies.equals("null")) {
		Cookie cookie = null;
		for (int i = 0; i < cookies.length-1; i++) {
	        cookie = cookies[i];
	        if(cookie.getName().equals("username"))
	        {
	        	username=cookie.getValue();
	        }
	        if(cookie.getName().equals("password"))
	        {
	        	pwd=cookie.getValue();
	        }
	        
	        System.out.println("Name : " + cookie.getName( ) + ", ");
	        System.out.println("Value: " + cookie.getValue()+" <br/>");
	        
	     }
	System.out.println(username+pwd);
	}else
	{
		
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign in Form by Colorlib</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="images/signin-image.jpg" alt="sing up image">
						</figure>
						<a href="registration.jsp" class="signup-image-link">Create an
							account</a>
					</div>

					<div class="signin-form">
						<h2 class="form-title">Sign In</h2>
						<form method="POST" action="login" class="register-form"
							id="login-form">
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Your Email" value="<%= username==null?"":username %>" required />
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password" value="<%= pwd==null?"":pwd %>"
									placeholder="Password" required/>
							</div>
							<div class="form-group">
								<input type="checkbox" name="remember" id="remember-me"
									class="agree-term" /> <label for="remember-me"
									class="label-agree-term"><span><span></span></span>Remember
									me</label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
						
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="js/main.js"></script>
	
	<script  src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"> </script>

<script>
	var status=document.getElementById("status").value;
	if(status=="success")
		{
				swal("Congrats!!","Account Creted Successfully","success");
		}
	if(status=="failed")
	{
			swal("Oops!!","Invalid Details","error");
	}
	if(status=="invalidUpwd")
	{
			swal("Sorry!!","Please Enter password","error");
	}
	if(status=="invalidEmail" )
	{
			swal("Oops!!","Please Enter Emsail Address","error");
	}
	if( status=="invalidEmailreg")
		{
		swal("Ohho!!","Please Enter Emsail Address","error");
		}
	if(status=="invalidBoth")
	{
			swal("Sorry!!","Please Enter Both Filed ","error");
	}
</script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>