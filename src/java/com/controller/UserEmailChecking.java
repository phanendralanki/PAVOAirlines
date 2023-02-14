package com.controller;

import com.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserEmailChecking extends HttpServlet {

  private static final long serialVersionUID = 1L;

  Connection con = null;
  PreparedStatement pst = null;
  ResultSet rs = null;

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String user_email = request.getParameter("user_email");
    
    try {
      con = DBConnection.createConnection();
      pst = con.prepareStatement("select *from data where user_email=?");
      pst.setString(1,user_email);
      rs = pst.executeQuery();
      
      if(rs.next()){
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("Already Exists");
      }
      else{
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("Avaliable");
      }
      
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
