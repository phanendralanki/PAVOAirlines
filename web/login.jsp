<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
    <link href="MyCode/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="MyCode/MyStyles/errorStyles.css" rel="stylesheet" type="text/css"/>
<style>
        *{
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    outline: none;
}

body{
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #607680;
    min-height: 100vh;
    margin: 0;
}

.container{
    background-color: white;
    border-radius: 5px;
    width: 400px;
    max-width: 100%;
    overflow: hidden;
}
.header{
    background-color: #f7f7f7;
    padding: 20px 40px;
    border-bottom: 1px solid #f0f0f0;
}

.header h2{
    margin: 0;
}

.form{
    padding: 30px 40px;
}

.field{
    margin-bottom: 10px;
    padding-bottom: 20px;
    position: relative;
}
.field label{
    display: inline-block;
    margin-bottom: 5px;
}

.field input:not(.terms){
    display: block;
    border-radius: 4px;
    border:2px solid #f0f0f0;
    font-size: 14px;
    width: 100%;
    padding: 10px;

}


.field span{
    position: absolute;
    top:30px;
    right: 10px;
    visibility: hidden;
}

.field small{
    position: absolute;
    bottom: 0px;
    left: 0;
    visibility: hidden;
}
.form .button{
    background-color: rgb(90, 104, 235);
    border: 2px solid rgb(90, 104, 235);
    color: white;
    padding: 10px;
    display: block;
    width: 100%;
    font-size: 16px;
    cursor: pointer;
}

/* if success */
.field.success input{
    border-color: #2ecc71;
}

  /*error*/
.error{
        color:red;
}
.c1{
        border:2px red ridge;
 }
</style>
</head>
    <body>
        <div class="container">
        <div class="header">
            <h2>Login Here</h2>
        </div>
             
             <form action="LoginServlet" class="form" id="logForm"  name="form" method="post">
              <div class="field">
                <label for="email">Email</label>
                <input type="email" name="user_email" id="email" placeholder="Email@gmail.com"><br>
                
            </div>
              <div class="field">
                <label for="password">Password</label>
                <input type="password" name="user_password" id="password" placeholder="Enter your password"><br>
                
            </div>
                  <div class="loginform">
                <a href="register.jsp">If you don't have an account</a> 
            </div>
                 <br>
                 <div class="change">
                     <a href="forgotPassword.jsp">Forget Password?</a>
                 </div> <br>
                 <div class="field">
                <input type="submit" value="submit" class="button">
            </div>
           
             </form>
     </div>
    <script src="MyCode/jquery.js" type="text/javascript"></script>
    <script src="MyCode/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="MyCode/jquery-validation-1.19.5/dist/jquery.validate.min.js" type="text/javascript"></script>
     <script src="MyCode/jquery-validation-1.19.5/dist/additional-methods.min.js" type="text/javascript"></script>


     <script>
        $(document).ready(function(){
           
           $("#logForm").validate({
              rules:{
                  user_email:{
                      required:true,
                      email:true
                  },
                  user_password:{
                      required:true
                      
                  }
              },
              highlight: function (element){
                  $(element).addClass("c1");
              },
              unhighlight: function (element){
                  $(element).removeClass("c1");
              }
              
           });
        });
    </script>
    </body>
</html>
