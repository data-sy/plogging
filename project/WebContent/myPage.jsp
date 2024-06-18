<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="Model.memberDTO"%>
<%@page import="Model.memberDAO"%>
<%@page import="Model.reviewBoardDTO"%>
<%@page import="Model.reviewBoardDAO"%>
<%@page import="Model.boardDTO"%>
<%@page import="Model.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel = "stylesheet" href="css/mypage.css?after">
</head>
<body>
<%
memberDTO info = (memberDTO)session.getAttribute("info");

System.out.println("������������ ������ �� �Ѿ� �Դ��� Ȯ�� : " + info.getMemberId());
String id = request.getParameter("memberId");

System.out.println("�����ȿ� ������ ����ִ��� : " + info.getMemberId());
System.out.println("�����ȿ� ������ ����ִ��� : " + info.getMemberPlogOwn());
System.out.println("�����ȿ� ������ ����ִ��� : " + info.getMemberPlogCount());

// ����Ʈ�� dto�� �߰��Ϸ��� ���� Ŀ���� ����Ʈ�� �����ϴ� �޼ҵ� ����
memberDAO pdao = new memberDAO();
String point = pdao.showPoint(info.getMemberId());
System.out.println("����Ʈ �� �Ѿ������ Ȯ�� : " + point);

boardDAO dao = new boardDAO();
ArrayList<boardDTO> board_list = dao.showBoard(info.getMemberId());
System.out.println("board_list�� �α����� ���̵� �� ���� ��� �ִ��� Ȯ�� ");
for(int i =0; i<board_list.size();i++){
   System.out.println( i + "��° ���̵� : " +board_list.get(i).getMemberId());
}



reviewBoardDAO dao1 = new reviewBoardDAO();

ArrayList<reviewBoardDTO> reviewBoard_list = dao1.showBoard1(info.getMemberId());
System.out.println("reviewBoard_list�� �α����� ���̵� �� ���� ��� �ִ��� Ȯ�� ");
for(int i =0; i<reviewBoard_list.size();i++){
   System.out.println( i + "��° ���̵� : " +reviewBoard_list.get(i).getMemberId());
}

%>
	<div >
      <table class="mtable1">
         <tr>
            <td><h2>Plogging</h2></td>
            <td style="text-align:right;">
            <input  type="button" class="topicon" value="ȸ����������"
            onclick="location.href='update.jsp'">
            <input type="button" class="topicon" value="�˻�">
            <input type="button" class="topicon" value="������"
               onClick="location.href='myPage.jsp'"></td>
               
         </tr>
      </table>
  	</div>
 <div align ="right" >
 		<table >
         <h3 class="mypage" ><%=info.getMemberId() %>�� ����������</h3></span>
 		</table>
 </div>
 
<div>
	<table class="count" align="right">
		<tr>
			<td>
				<%if(info !=null){%>
					<span><%=info.getMemberPlogCount() %>�� �÷α뿡 �����ϼ̽��ϴ�!</span>
				<%}else{ %>
					<span>0ȸ �����ϼ̽��ϴ�.</span>
				<%} %>
			</td>
		</tr>
	</table>

	<table class="count" align="right">
		<tr>
			<td><%if(info !=null){%>
				<span> ���� ����Ʈ�� <%=point %>�� �Դϴ�.</span>
			<%}else{ %><span> ȸ������ ��, ����Ʈ�� ������ �� �ֽ��ϴ�.</span><%} %></td>
		</tr>
	</table>
</div><br>
    <a href="Main.jsp"><button class="back">�ڷΰ���</button></a><br>
   <div>
   <h3 align="center" style='height:30px;' colspan="2" class="bt">���� �� �����Խñ�</h3>
        <table border='1px' align="center" class="table">
        <th>��ȣ</th>
      <th>����</th>
      <th>�ۼ� ��¥</th>
      <tr>
      <% for(int i = 0; i<board_list.size();i++){ %>
         <%if(info.getMemberId().equals(board_list.get(i).getMemberId())) {%> 
            <td align="center"><%=i+1 %></td>
               <td class="board">-<a href="viewBoard.jsp?board_num=<%=board_list.get(i).getBoardNum()%>" ><%=board_list.get(i).getBoardTitle()%></a></td>
            	<td><%=board_list.get(i).getBoardDate() %></td>
            </tr>
     <%}} %>
            </table>
            <h3 align="center" style='height:30px;' colspan="2" class="bt">���� �� �ı�Խñ�</h3> 
            <table border='1px' align="center" class="table">
            <th>��ȣ</th>
	      	<th>����</th>
	      	<th>�ۼ� ��¥</th>
         <% for(int i = 0; i<reviewBoard_list.size();i++){ %>
           <%if(info.getMemberId().equals(reviewBoard_list.get(i).getMemberId())) {%>           
            <tr>
            <td><%=i+1 %></td>
             <td>-<a href="Review8.jsp?reviewNumber=<%=reviewBoard_list.get(i).getReviewNumber()%>"><%=reviewBoard_list.get(i).getTitle()%></a></td>
            <td><%=reviewBoard_list.get(i).getReviewDate() %></td>
            </tr>
        <%}} %>
         </table>
        
         <br>
   </div>   
   <br><br><br><br>
   <br>
<table>
<div id="down"></div>
   <div  class="dbutton1" type="button" value="����" name="main" onClick="location.href='Main.jsp'">����</div>
   <div class="dbutton2" type="button" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'">��ȸ</div>
   <div class="dbutton3" type="button" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'">�ı�</div>
   <div class="dbutton4" type="button" value="�Խ���" name="board" onClick="location.href='Board.jsp'">�Խ���</div>
   <div class="dbutton5" type="button" value="����" name="report" onClick="location.href='reportPostWrite.jsp'">����</div>
</table>

</body>
</html>