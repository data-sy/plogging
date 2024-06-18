package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Model.boardDAO;
import Model.boardDTO;

@WebServlet("/BoardWriteServiceCon")
public class BoardWriteServiceCon extends HttpServlet {
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      request.setCharacterEncoding("EUC-KR");
      
      String savePath = request.getServletContext().getRealPath("img");
      System.out.println(savePath);
      
      int maxSize = 5*1024*1024;
      String encoding = "EUC-KR";
      // cos자르 안에있는 multipartRequest class를 계속 못찾는ㄴ거 같은데.. 일단 팀원 파일을 카톡으로 받아서 진행해봐요 
      // 놕놕 똑똑 ?>보고있나유?>네네
      ///// 팀원들 파일이 뭘까요...그
      // 잘되는 파일을 받아서 해야 할거같은데요 기트 꺼 말구 
      // cos.jar를요?아니요 프로젝트 파일을요 소연씨가 이해했으니 일단 소연씨꺼를 받아야 할거가타요
      //넵
      MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());

      String boardTitle = multi.getParameter("title");
      String boardContent = multi.getParameter("textarea");
      String boardImage = null;
      if (multi.getFilesystemName("fileName") != null) {         
         boardImage = URLEncoder.encode(multi.getFilesystemName("fileName"), "EUC-KR");
      }
      System.out.println(boardTitle);
      System.out.println(boardContent);
      System.out.println(boardImage);
      
      boardDTO dto = new boardDTO( boardContent,boardTitle, boardImage );
      boardDAO dao = new boardDAO();
      int cnt = dao.upload(dto);
      
      if(cnt>0) {
         System.out.println("이미지 업로드 성공");
      }else {
         System.out.println("이미지 업로드 실패");
      }
      response.sendRedirect("Board.jsp");

   }

}