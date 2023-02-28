<%
		 response.setHeader("Cache-Control","no-cache"); 
		 response.setHeader("Cache-Control","no-store"); 
		 response.setDateHeader("Expires", 0); 
		 response.setHeader("Pragma","no-cache"); 
	if(session.getAttribute("userId")==null){
		response.sendRedirect("login.jsp");
	}
	else
	{
		System.out.println(session.getAttribute("userId"));
	}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.Object" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %> 
   <%
 //check weather session is created or not
 	String id=request.getParameter("id");
   	String product_Name="";
   	String product_Price="";
   	String product_Description="";
   	String product_Category="";
   
   
 	System.out.println(id);
 	if(id!=null)
 	{
 		try{

             //Establish a connection
             String ConnectionUrl="jdbc:mysql://localhost:3306/";
             String DbName="statnory";
             String DbUserName="root";
             String DbPassword="";
             Connection con=DriverManager.getConnection(ConnectionUrl+DbName,DbUserName,DbPassword);
             //Check Connection is Established or not
             if(con!=null)
             {
             System.out.println("Connection Successfully Established");
             }
             else
             {
             System.out.println("Connection Not Established");
             }
             String sql="Select *  from tblproduct where product_Id="+id;
             Statement statement=con.createStatement();
             ResultSet resultSet=statement.executeQuery(sql);
            		
             if(resultSet!=null)
             {   
            	 if(resultSet.next()){
 				    product_Name=resultSet.getString("product_Name");
 				    product_Price=resultSet.getString("product_Price");
 				    product_Description=resultSet.getString("product_Description");
 				    product_Category=resultSet.getString("product_Category");
 				    System.out.println("product name" + product_Name);
 				   System.out.println("product price" + product_Price);
 				  System.out.println("product Description" + product_Description);
 				 System.out.println("product Category" + product_Category);
 				    System.out.println("pcate"+ product_Category);
            	 }
             	
             }
             else
             {
             	System.out.println("Invalid Details");
             }
             
 		}
 		catch(Exception e)
 		{
 			System.out.println(e);
 		}
 	}
   
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <script ></script>
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
       <link src="style.css">
