
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <title>Delete Admin</title>
    </head>
    <body>
        <div>
            <%@include file="Header.jsp"%>
        </div>
        <% 
            String msg = request.getParameter("message");
            if(msg==null){
                msg ="";
            }
        %>
        <center>
            <h1>Delete Admin</h1>
            <h4 style="color:red"><%= msg%></h4>
            <form action="DeleteAdminController" method="post">
                <pre>
                 Admin name: <input type='text' name="name">   
                </pre> 
                <pre>
                <input type="submit" value="Delete"/>
                </pre>
                </form>
            </center>
        <div>
            <%@include file="footer.jsp"%>
        </div>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html>
