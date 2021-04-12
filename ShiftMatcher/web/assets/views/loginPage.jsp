<%-- 
    Document   : loginPage
    Created on : 26-Mar-2021, 10:10:07
    Author     : WilliamCarvalho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ShiftMatcher | Login</title> 
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
    <body>

        <div id="main_menu">
            <div class="logo_area">
                <a href="../../index.jsp"><img src="../img/logo.png" alt="logo"></a>
            </div>
            <div class="inner_main_menu">
                <ul>
                    <li><a href="loginPage.jsp">Sign in</a></li> 
                </ul>
            </div>
        </div>

        <!--------------------------------- Sing In Form --------------------------------->     

        <div class="container-login">
            <div class="forms-container">
                <div class="signin-signup">
                    <form action="/TestShiftMacher/LoginServlet" class="sign-in-form" method="post">
                        <h2 class="title">Sign In</h2>
                        <div class="input-field">
                            <i class="fas fa-envelope"></i>
                            <input type="text" placeholder="Email" required name="userEmail"/>
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" placeholder="Password" required name="userPass">
                        </div>
                        <input type="submit" class="btn solid" value="Login"/>
                        <p class="social-text">Or Sign in with social platforms</p>
                        <div class="social-media">
                            <a href="#" class="social-icon">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-google"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                        </div>
                    </form>
                </div> 

                <!--------------------------------- Sing Up Form ---------------------------------> 

                <div class="signup-signup">
                    <form action="/TestShiftMacher/RegisterServlet" class="sign-up-form" method="post">
                        <h2 class="title">Sign Up</h2>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="text" placeholder="Username" required name="userName"/>
                        </div>
                        <div class="input-field">
                            <i class="fas fa-envelope"></i>
                            <input type="email" placeholder="Email" required name="userEmail"/>
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" placeholder="Password" required name="userPass"/>
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" placeholder="Re-type Password" required name="userPass2"/>
                        </div>
                        <div class="input-name">
                            <input type="radio" name="userType" id="type" class="radio-button" value="Employer">
                            <label for="type" class="type">Employer</label>
                            <input type="radio" name="userType" id="type1" class="radio-button" value="Employee">
                            <label for="type1" class="type">Employee</label>
                        </div>
                        <button onclick="msgAlert();" type="submit" class="btn solid" >Register</button>
                        <p class="social-text">Or Sign Up with social platforms</p>
                        <div class="social-media">
                            <a href="#" class="social-icon">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-google"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                        </div>
                    </form>
                </div> 
            </div>


            <!--------------------------------- panels --------------------------------->      

            <div class="panels-container">
                <div class="panel left-panel">
                    <div class="content">
                        <h3>New Here?</h3>
                        <p>Create an account and start using our <br> platform to get the job are you looking for.
                        </p>
                        <button class="btn transparent" id="sign-up-button">Sign Up</button>
                    </div>
                    <img src="../img/undraw_Access_account_re_8spm.svg" alt="" class="image"/>
                </div>
            </div>            
        </div>

        <script src="../js/app.js" type="text/javascript"></script>        
        <script src="https://kit.fontawesome.com/59c3cb47db.js" crossorigin="anonymous"></script>

        
    </body>    

</html>
