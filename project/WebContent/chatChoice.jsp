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
<!-- 원래 채팅방 목록 페이지라서 chatChoice 였는데 , 자기가 신청한 공고 목록 페이지로 바뀜 -->

<%	
	memberDTO info = (memberDTO)session.getAttribute("info");

	ArrayList<notice_BoardDTO> array = new ArrayList<notice_BoardDTO>();
	notice_BoardDAO dao = new notice_BoardDAO();
	if (info!=null){
		array = dao.showMyNotice(info.getMemberId());
		for(int i =0; i<array.size(); i++){
			System.out.print(" 공고 번호  : " + array.get(i).getNoticeNumber() );
		}
	} 
%>


<table>
<tr>
   <td>싸이트명</td>
   <td ><input type ="button" value = "내정보 검색" onClick="location.href='myPage.jsp'"></td>
   <td style = "float : right"><input type ="button" value = "검색"></td>
</tr>
</table>
<table>
<tr>
	<% if(info != null) { %>
	<td><%= info.getMemberId() %> 님</td>
		<% }else { %>
	<td> 로그인해주세요 </td>
		<% } %>
	<% if(info != null) { %>
	<td><input type ="button" value = "로그아웃" onClick="location.href='logoutServiceCon'"></td>
		<% }else { %>
	<td> <input type ="button" value = "로그인" onClick="location.href='Login.jsp'"> </td>
		<% } %>
	<td><input type ="button" value = "회원가입" onClick="location.href='Join.jsp'"></td>
</tr>
</table>		
<table>
	<div class="searchbox">
    	<div class="header">
        	<div>Search</div>
            <input onkeyup="filter()" type="text" id="value" placeholder="간략한 주소지를 입력해주세요">
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
   <div  class="dbutton1" type="button" value="메인" name="main" onClick="location.href='Main.jsp'">메인</div>
   <div class="dbutton2" type="button" value="조회" name="inquiry" onClick="location.href='inquiryMain.jsp'">조회</div>
   <div class="dbutton3" type="button" value="후기" name="review" onClick="location.href='reviewMain.jsp'">후기</div>
   <div class="dbutton4" type="button" value="게시판" name="board" onClick="location.href='Board.jsp'">게시판</div>
   <div class="dbutton5" type="button" value="제보" name="report" onClick="location.href='reportPostWrite.jsp'">제보</div>
</table>
</body>
</html>