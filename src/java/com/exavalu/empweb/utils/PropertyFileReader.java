/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.empweb.utils;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author LENOVO
 */
public class PropertyFileReader {
    // I will read values defined in a property file.

	// Property file - this is just a text file that will have all parameters

	// defined for connecting

	// to DB.

		public static PropertyFileReader propertyFileReader = null;

	// in this class we will have static methods to get the connection params

		public String getPropertyValue(String param) {

			String value = null;

	// input = getClass().getResourceAsStream("settings.properties"); // Property

	// file path in classpath

			try {

				String path = PropertyFileReader.class.getClassLoader().getResource("settings.properties").getPath();
//				System.out.println("File path"+path);

				BufferedReader input = new BufferedReader(new FileReader(path));//handle of the file where the file is

				Properties prop = new Properties();//as it is not a plain file

				prop.load(input);//parse the file and create hashmap in the memory

				value = prop.getProperty(param);//use param as a key and return the corresponding value

			} catch (IOException e) {

	// TODO Auto-generated catch block

				e.printStackTrace();

			}

			return value;

		}

		private PropertyFileReader() {

	// Private constructor

		}

		public static PropertyFileReader getInstance() {

			if (propertyFileReader == null) {

				propertyFileReader = new PropertyFileReader();

			}

			return propertyFileReader;

		}
//
//		public static void main(String args[])
//	
//		{
//			PropertyFileReader util = PropertyFileReader.getInstance();
//	
//			String user = util.getPropertyValue("user");
//	
//			System.out.println("Got user = " + user);
//	
//		}
}
