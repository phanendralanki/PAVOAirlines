/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bean;

public class LoginBean {
    private String user_email;
    private String user_password;
    
    public String getUserEmail(){
        return user_email;
    }
    public void setUserEmail(String user_email){
        this.user_email = user_email;
    }
    
    public String getPassword(){
        return user_password;
    }
    
    public void setPassword(String user_password){
        this.user_password = user_password;
    }
}
