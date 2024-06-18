package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Model.memberDTO;
import Model.notice_BoardDAO;
import Model.reviewBoardDAO;
import Model.reviewBoardDTO;


@WebServlet("/reviewWriteServiceCon")
public class reviewWriteServiceCon extends HttpServlet {
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      request.setCharacterEncoding("EUC-KR");
	      
	      
			HttpSession session = request.getSession();
			memberDTO info = (memberDTO)session.getAttribute("info");
			String get_memberId = info.getMemberId();
			
			
	      //������ ����� �־��� ������ ����
	      notice_BoardDAO noticeDAO = new notice_BoardDAO();
	      // 1. �̹��� ���
	      // getServletContext : ������ ����
	      // getRealPath : ���� ���
	      // �̹����� ������ ��θ� ���� (�����)
	      String savePath = request.getServletContext().getRealPath("review_img");
	      System.out.println(savePath);
	      
	      // 2. �̹��� ũ��
	      // �̹��� ũ�⸦ ���� : �̹��� ȭ���� ���Ƽ� �뷮�� ũ�ϱ� ������ ������ �ʹ� ���� �����ؼ� �̹��� ũ�� ����
	      // 5MB
	      // 1kb = 1024byte
	      // 1mb = 1024kb
	      int maxSize = 5*1024*1024;
	      
	      // 3. �̹����� ���ڵ� ���
	      String encoding = "EUC-KR";
	      // request ��ü �̹��� ���� ���, ������ �̹��� ũ��, ���ڵ����, �ߺ�����
	      MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());
	      
	      String title = multi.getParameter("title");
	      double lat =Double.parseDouble(multi.getParameter("lat"));
	      double lng =Double.parseDouble(multi.getParameter("lng"));
	      String content = multi.getParameter("content");
	      String run = multi.getParameter("run");
	      String Trash = multi.getParameter("Trash");
	      int noticeNumber = Integer.parseInt(multi.getParameter("noticeNumber"));
	      // �̹��� �±׿� ��� �ۼ� �� 16������ ������� �ؼ� ���ڵ� ����
	      // �׳� ���ڵ� �ϸ� ������ ���� �� ������ ���ϱ� if������
	      String fileName = null;
	      if (multi.getFilesystemName("fileName") != null) {         
	         fileName = URLEncoder.encode(multi.getFilesystemName("image"), "EUC-KR");
	      }
	      System.out.println("(reportPostServiceCon������) title : " + title);
	      System.out.println("(reportPostServiceCon������) lat :" + lat);
	      System.out.println("(reportPostServiceCon������) lng :" + lng);
	      System.out.println("(reportPostServiceCon������) �ѱ��ּ� : " + content);
	      System.out.println("(reportPostServiceCon������) fileName : " + fileName);
	      
	      
	      
	  reviewBoardDTO dto = new reviewBoardDTO(get_memberId,fileName,lat,lng,content,
	    			title,Trash,run);
      reviewBoardDAO dao = new reviewBoardDAO();
      int cnt2 = dao.reviewCheck(noticeNumber,get_memberId);
      int cnt = dao.upload(dto);
      
      if(cnt>0 && cnt2>0) {
         System.out.println("���� ����");
      }else {
         System.out.println("���� ����");
      }
      
      response.sendRedirect("reviewMain.jsp");
      
      
   }

}