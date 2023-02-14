/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.bean.RegisterBean;
import com.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserLoginValidate {
    public static List<RegisterBean> getUsers(String user_email,String user_password){
		List<RegisterBean>list = new ArrayList<RegisterBean>();
		
		try {
			Connection con = DBConnection.createConnection();
			PreparedStatement ps = con.prepareStatement("select *from data where user_email=? and user_password=?");
			
			ps.setString(1, user_email);
			ps.setString(2, user_password);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				RegisterBean vlogin = new RegisterBean(); 
				vlogin.setUserName(rs.getString(1));
				vlogin.setUserEmail(rs.getString(2));
				vlogin.setMobile(rs.getString(3));
				vlogin.setPassword(rs.getString(4));
				
				list.add(vlogin);
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
    }
}
