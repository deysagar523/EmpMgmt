/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.empweb.utils.JDBCConnectionManager;
import com.exavalu.entities.Employee;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author LENOVO
 */
public class EmployeeService {

    public static ArrayList getAllEmployees() {

        ArrayList empList = new ArrayList();
        try {
            Connection con = JDBCConnectionManager.getMySQLConnection();
            String sql = "select * from employees e, departments d, roles r "
                    + "where e.departmentId=d.departmentId and e.roleId=r.roleId";
            PreparedStatement preparedStatement = con.prepareStatement(sql);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Employee emp = new Employee();
                emp.setAddress(rs.getString("address"));
                emp.setEmployeeId(rs.getString("employeeId"));
                emp.setFirstName(rs.getString("firstName"));
                emp.setLastName(rs.getString("lastName"));
                emp.setPhoneNumber(rs.getString("phoneNumber"));
                emp.setGender(rs.getString("gender"));
                emp.setAge(rs.getString("age"));
                emp.setDepartmentName(rs.getString("departmentName"));
                emp.setRoleName(rs.getString("roleName"));
                emp.setBasicSalary(rs.getString("basicSalary"));
                emp.setCarAllowance(rs.getString("carAllowance"));

                emp.setSpecialAllowance(rs.getString("specialAllowance"));
                empList.add(emp);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        System.out.println("Number of employees = " + empList.size());
        return empList;
    }

    public static Employee getEmployee(String employeeId) {
        Employee emp = new Employee();

        try {
            Connection con = JDBCConnectionManager.getMySQLConnection();
            String sql = "select * from employees e, departments d, roles r "
                    + "where e.departmentId=d.departmentId and e.roleId=r.roleId and  e.employeeId =?";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, employeeId);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {

                emp.setAddress(rs.getString("address"));
                emp.setEmployeeId(rs.getString("employeeId"));
                emp.setFirstName(rs.getString("firstName"));
                emp.setLastName(rs.getString("lastName"));
                emp.setPhoneNumber(rs.getString("phoneNumber"));
                emp.setGender(rs.getString("gender"));
                emp.setAge(rs.getString("age"));
                emp.setDepartmentName(rs.getString("departmentName"));
                emp.setRoleName(rs.getString("roleName"));
                emp.setBasicSalary(rs.getString("basicSalary"));
                emp.setCarAllowance(rs.getString("carAllowance"));

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return emp;

    }

    public static boolean updateEmployee(Employee emp, String employeeId) {

        boolean result = false;
        try {
            Connection con = JDBCConnectionManager.getMySQLConnection();
            String sql = "UPDATE employeedb.employees\n"
                    + "SET firstName = ? , lastName = ? , phoneNumber = ? , address = ? ,\n"
                    + "gender = ? , age = ? , basicSalary = ?,carAllowance = ?,departmentId=?,roleId=?\n"
                    + "WHERE employeeId = ?";

            PreparedStatement preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, emp.getFirstName());
            preparedStatement.setString(2, emp.getLastName());
            preparedStatement.setString(3, emp.getPhoneNumber());
            preparedStatement.setString(4, emp.getAddress());
            preparedStatement.setString(5, emp.getGender());
            preparedStatement.setString(6, emp.getAge());
            preparedStatement.setDouble(7, Double.parseDouble(emp.getBasicSalary()));
            preparedStatement.setDouble(8, Double.parseDouble(emp.getCarAllowance()));
            preparedStatement.setString(9, emp.getDepartmentId());
            preparedStatement.setString(10, emp.getRoleId());
            preparedStatement.setString(11, employeeId);
//            System.out.println("sql="+preparedStatement);
            int row = preparedStatement.executeUpdate();

            if (row == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }

    public static ArrayList getSearchResult(String firstName, String lastName, String gender, String departmentName, String roleName) {
        ArrayList empList = new ArrayList();
        try {
            Connection con = JDBCConnectionManager.getMySQLConnection();
//            String sql = "select * from employees e,departments d,roles r where e.departmentId=d.departmentId and e.roleId=r.roleId ";
//            if(firstName.length()!=0)
//            {
//                sql+="and firstName='"+firstName+"'";
//            }
//            if(lastName.length()!=0)
//            {
//                sql+="and lastName='"+lastName+"'";
//            }
//            if(gender.length()!=0)
//            {
//                sql+="and gender='"+gender+"'";
//            }
//            if(departmentName.length()!=0)
//            {
//                sql+="and departmentName='"+departmentName+"'";
//            }
//            if(roleName.length()==2)
//            {
//                roleName="Hr Manager";
//                sql+="and roleName='"+roleName+"'";
//            }
//            else if(roleName.length()!=0)
//            {
//                sql+="and roleName='"+roleName+"'";
//            }
            String sql = "select * from employees e, departments d, roles r where e.departmentId=d.departmentId and e.roleId=r.roleId "
                    + "having firstName like ?"
                    + "and lastName like ?"
                    + "and gender like ?"
                    + "and departmentName like ?"
                    + "and roleName like ?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, firstName + "%");
            preparedStatement.setString(2, lastName+"%");
            preparedStatement.setString(3, gender + "%");
            preparedStatement.setString(4, departmentName+ "%");
            preparedStatement.setString(5, roleName+ "%");
            System.out.println("dept" + departmentName);
            System.out.println("role" + roleName);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Employee emp = new Employee();
                emp.setAddress(rs.getString("address"));
                emp.setEmployeeId(rs.getString("employeeId"));
                emp.setFirstName(rs.getString("firstName"));
                emp.setLastName(rs.getString("lastName"));
                emp.setPhoneNumber(rs.getString("phoneNumber"));
                emp.setGender(rs.getString("gender"));
                emp.setAge(rs.getString("age"));
                emp.setDepartmentName(rs.getString("departmentName"));
                emp.setRoleName(rs.getString("roleName"));
                emp.setBasicSalary(rs.getString("basicSalary"));
                emp.setCarAllowance(rs.getString("carAllowance"));

                emp.setSpecialAllowance(rs.getString("specialAllowance"));
                empList.add(emp);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        System.out.println("Number of employees = " + empList.size());
        return empList;
    }

    public static boolean addEmployee(Employee emp) {
        boolean result=false;
//        if(emp.getCarAllowance().length()==0)
//        {
//            System.out.println("car allowance null");
//        }
//        if(emp.getSpecialAllowance().length()==0)
//        {
//            System.out.println("special allowance null");
//        }
        
        try {
			// We need the connection
			Connection con = JDBCConnectionManager.getMySQLConnection();
			String sql = "INSERT INTO employees (firstName,lastName,gender,age,address,phoneNumber,departmentId,roleId,basicSalary,carAllowance,specialAllowance) "
					+ "VALUES (? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,?)";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			

			
			
				
				preparedStatement.setString(1, emp.getFirstName());
				preparedStatement.setString(2, emp.getLastName());

				preparedStatement.setString(3, emp.getGender());
				preparedStatement.setString(4, emp.getAge());
				preparedStatement.setString(5, emp.getAddress());
				preparedStatement.setString(6, emp.getPhoneNumber());

				preparedStatement.setString(7, emp.getDepartmentId());
				preparedStatement.setString(8, emp.getRoleId());
				preparedStatement.setString(9, emp.getBasicSalary());
				preparedStatement.setString(10, emp.getCarAllowance());
				preparedStatement.setString(11, emp.getSpecialAllowance());

				int row = preparedStatement.executeUpdate();
				if (row == 1)
                                {
                                    result=true;
                                }
			

		} catch (SQLException ex) {
			ex.printStackTrace();
   	
		}
        return result;
    }

}
