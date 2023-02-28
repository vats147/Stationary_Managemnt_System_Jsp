package com.vatsal.registration;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uemail=request.getParameter("email");
		String upwd=request.getParameter("password");
		String remeber=request.getParameter("remember");
		
		if(remeber!=null)
		{
			Cookie username = new Cookie("username", request.getParameter("email"));
			   Cookie password = new Cookie("password", request.getParameter("password"));
			   
			   // Set expiry date after 24 Hrs for both the cookies.
			   username.setMaxAge(60*60*24); 
			   password.setMaxAge(60*60*24); 
			   
			   // Add both the cookies in the response header.
			   response.addCookie( username );
			   response.addCookie( password );
			  
		}
		jakarta.servlet.http.HttpSession session=request.getSession();
		RequestDispatcher dispatcher=null;
		
		if(uemail==null||uemail.equals("")&&upwd==null||upwd.equals(""))
		{
			request.setAttribute("status", "invalidBoth");
			dispatcher =request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		if(uemail==null||uemail.equals(""))
		{
			request.setAttribute("status", "invalidEmail");
			dispatcher =request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		
		if(upwd==null||upwd.equals(""))
		{
			request.setAttribute("status", "invalidUpwd");
			dispatcher =request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/stationary?useSSL=false","root","root");
			PreparedStatement stmt=con.prepareStatement("select * from tbluser where userEmail=? and userPassword=?");
			stmt.setString(1,uemail);
			
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
			
			stmt.setString(2,encryptedPassword);
			System.out.println(stmt);
			ResultSet rs=stmt.executeQuery();
			if(rs.next())
			{
				 
				System.out.println(rs.getString("userId"));
				session.setAttribute("userId",rs.getString("userId"));
				System.out.println("Record found");
				request.setAttribute("status", "success");
				dispatcher =request.getRequestDispatcher("index.jsp");
			}
			else
			{
				System.out.println("Record Not found");
				request.setAttribute("status", "failed");
				dispatcher =request.getRequestDispatcher("login.jsp");
			}
			dispatcher.forward(request, response);
		}
		catch(Exception e)
		{
			
		}
	
		
	}

}
