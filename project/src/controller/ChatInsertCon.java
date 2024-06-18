package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ChatDAO;

@WebServlet("/ChatInsertCon")
public class ChatInsertCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		System.out.println("ChatInsert 페이지 들어옴");
		
		int chatRoomNum = Integer.parseInt(request.getParameter("chatRoomNum"));
		
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		System.out.println("ChatInsertCon 들어왔음");
		System.out.println( "방번호 : " + chatRoomNum );
		System.out.println( "id : " + id);
		System.out.println( "content : " + content);

		ChatDAO dao = new ChatDAO();
		int cnt = dao.insertChat(chatRoomNum, id, content);
		
		if(cnt > 0 ) {
			System.out.println("채팅 입력성공");
			out.print("채팅입력 성공");
		}else {
			System.out.println("채팅 입력실패");
			out.print("채팅입력 실패");
		}		
	}
}
