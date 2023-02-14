<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>welcome page</title>
    </head>
    <body>
        
        <% 
            response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //HTTP 1.1
            
            response.setHeader("Pragma","no-cache"); //HTTP 1.0
            
            response.setHeader("Expires","0"); //Proxies
            
            
            if(session.getAttribute("user_email") == null){
            response.sendRedirect("login.jsp");
            }
        %>
        
      
          <h3 style="text-align: center">You are successfully logged in ${user_email}</h3>
          
          <a href="another.jsp">Another page</a>
          
          <!--Logout-->
          
          <form action="LogoutServlet">
              <input type="submit" value="logout">
          </form>
          
    </body>
</html>
