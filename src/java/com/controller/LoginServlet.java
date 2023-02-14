/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.bean.RegisterBean;
import com.dao.UserLoginValidate;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class LoginServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    try (PrintWriter out = response.getWriter()) {

      //            request.getRequestDispatcher("link.html").include(request, response);

      try {
        String user_email = request.getParameter("user_email");
        String user_password = request.getParameter("user_password");

        RegisterBean login = new RegisterBean();

        login.setUserEmail(user_email);
        login.setPassword(user_password);

        List<RegisterBean> list = new ArrayList<>();

        list = UserLoginValidate.getUsers(user_email, user_password);

        if (!(list.isEmpty())) {
          
          HttpSession session = request.getSession();
          session.setAttribute("user_email", user_email);
          response.sendRedirect("welcome.jsp");
        } else {
          
          out.println("<script type='text/javascript'>");
          out.println("alert('incorrect password')");
          out.println("</script>");
          request.getRequestDispatcher("login.jsp").include(request, response);
        }
        out.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
  }

  
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    processRequest(request, response);
  }

  
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    processRequest(request, response);
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  } // </editor-fold>
}
