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
        <title>Add Admin</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        
        <script type="text/javascript">
            function doValidate(){
//                alert("hi");
            var name = document.forms["admin_form"]["name"].value;
//            alert("Hi"+name);
            var email = document.forms["admin_form"]["email"].value;
            var mobile = document.forms["admin_form"]["mobile"].value;
            var password = document.forms["admin_form"]["password"].value;
            var role = document.forms["admin_form"]["role"].value;
            
//            alert("Hi"+name + email+ mobile+ password+ role);
            var nameStatus;
            var emailStatus;
            var mobileStatus;
            var passwordStatus;
            var roleStatus;
            
            var nameMsg;
            var emailMsg;
            var mobileMsg;
            var passwordMsg;
            var roleMsg;
            
//            if(name !=="" || email !== "" ||mobile !== "" || password !== "" || role !== ""){
//                return true;
//            }
//            else{

            if(document.getElementById("nameMsg").innerHTML !== ""){
                document.getElementById("nameMsg").innerHTML = "";
            }
             if(document.getElementById("emailMsg").innerHTML !== ""){
                document.getElementById("emailMsg").innerHTML = "";
            }
             if(document.getElementById("mobileMsg").innerHTML !== ""){
                document.getElementById("mobileMsg").innerHTML = "";
            }
             if(document.getElementById("passwordMsg").innerHTML !== ""){
                document.getElementById("passwordMsg").innerHTML = "";
            }
             if(document.getElementById("roleMsg").innerHTML !== ""){
                document.getElementById("roleMsg").innerHTML = "";
            }
                if(name === ""){
                    nameStatus= false;
                    nameMsg = "*name should not be empty ";
                    var spanEle = document.getElementById("nameMsg");
                    spanEle.style.color = "red";
                    spanEle.innerHTML = nameMsg;
                    //document.getElementById("nameMsg").innerHTML = nameMsg;
                }
                if(email === ""){
                    emailStatus= false;
                    emailMsg = "*email should not be empty";
                     var spanEle = document.getElementById("emailMsg");
                    spanEle.style.color = "red";
                    spanEle.innerHTML = emailMsg;
                     //document.getElementById("emailMsg").innerHTML = emailMsg;
                }
                
                if(mobile === ""){
                    mobileStatus= false;
                    mobileMsg = "*mobile should not be empty";
                     var spanEle = document.getElementById("mobileMsg");
                    spanEle.style.color = "red";
                    spanEle.innerHTML = mobileMsg;
                     //document.getElementById("mobileMsg").innerHTML = mobileMsg;
                }
                
                if(password === ""){
                    passwordStatus= false;
                    passwordMsg = "*password should not be empty";
                     var spanEle = document.getElementById("passwordMsg");
                    spanEle.style.color = "red";
                    spanEle.innerHTML = passwordMsg;
                    // document.getElementById("passwordMsg").innerHTML = passwordMsg;
                }
                
                if(role === ""){
                    roleStatus= false;
                    roleMsg = "*role should not be empty";
                     var spanEle = document.getElementById("roleMsg");
                    spanEle.style.color = "red";
                    spanEle.innerHTML = roleMsg;
                     //document.getElementById("roleMsg").innerHTML = roleMsg;
                }
                
                if(nameStatus === false || emailStatus === false || mobileStatus === false || passwordStatus === false || roleStatus === false  ){
                 return false;
            }
            
            }
            
            
           
//            }
            </script>
            <%
                String msg = (String)request.getAttribute("msg");
                if(msg==null){
                    msg = "";
                }
            %>
    </head>
    <body>
        
        <div>
            <%@include file="Header.jsp"%>
        </div>
<div>
    <center>
        <h1>Add Admin</h1>
        <h4 style="color:red"><%=  msg %></h4>
        <form action="./AddAdminController" method="post" onsubmit="return doValidate()" name="admin_form">
            <table>
                <tr><td>Admin Name: </td><td><input type="text" name="name"><span id="nameMsg"></span></td></tr>
                <tr><td>Admin Email:</td><td><input type="email" name="email" placeholder="Enter your email"><span id="emailMsg"></span></td></tr><!-- comment -->
                <tr><td>Admin Mobile:</td><td><input type="text" name="mobile"><span id="mobileMsg"></span></td></tr> 
                <tr><td>Admin password: </td><td><input type="password" name="password"><span id="passwordMsg"></span></td></tr> 
                <tr><td>Admin Role: </td><td><input type="text" name="role"><span id="roleMsg"></span></td></tr>
                <tr><td><input type="submit" value="Add Admin"/></td><td><input type="reset" value="reset"></td></tr>
            </table>
        </form>
        </center>
    </div>
        <div>
            <%@include file="footer.jsp"%>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html>
