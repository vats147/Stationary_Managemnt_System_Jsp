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
<!DOCTYPE html>
<html lang="en">
<head>
       <meta charset="UTF-8">
       <meta http-equiv="X-UA-Compatible" content="IE=edge">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <script ></script>
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
       <link src="style.css">
       <title>Document</title>
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
                  
                    <button class="btn btn-outline-success" type="submit"><a href="logout.jsp"> Log Out </a></button>
                  </form>
                </div>
              </div>
            </nav>

<div class="alert alert-success" role="alert" id="alert" style="display:none;">
  
</div>
            <h2>Product Detail form</h2>
            <form  method="post" enctype="multipart/form-data">
            <table>
              <tr>
                <td>Product Name*</td>
                <td><input type="text" name="product_name" id="product_name" required></td>
                <td><label id="error1" ></label></td>
              </tr>
              <tr>
                <td>Product Price*</td>
                <td><input type="number" name="product_price" id="product_price" required></td>
                <td><label id="error2" ></label></td>

              </tr>
              <tr>
                <td>Product Description*</td>
                <td><textarea type="text" name="product_description" id="product_description" col="5" row="10"></textarea>
                </td>
                <td><label id="error3" ></label></td>

              </tr>
              <tr>
                <td>Product Category*</td>
                <td>
                  <select name="product_category" id="product_category">
                    <option value="pen">pen</option>
                    <option value="Books">Books</option>
                    <option value="Other">Other</option>
                    
                  </select>
                  </td>
                <td><label id="error4" ></label></td>

              </tr>
             
              <tr>
                <td></td>
                <td><input type="button" name="submit" id="submit" value="submit"></td>
              </tr>


            </table>

            </form>
            
            <hr>
            <h3>Retrive Data</h3>
            
            <table id="table-data" class="table table-striped">
            	
            </table>

            <script>
             $(document).ready(function(){
            	 
            	 function load_data()
            	 {
            		
            		 $.ajax({
            			url:"retrivedata.jsp",
            			type:"POST",
            			data:{
            				pagename:"index",
            				action:"read"
            			},success:function(data)
            			{
                       $("#table-data").html(data);
            			}
            		 });
            	 }
            	 load_data();

                var productname=document.getElementById("product_name");
                var productprice=document.getElementById("product_price");
                var productdescription=document.getElementById("product_description");
                var price=document.getElementById("product_price");
                var productcategory=document.getElementById("product_category");
              
                var submit=document.getElementById("submit");
                var validproductname=false;
                var validproductprice = false;
                var validdescription=false;
                var validcategory=false;
               


				//                
               
               //productname validation
             

               

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
                
               
                
                
                


               

                $(document).on("click", "#submit", function() {
                	  console.log(validproductname, validproductprice, validdescription);
                	  if (validproductname && validproductprice && validdescription ) {
                	    var send_data = new FormData();
                	    

                	   
                	    $.ajax({
                	      url: "retrivedata.jsp",
                	      type: "POST",
                	      data: {
                	        pagename: "index",
                	        action: "insert",
                	        productname: productname.value,
                	        productprice: productprice.value,
                	        productdescription: productdescription.value,
                	        productcategory: productcategory.value
                	       
                	      },
                        
                	      success: function(data) {
                          //print data
                          console.log(data);
                	    	  if(data.includes("Inserted"))
                          {
                            document.getElementById("alert").style.display="block";
                            document.getElementById("alert").innerHTML="Data inserted successfully";
                            console.log("Inserted");
                            let timerID = setTimeout(() => {
                            	document.getElementById("alert").style.display="none";
                            	document.getElementById("alert").innerHTML="";
                            	}, 3000);
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