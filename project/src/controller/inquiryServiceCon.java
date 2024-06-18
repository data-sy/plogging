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
		System.out.println("������ȣ : " + noticeNumber);
		
		HttpSession session = request.getSession();
		memberDTO info = (memberDTO)session.getAttribute("info");
		String login_id = info.getMemberId();
		System.out.println("�α��� ���̵� : " + login_id);
		
		noticeJoinDTO dto = new noticeJoinDTO(login_id,noticeNumber);
		noticejoinDAO dao = new noticejoinDAO();

		int upCnt = dao.upload(dto);
	    int lmCnt = 0;
	    int pCnt = 0;
	      
	    if(upCnt>0) {
	       System.out.println("���� ����");
	       lmCnt = dao.upMember(noticeNumber);
	       if (lmCnt>0) {
	    	   System.out.println("ü���ο� +1 ����");	    	   
	       }else {
	    	   System.out.println("ü���ο� +1 ����");
	       }
	       pCnt = dao.upPoint(login_id);
	       if (pCnt>0) {
	    	   System.out.println("����Ʈ ���� ����");
	       }else {
	    	   System.out.println("����Ʈ ���� ����");	    	   
	       }
	    }else {
	    System.out.println("���� ����");
	    }
	    response.sendRedirect("inquiryMain.jsp");
	}

}
