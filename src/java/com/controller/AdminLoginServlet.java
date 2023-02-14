package com.controller;

import com.bean.LoginBean;
import com.dao.LoginDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class AdminLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            String user_email = request.getParameter("user_email");
            String user_password = request.getParameter("user_password");

            LoginBean loginBean = new LoginBean();

            loginBean.setUserEmail(user_email);
            loginBean.setPassword(user_password);

            LoginDao loginDao = new LoginDao();
            HttpSession session = null;
            try {
                String userValidate = loginDao.authenticateAdmin(loginBean);

                switch (userValidate) {
                    case "Admin":
                        session = request.getSession(); //Creating a session
                        session.setAttribute("Admin", user_email); //setting session attribute
                        request.setAttribute("user_email", user_email);
                        request.getRequestDispatcher("./MAdmin.jsp").forward(request, response);
                        break;
                    case "AIRINDIA":
                        session = request.getSession(); //Creating a session
                        session.setAttribute("AIRINDIA", user_email); //setting session attribute
                        request.setAttribute("user_email", user_email);
                        
                        request.getRequestDispatcher("./AirIndia.jsp").forward(request, response);
                        break;
                    case "British":
                        session = request.getSession(); //Creating a session
                        session.setAttribute("British", user_email); //setting session attribute
                        request.setAttribute("user_email", user_email);
                        request.getRequestDispatcher("./AirIndia.jsp").forward(request, response);
                        break;
                    case "Emirates":
                        session = request.getSession(); //Creating a session
                        session.setAttribute("Emirates", user_email); //setting session attribute
                        request.setAttribute("user_email", user_email);
                        request.getRequestDispatcher("./AirIndia.jsp").forward(request, response);
                        break;
                    case "Quatar":
                        session = request.getSession(); //Creating a session
                        session.setAttribute("Quatar", user_email); //setting session attribute
                        request.setAttribute("user_email", user_email);
                        request.getRequestDispatcher("./AirIndia.jsp").forward(request, response);
                        break;
                    default:
                        System.out.println("Error message = " + userValidate);
                        request.setAttribute("errMessage", userValidate);

                        request.getRequestDispatcher("./adminLogin.jsp").forward(request, response);
                        break;
                }
            } catch (ServletException | IOException ex) {
            }

        } catch (Exception e) {
        }
    }

}
