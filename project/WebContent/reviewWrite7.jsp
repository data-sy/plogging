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
	   <td><i class="far fa-user"  type ="button" value = "내정보 검색" onClick="location.href='myPage.jsp'" id = "myimport" ></i></td>
	      <% }else { %>
      <% } %>
	</table >
	<form action = "reviewWriteServiceCon" method = "post" enctype = "multipart/form-data">
		<table align="center"  style ="width:100%">
			<tr>
				<td >
					<input id="reviewTitle" type = "text" placeholder = "제목을 입력하세요." name ="title" >

				</td>
			</tr>
				<td align="left">
					<input style = "width: 400px;
    height: 61px;
    font-size: 35px;"type = "file" name ="image" value="사진">
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
					얼마나 많은거리르 뛰었나요? : <input type = "text" name ="run" >
				</td>
			</tr>
			<tr>
				<td id="trash" style ="font-size:2em; padding-top:20px;">
					  얼마나 많은 쓰레기를 주우셨나요?(종량제 봉투 기준)<br>
					  <div><input type = "radio" name = "Trash" value = "5L">5L</div>
					  <div><input type = "radio" name = "Trash" value = "10L">10L</div>
					  <div><input type = "radio" name = "Trash" value = "15L">15L</div>
					  <div><input type = "radio" name = "Trash" value = "20L">20L</div>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="제출"></td>
			</tr>
		</table>
		<br><br><br><br><br><br><br><br><br>
<table>
<div id="down"></div>
   <div  class="dbutton1" type="button" value="메인" name="main" onClick="location.href='Main.jsp'">메인</div>
   <div class="dbutton2" type="button" value="조회" name="inquiry" onClick="location.href='inquiryMain.jsp'">조회</div>
   <div class="dbutton3" type="button" value="후기" name="review" onClick="location.href='reviewMain.jsp'">후기</div>
   <div class="dbutton4" type="button" value="게시판" name="board" onClick="location.href='Board.jsp'">게시판</div>
   <div class="dbutton5" type="button" value="제보" name="report" onClick="location.href='reportPostWrite.jsp'">제보</div>
</table>
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git
	</form>
</div>
</body>
</html>