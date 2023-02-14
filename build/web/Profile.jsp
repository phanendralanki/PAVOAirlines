<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <body>
        <% 
            HttpSession session = request.getSession(false);
            if(session!= null){
            String user_email = (String)session.getAttribute("user_email");
            out.println("Hello",+name+"Welcome to profile");
           
            }
            else{
                out.print("Please login first");  
            request.getRequestDispatcher("login.jsp").include(request, response);
            }
        %>
    </body>
</html>
