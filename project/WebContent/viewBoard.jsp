<%@page import="Model.boardReDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.boardReDAO"%>
<%@page import="Model.memberDTO"%>
<%@page import="Model.boardDTO"%>
<%@page import="Model.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Forty by HTML5 UP</title>
	<meta charset="utf-8" />
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
	<!--<link rel="stylesheet" href="assetsBoard/css/main.css" />-->
	<!--<link rel="stylesheet" href="assetsBoard/css/board.css" />-->
	<script src="https://kit.fontawesome.com/15d6ad4059.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="css/viewBoard.css?after">
	<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	<script type="text/javascript">
	</script>
</head>
<body>

<%
   memberDTO info = (memberDTO)session.getAttribute("info");
	if(info!=null){
	   System.out.println("info의 id 확인 : " + info.getMemberId());
	}
   int boardNum = Integer.parseInt(request.getParameter("boardNum"));   
   System.out.println("Board에서 viewBoard로 board_num가 잘 넘어왔는지 확인 : "+ boardNum);
   
   boardDAO dao = new boardDAO();
   // 게시번호에 맞는 게시글 정보들을 담는 메소드
   boardDTO dto = dao.showOne(boardNum);
   System.out.println("dto의 게시번호 확인 : " + dto.getBoardNum());
   System.out.println("dto의 게시사람id 확인 : " + dto.getMemberId());
   System.out.println("dto의 게시날짜 확인 : " + dto.getBoardDate());
   System.out.println("dto의 게시내용 확인 : " + dto.getBoardContent());
   System.out.println("dto의 게시제목 확인 : " + dto.getBoardTitle());
   System.out.println("dto의 게시이미지 확인 : " + dto.getBoardImage());
    
   boardReDAO dao1= new boardReDAO();
   ArrayList<boardReDTO> boardRe_list= dao1.boardRe_li(boardNum);
%>
<table>
	<tr>
		<div style = "background: #FEEDCC;
				width: 991px;
				height: 139px;
				position: absolute;
		   		z-index: -1;
		   		margin: -7px 0px 0px -8px;">
		<td id="title" style=" font-family: 'netmarbleB';">Plogging</td>
		<% if(info != null) { %>
			<td>
				<i id="myimport" class="far fa-user" type="button" value="내정보 검색" onClick="location.href='myPage.jsp'" ></i>
			</td>
		<% }else { %>
			<td>
				<a id="myimport" onClick="location.href='Login.jsp'">
					<img id='login' src= "login.png" style ="margin:10px 10px 0px 10px; width:30px;" >
					로그인
				</a>
			</td>
		<% } %>
	</tr>
</table>

	<div class="board">     
		<table>
			<tr>
				<td colspan="2" id="gettitle">제목 : <%= dto.getBoardTitle()%></td>
			</tr>
            <tr>
				<td id ="date" > 작성 일자 : <%=dto.getBoardDate() %> </td>   
				<td id ="memberId" > 작성자 : <%=dto.getMemberId() %> </td>
            </tr>
            <tr>
   		</table>
   	<hr>
   		<table>
            <tr>
               <td colspan="2" id="content" height="600px">
                  <% if(dto.getBoardImage()!=null) {%>
                      <img src="img/<%=dto.getBoardImage()%>">
                    <% } %>
                    <% if(dto.getBoardContent()!=null) {%>
                       <%= dto.getBoardContent() %>
                    <% } %>
                </td>
            </tr>
		</table>
   	<hr>
		<table>
			<tr>
				<%if(info!=null){ %>
					<%if(info.getMemberId().equals(dto.getMemberId())) {%> 
                  		<td><a href="DeleteOneServiceCon?num=<%=dto.getBoardNum()%>">삭제 </a></td>
                   <%}else{%>
                   		<td></td>
                   <%} %>
                <%}else{ %>
                <td></td>
                <%} %>
				<td style="text-align:right"><a href="Board.jsp"><button class="dbuttonRe">뒤로가기</button></a></td>
	         </tr>
       </table>
	</div>	
<br>
<br>

   	<hr>

	<div class="board">     
		<table>
			<tr>
				<td colspan="2" id="re">댓글</td>
			</tr>
			<% for(int i = 0; i<boardRe_list.size();i++){ %>
				<tr>
					<td id ="memberId" ><%=boardRe_list.get(i).getMemberID()%></td>
					<td style="padding:8px"><%=boardRe_list.get(i).getCommentsContents()%></td>
				</tr>
			<%} %>
		</table>
	</div>

<br>

<form action="ReBoardServiceCon" method="post">
	<input type="hidden" value="<%=boardNum%>" name="boardNum">
		<table>
			<tr>
				<td colspan="4" id="re">댓글</td>
			</tr>
			<tr>
				<td id ="memberId" >이름</td>
				<td>
					<%if(info!=null){ %>
						<span><%=info.getMemberId() %></span>
					<%}else{ %>
						<input class="tex" type="text" name="name">
					<% } %>
				</td>
				<td style="text-align:right;">비밀번호</td>
				<td><input class="tex" type="password" name="password"></td>
				<td></td>
			</tr>
			<tr>
				<td id ="memberId" >내용</td>
				<td colspan="3">
				<textarea class="tex" style="width:85%" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td>
				<input class="dbuttonRe" type="reset" value="다시쓰기">
				</td>
				<td colspan="2"></td>
				<td style="text-align:right; padding:0px 20px;" >
				<input class="dbuttonRe" type="submit" value="저장" name="cmd">
				</td>
				
			</tr>
		</table>
</form>
   
<br><br><br>    
<br><br><br>    
<br><br><br>     
<table>
<table>
<div id="down"></div>
   <div  class="dbutton1" type="button" value="메인" name="main" onClick="location.href='Main.jsp'">메인</div>
   <div class="dbutton2" type="button" value="조회" name="inquiry" onClick="location.href='inquiryMain.jsp'">조회</div>
   <div class="dbutton3" type="button" value="후기" name="review" onClick="location.href='reviewMain.jsp'">후기</div>
   <div class="dbutton4" type="button" value="게시판" name="board" onClick="location.href='Board.jsp'">게시판</div>
   <div class="dbutton5" type="button" value="제보" name="report" onClick="location.href='reportPostWrite.jsp'">제보</div>
</table>  
<!-- Scripts -->
 <!--  <script src="assets/js/jquery.min.js"></script>-->
 <!--  <script src="assets/js/jquery.scrolly.min.js"></script>-->
 <!--  <script src="assets/js/jquery.scrollex.min.js"></script>-->
 <!--  <script src="assets/js/skel.min.js"></script>-->
 <!--  <script src="assets/js/util.js"></script>-->
   <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
  <!--  <script src="assets/js/main.js"></script>-->
</body>
</html>