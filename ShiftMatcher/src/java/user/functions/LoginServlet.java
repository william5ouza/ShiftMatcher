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
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            //feth data from login form
            
            String userEmail = request.getParameter("userEmail");
            String userPass = request.getParameter("userPass");
            
            UserDatabase db =  new UserDatabase(ConnectionPro.getConnection());
            User user = db.logUser(userEmail, userPass);
            
            if(user!=null){
                HttpSession session = request.getSession();
                session.setAttribute("logUser", user);
                if (user.getUserType().equals("Employer")) {
                   response.sendRedirect("/TestShiftMacher/assets/views/employerPage.jsp"); 
                } else {
                response.sendRedirect("/TestShiftMacher/assets/views/employeePage.jsp");
                }
            }else{
                response.sendRedirect("/TestShiftMacher/index.jsp");
            }           
            
            
            out.println("</body>");
            out.println("</html>");
        }
    }
}
