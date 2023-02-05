/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.empweb.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author LENOVO
 */
public class JDBCConnectionManager {

	public static Connection getMySQLConnection()
	{
		Connection connection=null;
		
		try {
			PropertyFileReader util = PropertyFileReader.getInstance();

			 String user = util.getPropertyValue("user");
			 String password = util.getPropertyValue("pass");
			 String url = util.getPropertyValue("url");
			 String dbName = util.getPropertyValue("dbName");
			 String driverName = util.getPropertyValue("driverName");
			 
			//we use url,userid,password for databse connection
			 
			 
			Class.forName(driverName);//loading the class in memory
			connection=DriverManager.getConnection(url+dbName,user,password);
//			System.out.println("Connection = "+connection);
			
		}catch (ClassNotFoundException | SQLException ex) {

			ex.printStackTrace();
        }
		
		return connection;
	}
	public static void main(String args[])
	{
		Connection connection=JDBCConnectionManager.getMySQLConnection();
		System.out.println("Connection = "+connection);
	}
}
