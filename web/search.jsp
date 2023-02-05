<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page import="com.exavalu.entities.Employee"%>
<%@page import="com.exavalu.entities.Role"%>
<%@page import="com.exavalu.services.RoleService"%>
<%@page import="com.exavalu.services.DepartmentService"%>
<%@page import="com.exavalu.entities.Department"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.84.0">
        <title>Employee Management</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">



        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet" >

        <!-- Favicons -->
        <link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
        <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
        <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
        <link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
        <link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
        <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">

        <link href="css/bootstrap.min.css" rel="stylesheet" >
        <link href="css/menu_css.css" rel="stylesheet">
        <link href="css/product.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css"/>
        <style>
            #example_wrapper{
                width: 75%;
                display: block;
                margin: auto;
            }
        </style>
        <meta name="theme-color" content="#7952b3">
        <style>
            #boxes {
                content: "";
                display: table;
                clear: both;
            }
            div {
                /*       
                       
                        width:27%;
                        padding: 0 10px;*/
                height: 80px;
                float: left;
                width: 200px;
                padding: 3px;
                border: 1px solid green;
                margin: 2px;
            }
            /*      #column1 {
                    background-color: #a1edcc;
                  }
                  #column2 {
                    background-color: #a0e9ed;
                    width: 43%;
                  }
                  #column3 {
                    background-color: #f497f1;
                  }*/
            h2 {
                color: black;
                text-align: center;
            }
                    </style>




        <!-- Custom styles for this template -->
        <link href="css/signin.css" rel="stylesheet">

    </head>
    <body class="text-center">




        <jsp:include page="menu.jsp"></jsp:include>

            <main id="boxes">
                <form action="SearchEmployees" method="Post">
                    <img class="mb-4" src="css/exavalu_logo.png" alt="" width="72" height="57">
                    <h1 class="h3 mb-3 fw-normal">Please Search</h1>




                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingInput"  name="firstName">
                        <label for="floatingInput">First Name</label>
                    </div>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingInput"  name="lastName">
                        <label for="floatingInput">Last Name</label>
                    </div>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="floatingInput"  name="gender">
                        <label for="floatingInput">Gender</label>
                    </div>



                <c:set var="departmentList" value="${DepartmentService.getAllDepartment()}" />
                <c:set var="roleList" value="${RoleService.getAllRole()}" />
                <div class="form-floating">

                    <select name="departmentName" class="form-select" id="departmentName">
                        <option value="">Department</option>

                        <c:forEach items="${departmentList}" var="dept">
                            <option value="${dept.getDepartmentName()}"> ${dept.getDepartmentName()} </option>
                        </c:forEach>


                    </select>
                </div>
                <div class="form-floating">

                    <select name="roleName" class="form-select" id="roleName">
                        <option value="">Role</option>

                        <c:forEach items="${roleList}" var="role">
                            <option value="${role.getRoleName()}"> ${role.getRoleName()} </option>
                        </c:forEach>


                    </select>
                </div>





                <div>
                    <button class="w-100 btn btn-lg btn-primary" type="submit">Search</button>
                </div>


            </form>

            <c:if test="${not empty requestScope.EmpList}">


                <c:set var="empList" value="${requestScope.EmpList}"/>

                <table class="table table-bordered table-hover" id="example">
                    <tr class="table-striped table-primary">
                        <td>
                            Employee Id
                        </td>
                        <td>
                            First Name
                        </td>
                        <td>
                            Last Name
                        </td>
                        <td>
                            Address
                        </td>
                        <td>
                            Phone
                        </td>
                        <td>
                            Gender
                        </td>
                        <td>
                            Age
                        </td>
                        <td>
                            Department
                        </td>
                        <td>
                            Role
                        </td>
                        <td>
                            Basic Salary
                        </td>
                        <td>
                            Car Allowance
                        </td>
                        <td>
                            Action
                        </td>

                    </tr>


                    <c:forEach var="emp" items="${empList}">

                        <tr>
                            <td>
                                ${emp.getEmployeeId()}

                            </td>
                            <td>
                                ${emp.getFirstName()}
                            </td>
                            <td>
                                ${emp.getLastName()}
                            </td>
                            <td>
                                ${emp.getAddress()}
                            </td>
                            <td>
                                ${emp.getPhoneNumber()}
                            <td>
                                ${emp.getGender()}
                            </td>
                            <td>
                                ${emp.getAge()}
                            </td>
                            <td>
                                ${emp.getDepartmentName()}
                            </td>
                            <td>
                                ${emp.getRoleName()}
                            </td>
                            <td>
                                ${emp.getBasicSalary()}
                            <td>
                                ${emp.getCarAllowance()}
                            </td>
                            <td> 

                                <a href=EditEmployee?employeeId= ${emp.getEmployeeId()}>
                                    Edit
                                </a>


                            </td>
                        </tr>

                    </c:forEach>




                </table>

            </c:if>


        </main>



    </body>
</html>

