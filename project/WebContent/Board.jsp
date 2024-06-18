<%@page import="Model.memberDTO"%>
<%@page import="Model.boardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/15d6ad4059.js" crossorigin="anonymous"></script>
<style>
@font-face {
    font-family: 'netmarbleB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.1/netmarbleB.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
<link rel = "stylesheet" href="css/Board.css?after">
<script src="https://kit.fontawesome.com/15d6ad4059.js" crossorigin="anonymous"></script>
</head>
<body  style = "background-color: #ffffff">


<%
	
	memberDTO info = (memberDTO)session.getAttribute("info");	
	
	boardDAO dao = new boardDAO();
	// ��� �Խñ��� �ֽż����� ���� �޼ҵ�
	ArrayList<boardDTO> board_list = dao.board_li();
	
%>
	<div class="header">
      <table>
         <tr>
   <div style = "background: #FEEDCC;
    width: 991px;
    height: 99px;
    position: absolute;
    z-index: -1;
    margin: -7px 0px 0px -8px;"><td id="title" style=" font-family: 'netmarbleB';">Plogging</td></div>
            <td align="right">
            <td align="center"><i class="far fa-user"  type ="button" value = "������ �˻�" onClick="location.href='myPage.jsp'" id = "myimport" ></i></td>
         </tr>
      </table>
  	</div>
	<div><h2 style ="margin: 30px 0px 30px 35px;font-size: 3em;"> - ���� �Խ��� <i style = "font-size: 64px;
    margin: 0px 20px 0px 0px;
    padding: 0px 0px 0px 0px;"class="fas fa-plus" type="button" onClick="location.href='BoardWrite9.jsp'"  id ="button"></i></h2>
	
		<table border='1px' style='height:100px;' align="center">
			<tr align="center" style="font-size:20px;">
				<td style = "font-size:2em">��ȣ</td>

				<!-- �Խù�ȣ�� �� �Ѿ���� Ȯ�� �� ���� .���߿� ����� -->
				
				<td style = "font-size:24px">����</td>
				<td style = "font-size:24px">�ۼ���</td>
				<td style = "font-size:24px">����</td>
				<td style = "font-size:24px">�ۼ�����</td>
			</tr>
		<% for(int i = 0; i<board_list.size();i++){ %>
      		<tr align="center" style="font-size:25px;">
         		<td><%=i+1 %></td>
          		<td ><a style="font-size:25px;" href="viewBoard.jsp?boardNum=<%=board_list.get(i).getBoardNum()%>"><%=board_list.get(i).getBoardTitle()%></a></td>
				<td><%=board_list.get(i).getMemberId() %></td>
				<td><%=board_list.get(i).getBoardImage() %></td>
				<td><%=board_list.get(i).getBoardDate() %></td>
			</tr>
		<% } %>
		</table>
	</div>
<br><br><br><br><br><br><br><br>
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