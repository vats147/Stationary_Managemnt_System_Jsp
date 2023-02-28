

       
 <%
  session = request.getSession(false);
 response.setHeader("Cache-Control","no-cache"); 
 response.setHeader("Cache-Control","no-store"); 
 response.setDateHeader("Expires", 0); 
 response.setHeader("Pragma","no-cache"); 
 if(session != null)
     session.invalidate();
 request.getRequestDispatcher("/login.jsp").forward(request,response);
 %>

