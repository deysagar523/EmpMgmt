
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.exavalu.empweb.utils.JDBCConnectionManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.exavalu.entities.Employee"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.108.0">
        <title>Product example Â· Bootstrap v5.3</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/product/">





        

        <!-- Favicons -->
        <link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
        <link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
        <link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
        <meta name="theme-color" content="#712cf9">



       
        <link href="css/bootstrap.min.css" rel="stylesheet" >
        <link href="css/menu_css.css" rel="stylesheet">
        <link href="css/product.css" rel="stylesheet">
    </head>
    <body>
        <%if (request.getSession().getAttribute("User") == null)
                request.getRequestDispatcher("login.jsp").forward(request, response);
        %>


        <jsp:include page="menu.jsp"></jsp:include>


        <%
            ArrayList empList = (ArrayList) request.getAttribute("EmpList");
            Iterator itr = empList.iterator();
        %>
        <h1 align="center">Search Results</h1>
        <div class="table-responsive">
            <table class="table table-bordered table-hover" >
                <thead>
                    <tr class="table-striped table-primary">
                        <th>
                            Employee Id
                        </th>

                        <th>
                            First Name
                        </th>
                        <th>
                            Last Name
                        </th>
                        <th >
                            Address
                        </th>
                        <th >
                            Phone Number
                        </th>
                        <th >
                            Gender
                        </th>
                        <th >
                            Age
                        </th>
                        <th >
                            Department Name
                        </th>
                        <th >
                            Role Name
                        </th>
                        <th >
                            Basic Salary
                        </th>
                        <th >
                            Car Allowance
                        </th>
                        <th >
                            Special Allowance
                        </th>
                        <th >
                            Action
                        </th>

                    </tr>
                </thead>
                <%
                    while (itr.hasNext()) {
                        Employee emp = (Employee) itr.next();


                %>
                <tbody>
                    <tr>
                        <td>
                            <%=emp.getEmployeeId()%>
                        </td>
                        <td>
                            <%=emp.getFirstName()%>
                        </td>
                        <td>
                            <%=emp.getLastName()%>
                        </td>
                        <td>
                            <%=emp.getAddress()%>
                        </td>
                        <td>
                            <%=emp.getPhoneNumber()%>
                        </td>
                        <td>
                            <%=emp.getGender()%>
                        </td>
                        <td>
                            <%=emp.getAge()%>
                        </td>
                        <td>
                            <%=emp.getDepartmentName()%>
                        </td>
                        <td>
                            <%=emp.getRoleName()%>
                        </td>
                        <td>
                            <%=emp.getBasicSalary()%>
                        </td>
                        <td>
                            <%=emp.getCarAllowance()%>
                        </td>
                        <td>
                            <%=emp.getSpecialAllowance()%>
                        </td>
                        <td> 
                            <a href=EditEmployee?employeeId=<%=emp.getEmployeeId()%>>Edit</a>                     
                        </td>

                    </tr>
                </tbody>
                <%
                    }
                %>



            </table>

        </div>



        <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>


    </body>
</html>

