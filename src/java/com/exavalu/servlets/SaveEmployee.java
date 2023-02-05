/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.exavalu.servlets;

import com.exavalu.entities.Employee;
import com.exavalu.services.EmployeeService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
public class SaveEmployee extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //We are getting employee information from frontend, we need to update the data in table
        Employee emp = new Employee();

        emp.setAddress(request.getParameter("address"));
        emp.setAge(request.getParameter("age"));
        emp.setBasicSalary(request.getParameter("basicSalary"));
        emp.setCarAllowance(request.getParameter("carAllaowance"));

        emp.setDepartmentId(request.getParameter("departmentId")); // important
        emp.setRoleId(request.getParameter("roleId")); // important

        emp.setFirstName(request.getParameter("firstName"));
        emp.setLastName(request.getParameter("lastName"));
        emp.setGender(request.getParameter("gender"));
        emp.setPhoneNumber(request.getParameter("phoneNumber"));
        emp.setRoleName(request.getParameter("rolesName"));
        emp.setEmployeeId(request.getParameter("employeeId"));
        boolean result = EmployeeService.updateEmployee(emp, request.getParameter("employeeId"));

        if (result) {
            ArrayList empList = EmployeeService.getAllEmployees();

            request.setAttribute("EmpList", empList);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else {
            request.setAttribute("Emp", emp);
            request.getRequestDispatcher("editemployee.jsp").forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
