package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Model.ChatDAO;
import Model.ChatDTO;

@WebServlet("/ChatSelectCon")
public class ChatSelectCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String chatRoomNum = request.getParameter("chatRoomNum");
		ChatDAO dao = new ChatDAO();
		ArrayList<ChatDTO> list = dao.selectAllChat(chatRoomNum);
		// �ٽ��غ�����
		response.setCharacterEncoding("UTF-8");
		
		/* json �������� ����
		 * [{"num":1,"member_id":"pbk","content":"�ݰ�����","day":"2020-07-12"},
		 * {"num":1,"member_id":"pbk","content":"�ݰ�����","day":"2020-07-12"},
		 * {"num":1,"member_id":"pbk","content":"�ݰ�����","day":"2020-07-12"},
		 * {"num":1,"member_id":"pbk","content":"�ݰ�����","day":"2020-07-12"},
		 * {"num":1,"member_id":"pbk","content":"�ݰ�����","day":"2020-07-12"},
		 * {"num":1,"member_id":"pbk","content":"�ݰ�����","day":"2020-07-12"},
		 * {"num":1,"member_id":"pbk","content":"�ݰ�����","day":"2020-07-12"}]
		 */
		
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String json = gson.toJson(list);
		out.print(json);		
	}
}
