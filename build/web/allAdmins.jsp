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

String query = "select *from admins";

Statement stmt = con.createStatement();

rs = stmt.executeQuery(query);

while(rs.next()){
    JSONObject obj = new JSONObject();
    String id = rs.getString("id");
    String name = rs.getString("name");
    String email = rs.getString("email");
    String mobile = rs.getString("mobile");
    String password = rs.getString("password");
    String role = rs.getString("role");
    
    obj.put("name",name);
    obj.put("email",email);
    obj.put("mobile",mobile);
    obj.put("password",password);
    obj.put("role",role);
    
    obj.put("id",id);
    
    list.add(obj);
    
    
}
    
out.print(list.toJSONString());
out.flush();


%>
