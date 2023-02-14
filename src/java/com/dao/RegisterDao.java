
package com.dao;

import com.bean.RegisterBean;
import com.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class RegisterDao {
    public RegisterDao(Connection createConnection) {
		
	}

	public String registerUser(RegisterBean registerBean) {
		String user_name = registerBean.getUserName();
		String user_email = registerBean.getUserEmail();
		String mobile = registerBean.getMobile();
		String user_password = registerBean.getPassword();
		
		
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			
			con = DBConnection.createConnection();
			String query = "insert into data(user_name,user_email,mobile,user_password) values(?,?,?,?)";
			ps = con.prepareStatement(query);
			ps.setString(1,user_name);
			ps.setString(2,user_email);
			ps.setString(3,mobile);
			ps.setString(4,user_password);
			
			int i = ps.executeUpdate();
			
			if(i!=0)
				return "SUCCESS";
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "oops..something went wrong there..!";
		
		
		
		
	}
}
