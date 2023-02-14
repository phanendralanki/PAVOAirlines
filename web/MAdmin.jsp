<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Main Admin</title>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script><!-- comment -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <!--Data Tables-->
    <link rel="stylesheet" href="//cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css">

    <% //In case, if User session is not set, redirect to Login page.
   response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //HTTP 1.1
            
              response.setHeader("Pragma","no-cache"); //HTTP 1.0
            
              response.setHeader("Expires","0"); //Proxies
  if((request.getSession(false).getAttribute("Admin")== null) )
  {
    %>
    <jsp:forward page="adminLogin.jsp"></jsp:forward>
    <%} %>


<style>
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
<nav class="navbar navbar-dark bg-primary">
    <h2 style="color:white;">Main Admin</h2>
</nav>


<div class="row mt-3">
    <div class="col-sm-4">
        <!--form-->
        <div class="container">
            <form id="adminForm" name="adminForm" action="add_admin.jsp">
                <div class="form-group"> 
                    <label>Admin Name: </label>
                    <input type="text" name="name" id="name" class="form-control" placeholder="Admin Name" size="30px" required auto-complete="off"/>
                </div>

                <div class="form-group"> 
                    <label>Email: </label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="Admin12@gmail.com" size="30px" required auto-complete="off"/>
                </div> 

                <div class="form-group"> 
                    <label>Mobile </label>
                    <input type="number" name="mobile" id="mobile" class="form-control" placeholder="9804546789" size="30px" required auto-complete="off"/>
                </div> 

                <div class="form-group"> 
                    <label>password: </label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="password" size="30px" required/>
                </div>  

                <div class="form-group"> 
                    <label>Role: </label>
                    <input type="text" name="role" id="role" class="form-control" placeholder="Admin role" size="30px" required auto-complete="off"/>
                </div>

                <div class="form-group mt-3" align="right"> 
                    <button type="button" class="btn btn-info" onclick="addAdmin()">Add</button>
                    <button type="button" class="btn btn-warning" onclick="reSet()">Reset</button>
                </div>


            </form>
        </div>

    </div>

    <div class="col-sm-8">
        <!--table-->
        <div class="panel-body">
            <table id="tbl-admin" class="table table-bordered" cellpadding="0" cellspacing="0" width="100%">

                <thead>
                    <tr>
                        <th></th>
                        <th></th><!-- comment -->
                        <th></th> 
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>

            </table>
        </div>
    </div>

    Welcome <%=request.getAttribute("user_email") %>

    <br/>
    <br/>

    <a href="AdminLogoutServlet"><button class="btn btn-danger">Logout</button></a>
</div>

<script src="component/component/jquery/jquery.js" type="text/javascript"></script>
<script src="component/component/jquery/jquery.min.js" type="text/javascript"></script>
<script src="component/component/jquery.validate.min.js" type="text/javascript"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!--Data tables-->
<script src="//cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js" type="text/javascript"></script>


<script src="MyCode/js/bootstrap.min.js" type="text/javascript"></script>

<script src="MyCode/jquery-validation-1.19.5/dist/additional-methods.min.js" type="text/javascript"></script>

<script>

                        getAll();

                        var isNew = true;

                        var adminid = null;

                        function addAdmin()
                        {

                            if ($("#adminForm").valid())
                            {
                                var url = "";
                                var data = "";
                                var method;

                                if (isNew === true)
                                {
                                    url = 'add_admin.jsp';
                                    data = $('#adminForm').serialize();
                                    method = 'POST';
                                } else {
                                    url = 'updateAdmin.jsp';
                                    data = $('#adminForm').serialize() + "&adminid=" + adminid;
                                    method = 'POST';

                                }


                                $.ajax({

                                    type: method,
                                    url: url,
                                    dataType: 'JSON',
                                    data: data,

                                    success: function (data)
                                    {
                                        getAll();

                                        $('#name').val("");
                                        $('#email').val("");
                                        $('#mobile').val("");
                                        $('#password').val("");
                                        $('#role').val("");

                                        if (isNew === true) {
                                            alert("added");
                                        } else {
                                            alert("record updated");
                                        }
                                    }
                                });

                            }
                        }

                        //To get all the details 
                        function getAll() {
//                alert("Hii");

                            $("#tbl-admin").dataTable().fnDestroy();

                            $.ajax({
                                url: "allAdmins.jsp",
                                type: "GET",
                                dataType: "JSON",

                                success: function (data)
                                {
                                    $("#tbl-admin").dataTable({
                                        "aaData": data,
                                        "scrollX": true,
                                        "aoColumns":
                                                [
                                                    {"sTitle": "admin name", "mData": "name"},
                                                    {"sTitle": "email", "mData": "email"},
                                                    {"sTitle": "mobile", "mData": "mobile"},
                                                    {"sTitle": "password", "mData": "password"},
                                                    {"sTitle": "role", "mData": "role"},

                                                    {
                                                        "sTitle":
                                                                "Edit",
                                                        "mData": "id",

                                                        "render": function (mData, type, row, meta)
                                                        {
                                                            return '<button class="btn btn-success" onclick="get_details(' + mData + ')">Edit</button>';

                                                        }
                                                    },

                                                    {
                                                        "sTitle":
                                                                "Delete",
                                                        "mData": "id",

                                                        "render": function (mData, type, row, meta)
                                                        {
                                                            return '<button class="btn btn-danger" onclick="get_delete(' + mData + ')">Delete</button>';

                                                        }
                                                    }
                                                ]
                                    });
                                }
                            });
                        }




                        function get_details(id) {
                            $.ajax({
                                type: "POST",
                                url: "editAdmin.jsp",
                                data: {"id": id},

                                success: function (data)
                                {
                                    isNew = false;

                                    var obj = JSON.parse(data);

                                    adminid = obj[0].id;

                                    $('#name').val(obj[0].name);
                                    $('#email').val(obj[0].email);
                                    $('#mobile').val(obj[0].mobile);
                                    $('#password').val(obj[0].password);
                                    $('#role').val(obj[0].role);




                                }
                            });
                        }


                        function get_delete(id) {

                            $.ajax({
                                type: "POST",
                                url: "delete_Admin.jsp",
                                dataType: "JSON",
                                data: {"id": id},

                                success: function (data) {
                                    alert("Record deleted");
                                    getAll();
                                }
                            });
                        }
</script>

<script>
    $(document).ready(function(){
        
           //strong password method
                $.validator.addMethod("strongPassword",function(value){
                    return /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/.test(value);
                },"Password must contain uppercase,lowercase and symbol");

        
       $("#adminForm").validate({
           rules:{
               name:{
                   required:true
               },
               email:{
                   required:true,
                   email:true
               },
               mobile:{
                   required:true,
                   minlength:10
               },
               password:{
                   required:true,
                   strongPassword:true
               },
               role:{
                   required:true,
                   nowhitespace:true
               }
           }
       }) ;
    });
</script>

</body>
</html>