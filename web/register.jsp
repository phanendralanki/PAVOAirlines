<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Registration</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
              rel="stylesheet">
        
        <link href="MyCode/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
           <link href="MyCode/MyStyles/errorStyles.css" rel="stylesheet" type="text/css"/>
        
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                outline: none;
            }

            body {
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #607680;
                min-height: 100vh;
                margin: 0;
            }

            .container {
                background-color: white;
                border-radius: 5px;
                width: 400px;
                max-width: 100%;
                overflow: hidden;
            }

            .header {
                background-color: #f7f7f7;
                padding: 20px 40px;
                border-bottom: 1px solid #f0f0f0;
            }

            .header h2 {
                margin: 0;
            }

            .form {
                padding: 30px 40px;
            }

            .field {
                margin-bottom: 10px;
                padding-bottom: 20px;
                position: relative;
            }

            .field label {
                display: inline-block;
                margin-bottom: 5px;
            }

            .field input:not(.terms) {
                display: block;
                border-radius: 4px;
                border: 2px solid #f0f0f0;
                font-size: 14px;
                width: 100%;
                padding: 10px;
            }

            .field span {
                position: absolute;
                top: 30px;
                right: 10px;
                visibility: hidden;
            }

            .field small {
                position: absolute;
                bottom: 0px;
                left: 0;
                visibility: hidden;
            }

            .form .button {
                background-color: rgb(90, 104, 235);
                border: 2px solid rgb(90, 104, 235);
                color: white;
                padding: 10px;
                display: block;
                width: 100%;
                font-size: 16px;
                cursor: pointer;
            }

            .c1{
        border:2px red ridge;
    }
        
            
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h2>Register Here</h2>
            </div>
            <form action="RegisterServlet" class="form" id="reg-form" method="post">
                <div class="field">
                    <label>Username</label> 
                    <input type="text" placeholder="xyz" id="uname" name="user_name" autocomplete="off"> 
                   
                </div>
                <div class="field ">
                    <label>Email</label> 
                    <input type="email" placeholder="abc@gmail.com" id="user_email" name="user_email" autocomplete="off"> 
                   <span class="red-text" id="use"></span>
                </div>

                <div class="field ">
                    <label>Mobile Number:</label> 
                    <input type="text" placeholder="9800567" id="mobile" name="mobile" autocomplete="off"> 
                    
                </div>

                <div class="field">
                    <label>Password</label>
                     <input type="password" placeholder="password" id="password" name="user_password">
                    
                </div>
                <div class="field">
                    <label>Confirm Password</label> 
                    <input type="password" placeholder="password" id="cpassword" name="cpassword">
                    
                </div>
                <div class="field">
                    <input type="checkbox" id="tc" class="terms" name="tc"> 
                    <label>agree to terms and conditions</label> 
                   <label for="tc" style="display:none;" class="error"></label>
                </div>

                <button type="submit" class="button">SUBMIT</button>
                <br/>
                <a href="login.jsp" class="link-success">If you are already registered</a>
            </form>
        </div>
<script src="MyCode/jquery.js" type="text/javascript"></script>
<script src="MyCode/js/bootstrap.min.js" type="text/javascript"></script>
<script src="component/component/jquery/jquery.min.js" type="text/javascript"></script>

<script src="MyCode/jquery-validation-1.19.5/dist/jquery.validate.min.js" type="text/javascript"></script>
<script src="MyCode/jquery-validation-1.19.5/dist/additional-methods.min.js" type="text/javascript"></script>


        <script>
            $(document).ready(function(){
                   
                   $.validator.addMethod("strongPassword",function(value){
                       return /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/.test(value);
                   },"Password must contain uppercase,lowercase and symbol");
                   
                   $("#reg-form").validate({
                       rules:{
                           user_name:{
                               required:true,
                               minlength:5
                           },
                           user_email:{
                               required:true
                               
                               
                           },
                           mobile:{
                               required:true,
                               minlength:10
                           },
                           user_password:{
                               required:true,
                               strongPassword:true
                           },
                           cpassword:{
                               required:true,
                               equalTo:"#password"
                           },
                           tc:{
                               required:true
                           }
                              
                           
                       },
                       highlight:function (element){
                           $(element).addClass("c1");
                       },
                       unhiglight:function (element){
                         $(element).removeClass("c1");  
                       },
                        messages:{
                           user_name:{
                               required:"Name is mandatory",
                               minlength:"please enter at least 5 characters"
                           },
                           user_email:{
                               required:"email is required",
                               email:"please enter a valid email address"
                           },
                           mobile:{
                               required:"Please Provide your contact",
                               minlength:"Enter 10 numbers"
                           },
                           user_password:{
                               required:"password is mandatory"
                               
                           },
                           cpassword:{
                               required:"password is mandatory",
                               equalTo:'both password must match'
                                      
                           }
                              
                           
                       }
                       
                   });
            });

        </script>

<!--        <script>
            $(document).ready(function(){
               $('#user_email').change(function(){
                   var user_email = $("#user_email").val();
                   $.ajax({
                      type:'POST',
                      data:{user_email:user_email},
                      url:'UserEmailChecking',
                      success: function(use){
                          $('#use').html(use);
                      }
                      
                   });
               }) ;
            });
        </script>-->
       
    </body>
</html>