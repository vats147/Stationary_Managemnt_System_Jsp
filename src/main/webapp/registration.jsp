<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form by Colorlib</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						<form onsubmit ="return check()"  method="post" action="register" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" placeholder="Your Name" />
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Your Email" />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Password" />
							</div>
							
							
							
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/signup-image.jpg" alt="sing up image">
						</figure>
						<a href="login.jsp" class="signup-image-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script  src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"> </script>

<script>
	var status=document.getElementById("status").value;
	if(status=="success")
		{
				swal("Congrats!!","Account Creted Successfully","success");
				setTimeout(function() {
					
				window.location.replace('login.jsp');
				
				},1500);

		}
	if(status=="already")
	{
			swal("Oops!!","Account Is already Exists","error");
	}
	if(status=="failed")
	{
			swal("Oops!!","There is an error occure","error");
	}
	
	function check() {  
		var uname = document.getElementById("name").value;
		var uemail=document.getElementById("email").value;
		var upwd = document.getElementById("pass").value;
		var validname=false;
		var validemail=false;
		var validpassword=false;
		let regex;
		if(uname == "" && uemail=="" && upwd==""){
	  		swal("Oops!!","Filed should not be null","error");
	     		return false;
	  	}
		
		//userName Validation
		regex=/^[A-Za-z][A-Za-z0-9_]{1,10}$/;
		if(!regex.test(uname))
		{
			
			swal("Sorry!!","Name is not valid","error");
			return false;
		}else
		{
			validname=true;
		}

		regex=/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;

		if(!regex.test(uemail))
		{
			swal("Sorry!!","Email is not valid","error");
			return false;
		}else
		{
			validemail=true;
		}

		regex=/^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/;
		if(!regex.test(upwd))
		{
			
			swal({
				icon: 'error',
				title: 'Invalid Password',
				text: 'Password Must have one Capital(A-Z), one small(a-z), one numerical(0-9) and should not be less than 8 and more than 15',
				
				})

			
			return false;
		}else
		{
			validpassword=true;
		}


		if(validname&&validemail&&validpassword)
		{
			return true;
		}

		
	  	
	  
	  	
	  }

	
</script>
<% 
System.out.println(request.getAttribute("status"));
%>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>