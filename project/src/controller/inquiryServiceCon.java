package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.noticeJoinDTO;
import Model.noticejoinDAO;
import Model.memberDTO;

@WebServlet("/inquiryServiceCon")
public class inquiryServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("=================inquiryServiceCon======================");
		
		request.setCharacterEncoding("EUC-KR");
		int noticeNumber = Integer.parseInt(request.getParameter("noticeNumber"));
		System.out.println("공고방번호 : " + noticeNumber);
		
		HttpSession session = request.getSession();
		memberDTO info = (memberDTO)session.getAttribute("info");
		String login_id = info.getMemberId();
		System.out.println("로그인 아이디 : " + login_id);
		
		noticeJoinDTO dto = new noticeJoinDTO(login_id,noticeNumber);
		noticejoinDAO dao = new noticejoinDAO();

		int upCnt = dao.upload(dto);
	    int lmCnt = 0;
	    int pCnt = 0;
	      
	    if(upCnt>0) {
	       System.out.println("참가 성공");
	       lmCnt = dao.upMember(noticeNumber);
	       if (lmCnt>0) {
	    	   System.out.println("체한인원 +1 성공");	    	   
	       }else {
	    	   System.out.println("체한인원 +1 실패");
	       }
	       pCnt = dao.upPoint(login_id);
	       if (pCnt>0) {
	    	   System.out.println("포인트 적립 성공");
	       }else {
	    	   System.out.println("포인트 적립 실패");	    	   
	       }
	    }else {
	    System.out.println("참가 실패");
	    }
	    response.sendRedirect("inquiryMain.jsp");
	}

}
