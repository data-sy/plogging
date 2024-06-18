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

@WebServlet("/updateServiceCon")
public class updateServiceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		memberDTO info = (memberDTO) session.getAttribute("info");
		String memberId= info.getMemberId();

		request.setCharacterEncoding("EUC-KR");
        String memberPw = request.getParameter("pass");
        String memberName = request.getParameter("name");
        int memberAge = Integer.parseInt(request.getParameter("age"));              

        System.out.println("memberId : "+ memberId);
        System.out.println("memberPw : "+ memberPw);
        System.out.println("memberName : "+ memberName);
        System.out.println("memberAge : "+ memberAge);


        memberDTO dto = new memberDTO(memberId, memberPw, memberName, memberAge);
        
        memberDAO dao = new memberDAO();
        int cnt = dao.update(dto);
        System.out.println(cnt);

        String moveURL = "";
        if(cnt>0) {
           System.out.println("회원정보 수정 성공");
           moveURL = "myPage.jsp";
        }else {
           System.out.println("회원정보 수정 실패");
           moveURL = "update.jsp";
        }
        response.sendRedirect(moveURL);	
	}
	
}
