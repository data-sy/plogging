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
      // cos�ڸ� �ȿ��ִ� multipartRequest class�� ��� ��ã�¤��� ������.. �ϴ� ���� ������ ī������ �޾Ƽ� �����غ��� 
      // ���� �ȶ� ?>�����ֳ���?>�׳�
      ///// ������ ������ �����...��
      // �ߵǴ� ������ �޾Ƽ� �ؾ� �ҰŰ������� ��Ʈ �� ���� 
      // cos.jar����?�ƴϿ� ������Ʈ �������� �ҿ����� ���������� �ϴ� �ҿ������� �޾ƾ� �ҰŰ�Ÿ��
      //��
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
         System.out.println("�̹��� ���ε� ����");
      }else {
         System.out.println("�̹��� ���ε� ����");
      }
      response.sendRedirect("Board.jsp");

   }

}