import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class SaveAdminSettingsServlet extends HttpServlet{

   protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context = getServletContext();
        
        String duration = request.getParameter("duration");
        String questionRandomness = request.getParameter("questionRandomness");
        context.setInitParameter("QuizDuration", duration);
        context.setInitParameter("QuizRandomness", questionRandomness);
        
        response.sendRedirect("settingsAdmin.jsp");   
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