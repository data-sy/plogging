package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Model.boardDAO;
import Model.reviewBoardDAO;

/**
 * Servlet implementation class DeleteOneServiceCon
 */
@WebServlet("/DeleteOneServiceCon")
public class DeleteOneServiceCon extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  int num = Integer.parseInt(request.getParameter("num"));
      
      System.out.println("삭제할메시지고유번호 : "+num);
      boardDAO dao = new boardDAO();
      
      int cnt = dao.deleteOneboard(num);
      reviewBoardDAO dao1=new reviewBoardDAO();
      int cnt1= dao1.deleteOnereview(num);
      
      String moveURL ="";
      if(cnt>0 || cnt1>0) {
         System.out.println("개별삭제성공");
         if(cnt>0) {
            moveURL="Board.jsp";
         }else {
            moveURL="reviewMain.jsp";
         }
      }else {
         System.out.println("개별삭제실패");
         if(cnt>0) {
            moveURL="Board.jsp";
         }else {
            moveURL="reviewMain.jsp";
         }
      }
      response.sendRedirect(moveURL);
      
      
   }

}