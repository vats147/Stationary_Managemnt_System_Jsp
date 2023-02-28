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
            String sql="delete  from tblproduct where product_Id="+id;
            Statement statement=con.createStatement();
            int resultSet=statement.executeUpdate(sql);
            System.out.println(resultSet);
            if(resultSet>0)
            {   
				          System.out.println("Deleted Successfully");  	
            	        out.println("Record Deleted Successfully");
            	       %>
            	       <script>
            	       if(confirm("Record Deletd succesfully")) document.location.href = 'index.jsp';
            	       </script>
            	       <%
            	     //   response.sendRedirect("index.jsp");
            	        
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