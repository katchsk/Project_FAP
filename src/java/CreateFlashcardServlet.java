import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.ArrayList;

public class CreateFlashcardServlet extends HttpServlet{

   protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");
        String addmore = request.getParameter("addmore");
        
        System.out.println(question);
        
        ArrayList<ArrayList<String>> currentSessionList = (ArrayList<ArrayList<String>>)session.getAttribute("CardList");
        if (currentSessionList == null) {
            currentSessionList = new ArrayList<>();
        }
        
        ArrayList<String> card = new ArrayList<>();
        card.add(question);
        card.add(answer);
        currentSessionList.add(card);
      
        session.setAttribute("CardList", currentSessionList);
       
        if (addmore.equals("true")) {
            request.setAttribute("addmore", "true");
            
             RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
             dispatcher.forward(request, response);
        } else if(addmore.equals("false")) {
             response.sendRedirect("dashboard.jsp");   
        }
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