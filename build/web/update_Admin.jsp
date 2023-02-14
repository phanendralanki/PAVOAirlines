<% 
    if(session.getAttribute("user_email")==null){
    response.sendRedirect("adminLogin.jsp");
    }
%>

<%@page import="com.dto.AdminDto"%>
<%@page language ="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Admin</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        
        <% 
            AdminDto dto = (AdminDto)request.getAttribute("dto");
            System.out.println(dto);
            if(dto == null){
                  dto  = new AdminDto();
                  dto.setName("");
                  dto.setEmail("");
                  dto.setMobile("");
                  dto.setPassword("");
                  dto.setRole("");
            }
            
String msg = request.getParameter("msg");
if(msg == null){
msg = "";
            }
        %>
        <div>
            <%@include file="Header.jsp"%>
        </div>
        
        <div>
            <center>
                <div class="search">
                <h1>Update Admin</h1>
                <h4 style="color:red"></h4>
                <form action="./SearchAdminController" method="post">
                    <pre>
                    Admin Name: <input type="text" name="name">
                    </pre> 
                    <pre>
                    <input type="submit" value="Search">
                    </pre> 
                    </form>
                </div>
                <div> 
                    <h4 style="color:red"><%=msg%></h4>
                     <form action="./UpdateAdminController" method="post">
            <table>
                
                
                <tr><td>Admin Name: </td><td><input type="text" name="name"  value="<%=dto.getName()%>"><span id="nameMsg"></span></td></tr>
                <tr><td>Admin Email:</td><td><input type="email" name="email" value="<%=dto.getEmail()%>"><span id="emailMsg"></span></td></tr><!-- comment -->
                <tr><td>Admin Mobile:</td><td><input type="text" name="mobile" value="<%=dto.getMobile()%>"><span id="mobileMsg"></span></td></tr> 
                <tr><td>Admin password: </td><td><input type="text" name="password" value="<%=dto.getPassword()%>"><span id="passwordMsg"></span></td></tr> 
                <tr><td>Admin Role: </td><td><input type="text" name="role" value="<%=dto.getRole()%>"><span id="roleMsg"></span></td></tr>
                <tr><td><input type="submit" value="Update"/></td><td><input type="reset" value="reset"></td></tr>
            </table>
        </form>
                </div>
            </center>
        </div>
        
        <div>
            <%@include file="footer.jsp"%>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html>
