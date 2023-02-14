<%-- 
    Document   : home
    Created on : 21-Jan-2023, 8:28:49 pm
    Author     : phane
--%>
<% 
    if(session.getAttribute("user_email")==null){
    response.sendRedirect("adminLogin.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        
         <%@include file="Header.jsp" %>
        
        <form action="Logout" method="get">
        <h2>Hello 
            <%=request.getParameter("user_email")%>
        </h2>
        
        <br><input type="submit" value="logout"/>
            </form>
        <%@include file="footer.jsp" %>
        
    </body>
</html>
