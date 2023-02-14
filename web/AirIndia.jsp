<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"  %>
<!DocType html>
<html>

<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  


          <% //In case, if User session is not set, redirect to Login page.
   response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //HTTP 1.1
            
              response.setHeader("Pragma","no-cache"); //HTTP 1.0
            
              response.setHeader("Expires","0"); //Proxies
           
              if(request.getAttribute("user_email")==null){
                
              
              %>
             <jsp:forward page="adminLogin.jsp"></jsp:forward>

              <%}%>
</head>



<body>
    
    <br/>
     Welcome 
<% 
    String AirIndia = (String)session.getAttribute("AIRINDIA");
    String British = (String)session.getAttribute("British");
    String Emirates = (String)session.getAttribute("Emirates");
    String Quatar  = (String)session.getAttribute("Quatar");
%>
     
 

<% if((AirIndia == null)&&(British == null)&&(Emirates == null)&&(Quatar == null)){%>
     <h1>Not working</h1>
<%} else{ %>
    <% out.println("<h1>You are an admin</h1>");%>
<% }%>

<% if(AirIndia!=null){%>
    <h1>you are an Air India Admin</h1>
<% }%>
 
<% if(British!=null){%>
    <h1>you are an British Admin</h1>
<% }%>
 
<% if(Emirates!=null){%>
    <h1>you are an Emirates Admin</h1>
<% }%>
 
<% if(Quatar!=null){%>
   <h1> you are an Quatar Admin</h1>
<% }%>
 


<br/>

<div class="row">
            <div class="col-sm-4">
                <!--form-->
                <form action="#" method="POST" class="">

                    <div align="left">
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student Name" name="name" id="name" required /> 
                    </div>

                    <div align="left">
                        <label class="form-label">course</label>
                        <input type="text" class="form-control" placeholder="course" name="course" id="course" required />
                    </div>

                    <div align="left">
                        <label class="form-label">fee</label>
                        <input type="text" class="form-control" placeholder="fee" name="fee" id="fee" required />
                    </div>
                    <br/>
                    <div align="right">
                        <input type="button" id="add" value="add" name="add" class="btn btn-info">
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">

                    </div>

                </form>
            </div>
</div>

<%
if(request.getParameter("add")!=null){
        String name = request.getParameter("name");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");
        
        Connection con;
       // PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspcrud","root","user");
        if(AirIndia!=null){
        PreparedStatement pst = con.prepareStatement("insert into data(name,course,fee) values(?,?,?)");
    
        pst.setString(1,name);
        pst.setString(2,course);
        pst.setString(3,fee);
        
        pst.executeUpdate();
    }
%>

<script>
    alert("record added");
</script>


<%}else{ %> 
    <script>
    alert("record can't be added");
    </script>
<%}%>    


<br/><br/>              
<a href="AdminLogoutServlet"><button>Logout</button></a>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>

</html>