</head>
<body>
 <nav class="navbar navbar-expand-lg  bg-dark">
       
              <div class="container-fluid">
                <a class="navbar-brand" href="#">Navbar</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                  <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    
                   
                  </ul>
                  <form class="d-flex" role="search">
                  
                    <button class="btn btn-outline-success" type="submit">Log Out</button>
                  </form>
                </div>
              </div>
            </nav>
    <h3> Update Details</h3>
     <form method="post" enctype="multipart/form-data">
            <table>
              <tr>
                <td>Product Name*</td>
                <td><input type="text" name="product_name" id="product_name" value="<%=product_Name%>" required></td>
                <td><label id="error1" ></label></td>
              </tr>
              <tr>
                <td>Product Price*</td>
                <td><input type="number" name="product_price" id="product_price" value="<%=product_Price%>" required></td>
                <td><label id="error2" ></label></td>

              </tr>
              <tr>
                <td>Product Description*</td>
                <td><input type="text" name="product_description" id="product_description" value="<%=product_Description%>" required></td>
                <td><label id="error3" ></label></td>

              </tr>
              <tr>
                <td>Product Category*</td>
                <td>
                  <select name="product_category" id="product_category">
                  <% 
                  		System.out.println(product_Category);
                  		if(product_Category.equals("Pen"))
                  		{
                  			System.out.println("PENS");
                  			out.println("<option value=\"Books\" Selected>Pen</option>");
                  			out.println("<option value=\"Books\" >Books</option>");
                  			
                  			out.println("<option value=\"Books\" >Other</option>");
                  		}
                  			

                  		
                  		if(product_Category.equals("Books"))
                  		{
			                  System.out.println("Hello world");
                  			out.println("<option value=\"Books\" >Pen</option>");
                  			out.println("<option value=\"Books\" Selected >Books</option>");
                  			out.println("<option value=\"Books\" >Other</option>");
                  			
                  		}
                  		
                  			
                  		
                  			
                  		if(product_Category.equals("Other"))
                  		{
                  			 System.out.println("Other world");
                  			out.println("<option value=\"Books\" >Pen</option>");
                  			out.println("<option value=\"Books\"  >Books</option>");
                  			out.println("<option value=\"Books\" Selected >Other</option>");
                  		}
                  		
                  			
                  		
                  %>
                   
                    
                    
                  </select>
                  </td>
                <td><label id="error4" ></label></td>

              </tr>
              
              <tr>
                <td></td>
                <td><input type="submit" name="submit" id="submit" value="Submit"></td>
              </tr>


            </table>

            </form>
            
            <script>
            $(document).ready(function(){
            	console.log();
            	
            	var productname=document.getElementById("product_name");
                var productprice=document.getElementById("product_price");
                var productdescription=document.getElementById("product_description");
                var price=document.getElementById("product_price");
                var productcategory=document.getElementById("product_category");
                var productimage=document.getElementById("product_image");
                var submit=document.getElementById("submit");
                var validproductname=false;
                var validproductprice = false;
                var validdescription=false;
                
                productname.addEventListener('focusout', () => {
                    
                    let regex=/^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$/;
                    var str = productname.value;
                    console.log(regex, str);
                    console.log(regex.test(str));
                    if (regex.test(str)) {
                        console.log('Your productname is valid');

                       
                        
    		      	
                   
                        validproductname = true;


                        document.getElementById("error1").style.display="none";

                      
                        document.getElementById("error1").innerHTML="";
                    }
                    else {
                        console.log('Your productname is not valid');
                        validproductname = false;

                        document.getElementById("error1").style.display="block";
                        document.getElementById("error1").style.color="red";

                      
                        document.getElementById("error1").innerHTML="Product Name is not Valid";
                        
                      

                    }
                   });
                   
                   
                 // prductprice event listner
                    productprice.addEventListener('focusout', () => {
                    console.log("Promocode is blurred");
                    let regex=/^\d+(,\d{1,2})?$/;
                    var str = productprice.value;
                    console.log(regex, str);
                    console.log(regex.test(str));
                    if (regex.test(str)) {
                        validproductprice = true;


                        document.getElementById("error2").style.display="none";

                      
                        document.getElementById("error2").innerHTML="";
                    }
                    else {
                        console.log('Your productprice is not valid');
                        validproductprice = false;

                        document.getElementById("error2").style.display="block";
                        document.getElementById("error2").style.color="red";

                      
                        document.getElementById("error2").innerHTML="Product price  is not Valid";
                        
                      

                    }
                   });

                    //prodyct Descritpiton
                    productdescription.addEventListener('focusout', () => {
                        console.log("Promocode is blurred");
                        let regex=/^[a-zA-Z0-9_.-]*$/;
                        var str = productdescription.value;
                       
                        if (str!=null&&str.length>=10) {
                            console.log('Your Your Description  is valid');

                           
                            
        		      	
                       
                            validdescription = true;


                            document.getElementById("error3").style.display="none";

                          
                            document.getElementById("error3").innerHTML="";
                        }
                        else {
                            console.log('Your Description is not valid');
                            validdescription = false;

                            document.getElementById("error3").style.display="block";
                            document.getElementById("error3").style.color="red";

                          
                            document.getElementById("error3").innerHTML="Description shoul not be less than 10 charater";
                            
                          

                        }
                       });
                    
                   
                    
                    
                    


                   

                    $(document).on("click", "#submit", function(e) {
                    	e.preventDefault();
                    	
                    	if(document.getElementById("product_category").selectedIndex==0)
                    	{
                    		var selectedv="Pen";
                    	}
                    	if(document.getElementById("product_category").selectedIndex==1)
                    	{
                    		var selectedv="Books";
                    	}
                    	if(document.getElementById("product_category").selectedIndex==2)
                    	{
                    		var selectedv="Other";
                    	}
                    	
                      let regex=/^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$/;
                      if(regex.test(productname.value))
                      {
                        validproductname=true;
                      }
                     regex=/^\d+(,\d{1,2})?$/;

                      if(regex.test(productprice.value))
                      {
                          validproductprice=true;
                      }
                       
                      regex=/^[a-zA-Z0-9_.-]*$/;


                      if(regex.test(productdescription.value))
                      {
                          validdescription=true;
                      }

                    	
                    	  console.log(validproductname, validproductprice, validdescription);
                    	  if (validproductname && validproductprice && validdescription ) {
                    	    var send_data = new FormData();
                    	    

                    	   
                    	    $.ajax({
                    	      url: "retrivedata.jsp",
                    	      type: "POST",
                    	      data: {
                    	        pagename: "index",
                    	        action: "edit",
                    	        productid:<%=request.getParameter("id")%>,
                    	        productname: productname.value,
                    	        productprice: productprice.value,
                    	        productdescription: productdescription.value,
                    	        productcategory: selectedv
                    	       
                    	      },
                            
                    	      success: function(data) {
                              //print data
                              console.log(data);
                    	    	  if(data.includes("Edit"))
                              {
                    	    		  if(confirm("Record Updated succesfully")) document.location.href = 'index.jsp';
                                
                                console.log("hello");
                                load_data();
                              }
                              else if(data.includes("Error"))
                              {
                                console.log("Error");
                              }
                    	      }
                    	    });
                    	  } else {
                    		  console.log(productname.value);
                    		  	  if(productname.value=="")
                    			  {
                    		  		 document.getElementById("error1").style.display="block";
                                     document.getElementById("error1").style.color="red";

                                   
                                     document.getElementById("error1").innerHTML="Product Name should not be null";
                                     
                                   console.log("null");
                    			  	
                    			  }
                    		  	  if(productprice.value=="")
                    		  		{
                    		  		 document.getElementById("error2").style.display="block";
                                     document.getElementById("error2").style.color="red";

                                   
                                     document.getElementById("error2").innerHTML="Product Price should not be null";
                                    
                    		  		}
                    		  	 if(productprice.value=="")
                 		  		{
                 		  		 document.getElementById("error3").style.display="block";
                                  document.getElementById("error3").style.color="red";

                                
                                  document.getElementById("error3").innerHTML="Product Description should not be null";
                                 
                 		  		}
                 		  		  
                    		  		  
                    	    console.log("Invalid Details");
                    	  }
                    	});
                
                
            	
            
            });
            
            
            </script>
</body>
</html>