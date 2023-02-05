<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page import="com.exavalu.entities.Role"%>
<%@page import="com.exavalu.entities.Department"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.exavalu.entities.Employee"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <title>Employee Management</title>      
        <link href="css/bootstrap.min.css" rel="stylesheet" >
        <link href="css/signin.css" rel="stylesheet">  

        <link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
        <link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
        <link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
        <meta name="theme-color" content="#712cf9">



        <link href="css/menu_css.css" rel="stylesheet">
        <link href="css/product.css" rel="stylesheet">
        <!-- Custom styles for this template -->
    </head>
    <body class="text-center">
        <jsp:include page="menu.jsp"></jsp:include>
            <main class="form-signin w-100 m-auto">


          

            <c:set var="emp" value="${requestScope.Emp}"/>
            <c:set var="deptList" value="${requestScope.DeptList}"/>
            <c:set var="roleList" value="${requestScope.RoleList}"/>
            <form action="SaveEmployee" method="Post" >


                <h1 class="h3 mb-3 fw-normal">Please edit employee data</h1>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="Employee Id" name="employeeId" value=${emp.getEmployeeId()} readonly>
                    <label for="floatingInput">Employee Id</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="first name" name="firstName" value=${emp.getFirstName()}>
                    <label for="floatingInput">First Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="last name" name="lastName" value=${emp.getLastName()} >
                    <label for="floatingInput">Last Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="address" name="address" value=${emp.getAddress()} >
                    <label for="floatingInput">Address</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="phone" name="phoneNumber" value=${emp.getPhoneNumber()} >
                    <label for="floatingInput">Phone</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="gender" name="gender" value=${emp.getGender()} >
                    <label for="floatingInput">Gender</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="age" name="age" value=${emp.getAge()} >
                    <label for="floatingInput">Age</label>
                </div>
                <div class="form-floating">
                    
                    <select name="departmentId" class="form-select" id="departmentId">
                        <option value="0">Select a Department</option>


                        <c:set var="selectedDept" value="${emp.getDepartmentName()}" />
                        <c:forEach items="${deptList}" var="dept">
                            <option value="${dept.getDepartmentId()}"
                                    <c:if test="${dept.getDepartmentName() == selectedDept}">
                                        selected 
                                    </c:if>>
                                ${dept.getDepartmentName()} </option>
                            
                        </c:forEach>


                    </select>
                </div>
                <div class="form-floating">

                    <select name="roleId" class="form-select" id="roleId">
                        <option value="0">Select a Role</option>

                        <c:set var="selectedRole" value="${emp.getRoleName()}" />
                        <c:forEach items="${roleList}" var="role">
                            <option value="${role.getRoleId()}"
                                    <c:if test="${role.getRoleName() == selectedRole}">
                                        selected 
                                    </c:if>>
                            ${role.getRoleName()} </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="basicSalary" name="basicSalary" value=${emp.getBasicSalary()} >
                    <label for="floatingInput">Basic Salary</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="carAllaowance" name="carAllaowance" value=${emp.getCarAllowance()} >
                    <label for="floatingInput">Car Allowance</label>
                </div>
<!--                    <input type="hidden" name="employeeId" value=${emp.getEmployeeId()}>-->

                <button class="w-100 btn btn-lg btn-primary" type="submit">Save</button>

            </form>
        </main>
    </body>
</html>
