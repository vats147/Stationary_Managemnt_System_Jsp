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

                   
<%-- Include Database Configuration File --%>


<%-- Include SHA-256 Library --%>
<%@ page import="java.security.MessageDigest" %>

   
     

<%-- Import Random function library --%>
<%@ page import="java.util.Random" %> 

<%@ page import="java.util.Scanner" %> 

<%--Import mail library and jar files --%>
<%@ page import="java.util.*"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page import="javax.activation.*"%>


<% 
Enumeration<String> paramNames = request.getParameterNames();
while(paramNames.hasMoreElements()) {
    String paramName = paramNames.nextElement();
    System.out.println(paramName + " = " + request.getParameter(paramName));
}
//String temp=request.getParameterValues();
//System.out.println(temp);
String Pagename=request.getParameter("pagename");
String Action=request.getParameter("action");
String res="";

System.out.println(Pagename);
System.out.println(Action);

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
              
              //Destorying the whole session
              //logout
              if(Action.equals("session-destory"))
              {
                     //Remain ---> <-- add clear code 
                     session.invalidate(); 
              }

              if(Pagename!=null&& Action!=null)
   	       {
                        //Register Page
                       if(Pagename.equals("signup")&&Action.equals("register"))
                        {
                            String username=request.getParameter("username");
                            String useremail=request.getParameter("useremail");
                            String password=request.getParameter("password");
                            String sql="insert into tbluser(`user_Name`,`user_Email`,`user_Password`) values('"+username+"','"+useremail+"','"+password+"')";
                            System.out.println(sql);
                            Statement statement=con.createStatement();
                        	int resultSet=statement.executeUpdate(sql);
                            if(resultSet>0)
                            {
                            		
                                   System.out.println("User");
                                   out.flush();
                                   out.println("Register");
                                   
                            }
                            else
                            {
                            	out.println("Error");
                                    out.flush();
                            }

                        
                        }
                        
                        //retrivedata table data
                        if(Pagename.equals("index")&&Action.equals("read"))
                        {
                               String sql="select * from tblproduct";
                               Statement statement=con.createStatement();
                               ResultSet resultSet=statement.executeQuery(sql);
                               if(resultSet!=null)
                               {      
                                      //open table tag and print Head Tag
                                      System.out.println("ska");
                                      out.print("<table id=\"table-data\" class=\"table table-striped\"><thead><tr><th scope=\"col\">Product_Name</th><th scope=\"col\">product_price</th><th scope=\"col\">Product_description</th><th scope=\"col\">product_category</th><th scope=\"col\">Edit</th><th scope=\"col\">Delete</th></tr></thead><tbody>");
                                      while(resultSet.next()){
                                             out.println("<tr><th scope=\"row\">"+resultSet.getString("product_Name")+"</th><td>"+resultSet.getString("product_Price")+"</td><td>"+resultSet.getString("product_Description")+"</td><td>"+resultSet.getString("product_Category")+"</td><td><a href=update.jsp?id="+resultSet.getString("product_Id")+"> Edit</a></td><td><a href=delete.jsp?id="+resultSet.getString("product_Id")+"> Delete</a></td></tr>");
                                             
                                      }
                                      //Close Open table tags

                                      out.println("</tbody></table>");
                                       out.flush();
                               }
                               else
                               {
                                      //resultset is null
                               }
                        } 
                        
                        if(Pagename.equals("index")&&Action.equals("insert"))
                        {
                        	//INSERT INTO `tblproduct`(`product_Id`, `product_Name`, `product_Price`, `product_Description`, `product_Category`, `product_Image`) VALUES ('[value-1]','[value-2]','[value-3]','[value-4]','[value-5]','[value-6]')
                            String product_Name=request.getParameter("productname");
                            String product_Price=request.getParameter("productprice");
                            String product_Description=request.getParameter("productdescription");
                            String product_Category=request.getParameter("productcategory");
                        	String sql="insert into tblproduct(`product_Name`,`product_Price`,`product_Description`,`product_Category`) values('"+product_Name+"',"+product_Price+",'"+product_Description+"','"+product_Category+"')";
                            System.out.println(sql);
                            Statement statement=con.createStatement();
                        	int resultSet=statement.executeUpdate(sql);
                            if(resultSet>0)
                            {
                                   System.out.println("Data inserted");
                                   out.println("Inserted");
                                    out.flush();
                            }
                            else
                            {
                            	out.println("Error");
                                    out.flush();
                            }
                            
                        }
                        if(Pagename.equals("index")&&Action.equals("edit"))
                        {
                        	String product_Id=request.getParameter("productid");
                        	 String product_Name=request.getParameter("productname");
                             String product_Price=request.getParameter("productprice");
                             String product_Description=request.getParameter("productdescription");
                             String product_Category=request.getParameter("productcategory");
                             //UPDATE `tblproduct` SET `product_Id`='[value-1]',`product_Name`='[value-2]',`product_Price`='[value-3]',`product_Description`='[value-4]',`product_Category`='[value-5]' WHERE 1
                         	 String sql="UPDATE `tblproduct` SET `product_Name`='"+product_Name+"',`product_Price`='"+product_Price+"',`product_Description`='"+product_Description+"',`product_Category`='"+product_Category+"' WHERE product_Id="+product_Id;
                             System.out.println(sql);
                             Statement statement=con.createStatement();
                         	int resultSet=statement.executeUpdate(sql);
                             if(resultSet>0)
                             {
                                    System.out.println("Data Updated");
                                    out.println("Edit");
                                     out.flush();
                             }
                             else
                             {
                             	out.println("Error");
                                    out.flush();
                             }
                        }
                        
                 }
       }
       catch(Exception e)
       {
              System.out.println(e);
       }

%>