package user.functions;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.dao.ConnectionPro;
import user.dao.UserDatabase;
import user.model.User;

/**
 *
 * @author WilliamCarvalho
 */
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");

            //fetch data from registration page
            String userName = request.getParameter("userName");
            String userPass = request.getParameter("userPass");
            String userEmail = request.getParameter("userEmail");
            String userType = request.getParameter("userType");
            
            //make user object
            User user = new User(userName, userPass, userEmail, userType);

            //create a database model
            UserDatabase regUser = new UserDatabase(ConnectionPro.getConnection());
            
            if (regUser.saveUser(user)) {
                response.sendRedirect("/TestShiftMacher/assets/views/loginPage.jsp");
            } else {
                String errorMessage = "User Available";
                HttpSession regSession = request.getSession();
                regSession.setAttribute("RegError", errorMessage);
                response.sendRedirect("/TestShiftMacher/assets/views/loginPage.jsp");
            }

            out.println("</body>");
            out.println("</html>");
        }
    }
}
