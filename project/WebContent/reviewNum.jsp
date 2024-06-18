<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="Model.notice_BoardDTO"%>
<%@page import="Model.notice_BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.memberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel = "stylesheet" href="reviewNum.css?after">
</head>
<body>
<%
	memberDTO info = (memberDTO)session.getAttribute("info");
	ArrayList<notice_BoardDTO> array2 = new ArrayList<notice_BoardDTO>();
	notice_BoardDAO dao = new notice_BoardDAO();
	array2 = dao.showOne(info.getMemberId());
%>
<form action = "reviewWrite7.jsp">
	<table>
		<%for(int i=0; i<array2.size(); i++){%>
		<input type = "hidden" name ="lat" value ="<%=array2.get(i).getLat()%>">
		<input type = "hidden" name ="lng" value = "<%=array2.get(i).getLng()%>">
		<input type = "hidden" name ="lng" value = "<%=array2.get(i).getLng()%>">
		<input type = "hidden" name ="noticeNumber" value = "<%=array2.get(i).getNoticeNumber()%>">
		<input type = "submit" value = "<%=array2.get(i).getAddr()%>" id="dbutton"></input><br><br>
		<%}%>
	</table>
</form>
</body>
</html>