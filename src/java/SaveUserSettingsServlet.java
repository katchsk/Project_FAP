import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.ArrayList;

public class SaveUserSettingsServlet extends HttpServlet{

   protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        String duration = request.getParameter("duration");
        String questionRandomness = request.getParameter("questionRandomness");

        session.setAttribute("duration", duration);
        session.setAttribute("questionRandomness", questionRandomness);
        
        response.sendRedirect("dashboard.jsp");   
   }
   
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       processRequest(request, response);
   }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        processRequest(request, response);
    }
}