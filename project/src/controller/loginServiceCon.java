package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.memberDAO;
import Model.memberDTO;


@WebServlet("/loginServiceCon")
public class loginServiceCon extends HttpServlet {

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.getParameter("EUC-KR");
      
      String getMemberId = request.getParameter("id");
      String getMemberPw = request.getParameter("pw");
      
      System.out.println("id : "+getMemberId);
      System.out.println("pw : "+getMemberPw);
      
      
      memberDAO dao = new memberDAO();
      memberDTO info = dao.login(getMemberId, getMemberPw);
      
      if(info !=null) {
         System.out.println("로그인 성공");
         HttpSession session = request.getSession();
         session.setAttribute("info", info);
      }else {
         System.out.println("로그인 실패");
      }
      //
      response.sendRedirect("Main.jsp");
   }

}