<%@page import="java.sql.DriverManager"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONArray"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>


<% 

JSONArray list = new JSONArray();

String name = request.getParameter("name");
String email= request.getParameter("email");
String mobile = request.getParameter("mobile");
String password = request.getParameter("password");
String role = request.getParameter("role");

 
Connection con;
PreparedStatement pst;
ResultSet rs;

JSONObject obj = new JSONObject();

Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost/pavo","root","user");
pst = con.prepareStatement("insert into admins (name,email,mobile,password,role) values(?,?,?,?,?)");
pst.setString(1, name);
pst.setString(2, email);
pst.setString(3, mobile);
pst.setString(4,password);
pst.setString(5,role);

pst.executeUpdate();

obj.put("name","success");

list.add(obj);

out.println(list.toJSONString());
out.flush();


%>