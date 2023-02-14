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

String id = request.getParameter("id");

Connection con; 
PreparedStatement pst;
ResultSet rs;



Class.forName("com.mysql.cj.jdbc.Driver");

con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pavo","root","user");

pst = con.prepareStatement("delete from admins where id=?");

pst.setString(1,id);

pst.executeUpdate();

JSONObject obj = new JSONObject();

obj.put("name","success");

list.add(obj);

out.println(list.toJSONString());

out.flush();



%>