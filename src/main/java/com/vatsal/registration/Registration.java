package com.vatsal.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.security.MessageDigest;
/**
 * Servlet implementation class Registration
 */
@WebServlet("/register")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uname=request.getParameter("name");
		String uemail=request.getParameter("email");
		String upwd=request.getParameter("pass");
		
		
		//requwst diaptecher
		RequestDispatcher dispatcher=null;
		
		System.out.println("hello world");
		
		PrintWriter out=response.getWriter();
		out.println(uname+ uemail + upwd);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/stationary?useSSL=false","root","root");
			PreparedStatement stmt;
			stmt=con.prepareStatement("select * from tbluser where userEmail=?");
			stmt.setString(1, uemail);
			ResultSet rs=stmt.executeQuery();
			if(rs.next())
			{
				dispatcher =request.getRequestDispatcher("registration.jsp");
				request.setAttribute("status", "already");
				dispatcher.forward(request, response);
			}
			else
			{
				
				
			
			
			stmt=con.prepareStatement("insert into tbluser(userName,userEmail,userPassword) VALUES(?,?,?)");
			stmt.setString(1,uname);
			stmt.setString(2,uemail);
			
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(upwd.getBytes());
			byte[] hash = md.digest();

			StringBuilder hexString = new StringBuilder();
			for (byte b : hash) {
				String hex = Integer.toHexString(0xff & b);
				if (hex.length() == 1) hexString.append('0');
				hexString.append(hex);
			}

			String encryptedPassword = hexString.toString();
			
			System.out.println("Encrypted password: " + encryptedPassword);
			
			stmt.setString(3,encryptedPassword);
			
			
			int rowcount=stmt.executeUpdate();
			dispatcher =request.getRequestDispatcher("registration.jsp");
			if(rowcount>0)
			{
				request.setAttribute("status", "success");
				
			}
			else
			{
				System.out.println("Failed");
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
	}

}
