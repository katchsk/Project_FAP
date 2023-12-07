import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.ArrayList;

public class CreateFlashcardServlet extends HttpServlet{

   protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");
        
        ArrayList<ArrayList<String>> currentSessionList = (ArrayList<ArrayList<String>>)session.getAttribute("CardList");
        if (currentSessionList == null) {
            currentSessionList = new ArrayList<>();
        }
        
        ArrayList<String> card = new ArrayList<>();
        card.add(question);
        card.add(answer);
        currentSessionList.add(card);
      
        session.setAttribute("CardList", currentSessionList);
       
        RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");

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