<%@page import="com.exavalu.services.RoleService"%>
<%@page import="com.exavalu.services.DepartmentService"%>
<%@page import="com.exavalu.entities.Role"%>
<%@page import="com.exavalu.entities.Department"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.exavalu.entities.Employee"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
        <style>
            .span{
                color:red;
            }

            .myform.form-select option.span{
                color:red;
            }
            .form-floating{
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body class="text-center">
        <jsp:include page="menu.jsp"></jsp:include>
            <main class="form-signin w-100 m-auto">




                <form action="AddEmployee" method="Post" class="myform">



                    <h1 class="h3 mb-3 fw-normal">Add an employee data</h1>
                <c:if test="${not empty requestScope.ErrorMsg}">
                    <div class="alert alert-danger" role="alert">
                        ${requestScope.ErrorMsg}
                    </div>
                </c:if>


                <!--                <div class="form-floating">
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Employee Id" name="employeeId" >
                                    <label for="floatingInput">Employee Id</label>
                                </div>-->
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="first name" name="firstName" title="This is a mandatory field" required>
                    <label for="floatingInput"><span class="span">*</span>First Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="last name" name="lastName" title="This is a mandatory field" required>
                    <label for="floatingInput"><span class="span">*</span>Last Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="address" name="address" title="This is a mandatory field" required>
                    <label for="floatingInput"><span class="span">*</span>Address</label>
                </div>
                <div class="form-floating">
                    <input type="tel" class="form-control" id="floatingInput" placeholder="phone" name="phoneNumber" title="This is Not a Valid Phone Number" pattern="[6-9]{1}[0-9]{9}" required >
                    <label for="floatingInput"><span class="span">*</span>Phone</label>
                </div>
                <div class="form-floating">
                    <label for="floatingInput"><span class="span">*</span></label>
                    <select name="gender" class="form-select" title="This is a mandatory field" required >

                        <option value="">Select Gender<span class="span">*</span></option>
                        <option value="male">  Male </option>
                        <option value="female">  Female </option>
                        <option value="others">  Others </option>
                    </select>
                </div>
                <div class="form-floating">
                    <input type="number" class="form-control" id="floatingInput" placeholder="age" name="age" title="This is a mandatory field" required>
                    <label for="floatingInput"><span class="span">*</span>Age</label>
                </div>

                
                <c:set var="departmentList" value="${DepartmentService.getAllDepartment()}" />
                <c:set var="roleList" value="${RoleService.getAllRole()}" />
                <div class="form-floating">
                    <label for="floatingInput"><span class="span">*</span></label>

                    <select name="departmentId" class="form-select select" id="departmentId" title="This is a mandatory field" required>
                        <option value="" >Select a Department</option>
                        <c:forEach items="${departmentList}" var="dept">
                            <option value="${dept.getDepartmentId()}"> ${dept.getDepartmentName()} </option>
                        </c:forEach>


                    </select>
                </div>
                <div class="form-floating">
                    <label for="floatingInput"><span class="span">*</span></label>
                    
                    <select name="roleId" class="form-select" id="roleId" title="This is a mandatory field" required>
                        <option value="" >Select a Role</option>
                        <c:forEach items="${roleList}" var="role">
                            <option value="${role.getRoleId()}"> ${role.getRoleName()} </option>
                        </c:forEach>
                        
                        
                    </select>
                </div>
                <div class="form-floating">
                    <input type="number" class="form-control" id="floatingInput" placeholder="basicSalary" name="basicSalary" title="This is a mandatory field" required>
                    <label for="floatingInput"><span class="span">*</span>Basic Salary</label>
                </div>
                <div class="form-floating">
                    <input type="number" class="form-control" id="floatingInput" placeholder="carAllaowance" name="carAllaowance" value="0.0">
                    <label for="floatingInput">Car Allowance</label>
                </div>
                <div class="form-floating">
                    <input type="number" class="form-control" id="floatingInput" placeholder="specialAllaowance" name="specialAllaowance" value="0.0">
                    <label for="floatingInput">Special Allowance</label>
                </div>


                <button class="w-100 btn btn-lg btn-primary" type="submit">Save</button>

            </form>
        </main>
    </body>
</html>
