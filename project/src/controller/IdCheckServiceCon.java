package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.memberDAO;

@WebServlet("/IdCheckServiceCon")
public class IdCheckServiceCon extends HttpServlet {

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("EUC-KR");
       String userId = request.getParameter("userId");
         System.out.println(userId);
         memberDAO dao = new memberDAO();
         int cnt1 = dao.checkId(userId);
         
         if(cnt1==0) System.out.println("0");
         else System.out.println("1");
         
         
         String moveURL = "";
         if(cnt1==0) {
            System.out.println("아이디중복");
          moveURL = "check_id.jsp";
         }else {
            System.out.println("아이디중복아님");
             moveURL = "check_id.jsp";
         }response.sendRedirect("check_id.jsp");
   }

}