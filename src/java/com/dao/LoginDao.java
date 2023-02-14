/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.bean.LoginBean;
import com.util.DBConnection;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginDao {
    public String authenticateAdmin(LoginBean loginBean){
        String user_email = loginBean.getUserEmail();
        String user_password = loginBean.getPassword();
        
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        
        String userEmailDB = "";
        String passwordDB = "";
        String roleDB = "";
        
        try{
            con = DBConnection.createConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("select email,password,role from admins");
            
            while(resultSet.next()){
                userEmailDB = resultSet.getString("email");
                passwordDB = resultSet.getString("password");
                roleDB = resultSet.getString("role");
                
                if(user_email.equals(userEmailDB) && user_password.equals(passwordDB) && roleDB.equals("Admin")){
                    return "Admin";   
                }
                else if(user_email.equals(userEmailDB) && user_password.equals(passwordDB) && roleDB.equals("AirIndiaAdmin")){
                    return "AIRINDIA";
                }
                else if(user_email.equals(userEmailDB) && user_password.equals(passwordDB) && roleDB.equals("BristishAdmin")){
                    return "British";
                    }
                else if(user_email.equals(userEmailDB) && user_password.equals(passwordDB) && roleDB.equals("EmiratesAdmin")){
                    return "Emirates";
                }
                else if(user_email.equals(userEmailDB) && user_password.equals(passwordDB) && roleDB.equals("QuatarAdmin")){
                    return "Quatar";
                }

            }
            
                
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return "Invalid users credentials";
    }
}
