<!DocType html>
<html>

<head>
       

 <% //In case, if User session is not set, redirect to Login page.
   response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //HTTP 1.1
            
              response.setHeader("Pragma","no-cache"); //HTTP 1.0
            
              response.setHeader("Expires","0"); //Proxies
  if((request.getSession(false).getAttribute("Admin")== null) )
  {
    %>
    <jsp:forward page="adminLogin.jsp"></jsp:forward>
    <%} %>
 
</head>



<body>
    <h3>Hello AirIndia</h3>
<a href="AdminLogoutServlet"><button>Logout</button></a>
</body>

</html>