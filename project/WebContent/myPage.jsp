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

System.out.println("마이페이지에 인포가 잘 넘어 왔는지 확인 : " + info.getMemberId());
String id = request.getParameter("memberId");

System.out.println("인포안에 정보가 들어있는지 : " + info.getMemberId());
System.out.println("인포안에 정보가 들어있는지 : " + info.getMemberPlogOwn());
System.out.println("인포안에 정보가 들어있는지 : " + info.getMemberPlogCount());

// 포인트를 dto에 추가하려면 일이 커져서 포인트만 추출하는 메소드 만듦
memberDAO pdao = new memberDAO();
String point = pdao.showPoint(info.getMemberId());
System.out.println("포인트 잘 넘어오는지 확인 : " + point);

boardDAO dao = new boardDAO();
ArrayList<boardDTO> board_list = dao.showBoard(info.getMemberId());
System.out.println("board_list가 로그인한 아이디가 쓴 글을 담고 있는지 확인 ");
for(int i =0; i<board_list.size();i++){
   System.out.println( i + "번째 아이디 : " +board_list.get(i).getMemberId());
}



reviewBoardDAO dao1 = new reviewBoardDAO();

ArrayList<reviewBoardDTO> reviewBoard_list = dao1.showBoard1(info.getMemberId());
System.out.println("reviewBoard_list가 로그인한 아이디가 쓴 글을 담고 있는지 확인 ");
for(int i =0; i<reviewBoard_list.size();i++){
   System.out.println( i + "번째 아이디 : " +reviewBoard_list.get(i).getMemberId());
}

%>
	<div >
      <table class="mtable1">
         <tr>
            <td><h2>Plogging</h2></td>
            <td style="text-align:right;">
            <input  type="button" class="topicon" value="회원정보수정"
            onclick="location.href='update.jsp'">
            <input type="button" class="topicon" value="검색">
            <input type="button" class="topicon" value="내정보"
               onClick="location.href='myPage.jsp'"></td>
               
         </tr>
      </table>
  	</div>
 <div align ="right" >
 		<table >
         <h3 class="mypage" ><%=info.getMemberId() %>의 마이페이지</h3></span>
 		</table>
 </div>
 
<div>
	<table class="count" align="right">
		<tr>
			<td>
				<%if(info !=null){%>
					<span><%=info.getMemberPlogCount() %>번 플로깅에 참여하셨습니다!</span>
				<%}else{ %>
					<span>0회 참여하셨습니다.</span>
				<%} %>
			</td>
		</tr>
	</table>

	<table class="count" align="right">
		<tr>
			<td><%if(info !=null){%>
				<span> 현재 포인트는 <%=point %>점 입니다.</span>
			<%}else{ %><span> 회원가입 시, 포인트를 쌓으실 수 있습니다.</span><%} %></td>
		</tr>
	</table>
</div><br>
    <a href="Main.jsp"><button class="back">뒤로가기</button></a><br>
   <div>
   <h3 align="center" style='height:30px;' colspan="2" class="bt">내가 쓴 자유게시글</h3>
        <table border='1px' align="center" class="table">
        <th>번호</th>
      <th>제목</th>
      <th>작성 날짜</th>
      <tr>
      <% for(int i = 0; i<board_list.size();i++){ %>
         <%if(info.getMemberId().equals(board_list.get(i).getMemberId())) {%> 
            <td align="center"><%=i+1 %></td>
               <td class="board">-<a href="viewBoard.jsp?board_num=<%=board_list.get(i).getBoardNum()%>" ><%=board_list.get(i).getBoardTitle()%></a></td>
            	<td><%=board_list.get(i).getBoardDate() %></td>
            </tr>
     <%}} %>
            </table>
            <h3 align="center" style='height:30px;' colspan="2" class="bt">내가 쓴 후기게시글</h3> 
            <table border='1px' align="center" class="table">
            <th>번호</th>
	      	<th>제목</th>
	      	<th>작성 날짜</th>
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
   <div  class="dbutton1" type="button" value="메인" name="main" onClick="location.href='Main.jsp'">메인</div>
   <div class="dbutton2" type="button" value="조회" name="inquiry" onClick="location.href='inquiryMain.jsp'">조회</div>
   <div class="dbutton3" type="button" value="후기" name="review" onClick="location.href='reviewMain.jsp'">후기</div>
   <div class="dbutton4" type="button" value="게시판" name="board" onClick="location.href='Board.jsp'">게시판</div>
   <div class="dbutton5" type="button" value="제보" name="report" onClick="location.href='reportPostWrite.jsp'">제보</div>
</table>

</body>
</html>