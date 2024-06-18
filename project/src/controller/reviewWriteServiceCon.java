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
			
			
	      //참여자 목롟을 넣어줄 생성자 생성
	      notice_BoardDAO noticeDAO = new notice_BoardDAO();
	      // 1. 이미지 경로
	      // getServletContext : 서블릿의 정보
	      // getRealPath : 실제 경로
	      // 이미지를 저장할 경로를 지정 (상대경로)
	      String savePath = request.getServletContext().getRealPath("review_img");
	      System.out.println(savePath);
	      
	      // 2. 이미지 크기
	      // 이미지 크기를 제한 : 이미지 화질이 좋아서 용량이 크니까 서버에 공간을 너무 많이 차지해서 이미지 크기 제한
	      // 5MB
	      // 1kb = 1024byte
	      // 1mb = 1024kb
	      int maxSize = 5*1024*1024;
	      
	      // 3. 이미지명 인코딩 방식
	      String encoding = "EUC-KR";
	      // request 객체 이미지 저장 경로, 제한할 이미지 크기, 인코딩방식, 중복제거
	      MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());
	      
	      String title = multi.getParameter("title");
	      double lat =Double.parseDouble(multi.getParameter("lat"));
	      double lng =Double.parseDouble(multi.getParameter("lng"));
	      String content = multi.getParameter("content");
	      String run = multi.getParameter("run");
	      String Trash = multi.getParameter("Trash");
	      int noticeNumber = Integer.parseInt(multi.getParameter("noticeNumber"));
	      // 이미지 태그에 경로 작성 시 16진수로 적어줘야 해서 인코딩 진행
	      // 그냥 인코딩 하면 파일이 없을 때 오류가 나니까 if문으로
	      String fileName = null;
	      if (multi.getFilesystemName("fileName") != null) {         
	         fileName = URLEncoder.encode(multi.getFilesystemName("image"), "EUC-KR");
	      }
	      System.out.println("(reportPostServiceCon페이지) title : " + title);
	      System.out.println("(reportPostServiceCon페이지) lat :" + lat);
	      System.out.println("(reportPostServiceCon페이지) lng :" + lng);
	      System.out.println("(reportPostServiceCon페이지) 한글주소 : " + content);
	      System.out.println("(reportPostServiceCon페이지) fileName : " + fileName);
	      
	      
	      
	  reviewBoardDTO dto = new reviewBoardDTO(get_memberId,fileName,lat,lng,content,
	    			title,Trash,run);
      reviewBoardDAO dao = new reviewBoardDAO();
      int cnt2 = dao.reviewCheck(noticeNumber,get_memberId);
      int cnt = dao.upload(dto);
      
      if(cnt>0 && cnt2>0) {
         System.out.println("리뷰 성공");
      }else {
         System.out.println("리뷰 실패");
      }
      
      response.sendRedirect("reviewMain.jsp");
      
      
   }

}