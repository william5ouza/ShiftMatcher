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
        <script src="https://kit.fontawesome.com/59c3cb47db.js" crossorigin="anonymous"></script>
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
                <%
                    String DRIVER = "com.mysql.cj.jdbc.Driver";
                    String URL = "jdbc:mysql://localhost:3306/shiftmatcherdb?useTimezone=true&serverTimezone=UTC&useSSL=false";
                    String USER = "root";
                    String PASS = "root";
                    String query = "SELECT * FROM job;";
                    Connection conn = null;
                    Statement stat = null;
                    ResultSet res = null;

                    Class.forName(DRIVER);
                    conn = DriverManager.getConnection(URL, USER, PASS);

                    stat = conn.createStatement();
                    res = stat.executeQuery(query);

                    while (res.next()) {
                %>
                <div class="cards">
                    <div class="card-single">
                        <div>
                            <h1><%=res.getString("jobCompany")%></h1>
                            <h3><%=res.getString("jobLocation")%></h3>
                            <span><%=res.getString("jobDescription")%></span>
                            <br><br>
                            <a href="#" class="btn-apply">Apply now</a> 
                        </div>
                        
                        <div>
                            <span class="fas fa-briefcase"></span>
                        </div>                            
                    </div>                       
                </div>
                <%
                    }
                %>
            </main>        
        </div>

        <script src="../js/app.js"></script> 
    </body>
</html>