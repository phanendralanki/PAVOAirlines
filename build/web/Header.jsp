<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>

        <style>
            .title{
                text-align: center;
                font-size:85px;
                font-family: cataneo Bt;
                padding:10px;
            }

            ul {
                background-color: black;
                overflow:hidden;
                list-style-type:none;
                margin:0;
                padding:0;
            }
            li{
                float:left;
            }

            li a{
                color:white;
                display:block;
                padding:14px 18px; /*Height and width */
                text-decoration: none;
            }
            li a:hover{
                background-color:yellow;
            }
        </style>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        <div class="header">
            <div class="title bg-primary">
                Main Admin
            </div>

            <div class="menu">
                <ul>
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="addAdmin.jsp">Add Admin</a></li>
                    <li><a href="./ViewAllAdminsController">view All Admins</a></li><!--  -->
                    <li><a href="./deleteAdmin.jsp">Delete Admin</a></li> 
                    <li><a href="./update_Admin.jsp">Update Admin</a></li>

                </ul>
            </div>
        </div> 
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    </body>
</html>
