<%@page import="java.sql.DriverManager"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONArray"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 

JSONArray list = new JSONArray();

Connection con; 
PreparedStatement pst;
ResultSet rs;



Class.forName("com.mysql.cj.jdbc.Driver");

con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pavo","root","user");

String id = request.getParameter("id");

pst = con.prepareStatement("select id,name,email,mobile,password,role from admins where id=?");

pst.setString(1,id);

rs = pst.executeQuery();

if(rs.next() == true){
    String id1 = rs.getString(1);
    String name = rs.getString(2);
    String email = rs.getString(3);
    String mobile = rs.getString(4);
    String password = rs.getString(5);
    String role = rs.getString(6);
    
    JSONObject obj = new JSONObject();
    
    obj.put("id",id1);
    obj.put("name",name);
    obj.put("email",email);
    obj.put("mobile",mobile);
    obj.put("password",password);
    obj.put("role",role);
    
    list.add(obj);
}

out.print(list.toJSONString());
out.flush();

    
%>