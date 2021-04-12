<%-- 
    Document   : employeePage
    Created on : 26-Mar-2021, 16:45:29
    Author     : WilliamCarvalho
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="user.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% User user = (User) session.getAttribute("logUser");
    if (user == null) {
        response.sendRedirect("../../index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
        <title>ShiftMatcher | Employee Page</title> 
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        <script src="https://kit.fontawesome.com/59c3cb47db.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>

        <input type="checkbox" id="nav-toggle">
        <div class="sidebar">
            <div class="sidebar-brand">
                <h2><span class="fas fa-puzzle-piece"></span> <span>ShiftMatcher</span></h2>               
            </div>

            <div class="sidebar-menu">
                <ul>
                    <li>
                        <a href="#" class="active"><span class="fas fa-home"></span>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" ><span class="fas fa-id-card"></span>
                            <span>Profile</span>
                        </a>
                    </li>
                    <li>
                        <a href="#"><span class="fas fa-user-cog"></span>
                            <span>Settings</span>
                        </a>
                    </li>                    
                </ul>
            </div>
            <div class="sidebar-menu">
                <li>
                    <a href="/TestShiftMacher/LogoutServlet"><span class="fas fa-sign-out-alt"></span>
                        <span>Logout</span>
                    </a>
                </li>
            </div>
        </div>

        <div class="main-content">
            <header>
                <h2>
                    <label for="nav-toggle">
                        <span class="fas fa-bars"></span>
                    </label>

                    Dashboard
                </h2>

                <div class="user-wrapper">
                    <img src="../img/user.svg" width="40px" height="40px" alt="user_photo">
                    <div>
                        <h4><%= user.getUserName()%></h4>
                        <small><%= user.getUserType()%></small>
                    </div>
                </div>
            </header>  

            <main>
                <div class="container-employer">
                    <div class="table-wrapper">
                        <div class="table-tile">
                            <div class="row-employer">
                                <div class="col-sm-6">
                                    <h2>Manage<b>Jobs</b></h2>
                                </div>
                                <div class="col-sm6">
                                    <a href="#addJobModel" class="btn-employer btn-success"><i class="fas fa-plus"></i>Add New Job</a>
                                    <a href="#addJobModel" class="btn-employer btn-success"><i class="fas fa-minus"></i>Delete Job</a>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="selectAll">
                                            <label for="selectAll"></label>
                                        </span>
                                    <th>ID</th>
                                    <th>Company</th>
                                    <th>Location</th>
                                    <th>Salary</th>
                                    <th>Description</th>
                                    <th>Date</th>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    String DRIVER = "com.mysql.cj.jdbc.Driver";
                                    String URL = "jdbc:mysql://localhost:3306/shiftmatcherdb?useTimezone=true&serverTimezone=UTC&useSSL=false";
                                    String USER = "root";
                                    String PASS = "root";
                                    String NAME = "William";
                                    String query = "SELECT * FROM job WHERE postedBy = '" + NAME + "' ";
                                    Connection conn = null;
                                    Statement stat = null;
                                    ResultSet res = null;

                                    Class.forName(DRIVER);
                                    conn = DriverManager.getConnection(URL, USER, PASS);

                                    stat = conn.createStatement();
                                    res = stat.executeQuery(query);

                                    while (res.next()) {
                                %>
                                <tr>
                                    <td>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="checkbox1" name="option[]" value="1">
                                            <label for="checkbox"></label>
                                        </span>
                                    </td>
                                    <td><%=res.getString("jobID")%></td>
                                    <td><%=res.getString("jobCompany")%></td>
                                    <td><%=res.getString("jobTitle")%></td>
                                    <td><%=res.getString("jobLocation")%></td>
                                    <td><%=res.getString("jobSalary")%></td>
                                    <td><%=res.getString("jobDescription")%></td>
                                    <td><%=res.getString("jobDatePost")%></td>
                                    <td>
                                        <a href="#addJobModal" class="edit"><i class="fas fa-pen"></i></a>
                                        <a href="#addJobModal" class="delete"><i class="far fa-trash-alt"></i></a>
                                    </td>                                    
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>        
        </div>

        <!--------------- Edit modal html start--------------->
        <div id="addJobModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <h4 class="modal-title">Add Job</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="jobCompany">Company Name</label>
                                <input type="text" class="fomr-control" required>
                            </div>   
                            <div class="form-group">
                                <label for="jobCompany">Job Title</label>
                                <input type="text" class="fomr-control" required>
                            </div>  
                            <div class="form-group">
                                <label for="jobCompany">Location</label>
                                <input type="text" class="fomr-control" required>
                            </div>  
                            <div class="form-group">
                                <label for="jobCompany">Salary</label>
                                <input type="text" class="fomr-control" required>
                            </div>  
                            <div class="form-group">
                                <label for="jobCompany">Description</label>
                                <input type="text" class="fomr-control" required>
                            </div>   
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel"> 
                                <input type="submit" class="btn btn-success" value="Add">  
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>        
        <!--------------- Edit modal html end ---------------->
        <script src="../js/app.js"></script> 
    </body>
</html>