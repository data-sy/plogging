package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.reviewBoardDAO;
import Model.reviewBoardDTO;

@WebServlet("/reviewServiceCon")
public class reviewServiceCon extends HttpServlet {
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      request.setCharacterEncoding("EUC-KR");
      //
      int reviewNumber = Integer.parseInt(request.getParameter("reviewNumber"));

      System.out.println("reviewNumber : "+ reviewNumber);


      //reviewBoardDTO dto = new reviewBoardDTO(reviewNumber,memberId,noticeNumber,reviewDate,reviewImage,location,contents,reviewTitle,checkBox,run);

      reviewBoardDAO dao = new reviewBoardDAO();
      dao.showOne(reviewNumber);
      response.sendRedirect("review.jsp");
   }

}