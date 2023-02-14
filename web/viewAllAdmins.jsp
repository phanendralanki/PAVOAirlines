<% 
    if(session.getAttribute("user_email")==null){
    response.sendRedirect("adminLogin.jsp");
    }
%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.AdminDto"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view All Admins</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        <% 
        List<AdminDto> list = (ArrayList<AdminDto>)request.getAttribute("list");
        %>
        <div>
            <%@include file="Header.jsp"%>
        </div>

        <div>
            <center>
                <h1>All Admins</h1>
                <table border='1px' class="table table-bordered">
                    <thead>
                        <tr><td>Name</td><td>Email</td><td>mobile</td><td>password</td><td>role</td></tr>
                    </thead>

                    <%
            
                    for(AdminDto d : list){%>

                    <tr><td><%=d.getName()%></td><td><%=d.getEmail()%></td><td><%=d.getMobile() %></td><td><%=d.getPassword() %></td><td><%=d.getRole() %></td></tr>
                    <%}
                    %>
                </table>
            </center>
        </div>
        <div>
            <%@include file="footer.jsp"%>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    </body>
</html>
