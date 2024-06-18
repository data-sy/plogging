<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="Model.memberDTO"%>
    <%@page import="Model.reviewBoardDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/reviewWrite7.css?after">
<script src="https://kit.fontawesome.com/15d6ad4059.js" crossorigin="anonymous"></script>
<style>
@font-face {
    font-family: 'netmarbleB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.1/netmarbleB.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");

	String lat = request.getParameter("lat");
	String lng = request.getParameter("lng");
	memberDTO info = (memberDTO)session.getAttribute("info");
	String get_memberId = info.getMemberId();
	int noticeNumber = Integer.parseInt(request.getParameter("noticeNumber"));
	
	
	System.out.println(lat);
	System.out.println(lng);
	System.out.println(get_memberId);
	System.out.println(noticeNumber);
	
	reviewBoardDAO dao = new reviewBoardDAO();
%>

<div>
	<table style ="width:100%">
	   <td id ="title" style = "width:124px;">plogging</td>
	      <% if(info != null) { %>
	   <td><i class="far fa-user"  type ="button" value = "������ �˻�" onClick="location.href='myPage.jsp'" id = "myimport" ></i></td>
	      <% }else { %>
      <% } %>
	</table >
	<form action = "reviewWriteServiceCon" method = "post" enctype = "multipart/form-data">
		<table align="center"  style ="width:100%">
			<tr>
				<td >
					<input id="reviewTitle" type = "text" placeholder = "������ �Է��ϼ���." name ="title" >

				</td>
			</tr>
				<td align="left">
					<input style = "width: 400px;
    height: 61px;
    font-size: 35px;"type = "file" name ="image" value="����">
				</td>
			<tr>
				<td id="content">
					<textarea name ="content"  style="resize: none;"></textarea>	
					<input type = "hidden" name ="lat" value ="<%=lat%>">
					<input type = "hidden" name ="lng" value ="<%=lng%>">
					<input type = "hidden" name ="noticeNumber" value ="<%=noticeNumber%>">
				</td>
			</tr>
			<tr>
				<td id = "run">
					�󸶳� �����Ÿ��� �پ�����? : <input type = "text" name ="run" >
				</td>
			</tr>
			<tr>
				<td id="trash" style ="font-size:2em; padding-top:20px;">
					  �󸶳� ���� �����⸦ �ֿ�̳���?(������ ���� ����)<br>
					  <div><input type = "radio" name = "Trash" value = "5L">5L</div>
					  <div><input type = "radio" name = "Trash" value = "10L">10L</div>
					  <div><input type = "radio" name = "Trash" value = "15L">15L</div>
					  <div><input type = "radio" name = "Trash" value = "20L">20L</div>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="����"></td>
			</tr>
		</table>
		<br><br><br><br><br><br><br><br><br>
<table>
<div id="down"></div>
   <div  class="dbutton1" type="button" value="����" name="main" onClick="location.href='Main.jsp'">����</div>
   <div class="dbutton2" type="button" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'">��ȸ</div>
   <div class="dbutton3" type="button" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'">�ı�</div>
   <div class="dbutton4" type="button" value="�Խ���" name="board" onClick="location.href='Board.jsp'">�Խ���</div>
   <div class="dbutton5" type="button" value="����" name="report" onClick="location.href='reportPostWrite.jsp'">����</div>
</table>
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git
	</form>
</div>
</body>
</html>