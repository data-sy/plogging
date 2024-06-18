package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import Model.boardDAO;
import Model.boardDTO;
import Model.memberDTO;



@WebServlet("/BoardServiceCon")
public class BoardServiceCon extends HttpServlet {
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      request.setCharacterEncoding("EUC-KR");
      
      HttpSession session = request.getSession();
      String memberId=null;
      String boardTitle = request.getParameter("title");
      String boardContent = request.getParameter("textarea");
      memberDTO info = (memberDTO) session.getAttribute("info");
      
      memberId= info.getMemberId();
      
      String boardImage = request.getParameter("fileName");
 
      System.out.println(memberId);
      System.out.println(boardContent);
      System.out.println(boardTitle);
      System.out.println(boardImage);
      
      boardDTO dto = new boardDTO(memberId,boardContent,boardTitle, boardImage );
      boardDAO dao = new boardDAO();
      int cnt = dao.upload(dto);
      
      String moveURL = "";
      if(cnt>0) {
         System.out.println("게시판 업로드 전송 성공");
         moveURL = "Board.jsp";
         session.setAttribute("id", memberId);
      }else {
         System.out.println("게시판 업로드 전송 실패");
         moveURL = "Board.jsp";
      }
      response.sendRedirect("Board.jsp");
   }//

}