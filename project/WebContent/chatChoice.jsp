<%@page import="Model.ChatDAO"%>
<%@page import="Model.noticejoinDAO"%>
<%@page import="Model.notice_BoardDAO"%>
<%@page import="Model.notice_BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel = "stylesheet" href="css/chatChoice.css?after">
</head>
<body>
<!-- ���� ä�ù� ��� �������� chatChoice ���µ� , �ڱⰡ ��û�� ���� ��� �������� �ٲ� -->

<%	
	memberDTO info = (memberDTO)session.getAttribute("info");

	ArrayList<notice_BoardDTO> array = new ArrayList<notice_BoardDTO>();
	notice_BoardDAO dao = new notice_BoardDAO();
	if (info!=null){
		array = dao.showMyNotice(info.getMemberId());
		for(int i =0; i<array.size(); i++){
			System.out.print(" ���� ��ȣ  : " + array.get(i).getNoticeNumber() );
		}
	} 
%>


<table>
<tr>
   <td>����Ʈ��</td>
   <td ><input type ="button" value = "������ �˻�" onClick="location.href='myPage.jsp'"></td>
   <td style = "float : right"><input type ="button" value = "�˻�"></td>
</tr>
</table>
<table>
<tr>
	<% if(info != null) { %>
	<td><%= info.getMemberId() %> ��</td>
		<% }else { %>
	<td> �α������ּ��� </td>
		<% } %>
	<% if(info != null) { %>
	<td><input type ="button" value = "�α׾ƿ�" onClick="location.href='logoutServiceCon'"></td>
		<% }else { %>
	<td> <input type ="button" value = "�α���" onClick="location.href='Login.jsp'"> </td>
		<% } %>
	<td><input type ="button" value = "ȸ������" onClick="location.href='Join.jsp'"></td>
</tr>
</table>		
<table>
	<div class="searchbox">
    	<div class="header">
        	<div>Search</div>
            <input onkeyup="filter()" type="text" id="value" placeholder="������ �ּ����� �Է����ּ���">
        </div>
		<div class="container">
           	<% if(info != null) { %>
				<% for(int i=0; i<array.size(); i++){ %>
		            <div class = "item"><span style="color: green;"><br>
			            <span>
			            <!-- 	<input
			             -->
						</span>
					</div>
			<%} %>
	<%} %>
		</div>
</table>

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