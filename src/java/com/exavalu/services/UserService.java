/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.empweb.utils.JDBCConnectionManager;
import com.exavalu.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LENOVO
 */
public class UserService {

    public static boolean doLogin(String emailAddress, String password) {
        boolean result = false;
        Connection con = JDBCConnectionManager.getMySQLConnection();

        String sql = "Select * from users where emailAddress=? and password=?";

        try {
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, emailAddress);
            preparedStatement.setString(2, password);

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                result = true;
            }

            con.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return result;
    }

    public static boolean doRegister(String emailAddress, String password, String firstName, String lastName) {
        boolean result = false;
        try {

            Connection con = JDBCConnectionManager.getMySQLConnection();
            String sql = "INSERT INTO users (emailAddress,password,firstName,lastName,status)"
                    + "VALUES (?,?,?,?,?)";

            PreparedStatement preparedStatement;
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, emailAddress);
            preparedStatement.setString(2, password);

            preparedStatement.setString(3, firstName);
            preparedStatement.setString(4, lastName);
            preparedStatement.setInt(5, 1);

            int row = preparedStatement.executeUpdate();
            if (row == 1) {
                result = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
        }

        return result;
    }

    public static boolean doRegisterUser(User user) {
      
         
         String emailAddress=user.getEmailAddress();
         String password=user.getPassword();
         String firstName=user.getFirstName();
         String lastName=user.getLastName();
         boolean result = false;
        try {

            Connection con = JDBCConnectionManager.getMySQLConnection();
            String sql = "INSERT INTO users (emailAddress,password,firstName,lastName,status)"
                    + "VALUES (?,?,?,?,?)";

            PreparedStatement preparedStatement;
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, emailAddress);
            preparedStatement.setString(2, password);

            preparedStatement.setString(3, firstName);
            preparedStatement.setString(4, lastName);
            preparedStatement.setInt(5, 1);

            int row = preparedStatement.executeUpdate();
            if (row == 1) {
                result = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
        }

        return result;
    }
    
    public static User getUser(String emailAddress) throws SQLException {
        User user= new User();
        Connection con = JDBCConnectionManager.getMySQLConnection();
        try {
            
            String sql = "Select * from users where emailAddress=?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, emailAddress);

            ResultSet rs = preparedStatement.executeQuery();

            if(rs.next())
            {

                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
            }

        } catch (SQLException ex) {

        }

        con.close();
        return user;
    }
    
   

}
