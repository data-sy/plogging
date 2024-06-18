<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="Model.reviewBoardDTO"%>
	<%@page import="Model.reviewBoardDAO"%>
	<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/15d6ad4059.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/review8.css?after">
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
	int reviewNumber = Integer.parseInt(request.getParameter("reviewNumber"));
	
	System.out.println("reviewNumber : "+reviewNumber);
    reviewBoardDAO dao = new reviewBoardDAO();
    reviewBoardDTO dto = dao.showOne(reviewNumber);
%>
<div>
	<table>
		<tr>
			<div style = "background: #FEEDCC;
				width: 991px;
				height: 139px;
				position: absolute;
		   		z-index: -1;
		   		margin: -7px 0px 0px -8px;">
		    	<td id="title" style=" font-family: 'netmarbleB';">Plogging</td>
		    </div>
		    <td>
		    	<i class="far fa-user"  type ="button" value = "내정보 검색" onClick="location.href='myPage.jsp'" id = "myimport" ></i>
		    </td>
		</tr>
	</table>

	<form action = "" method = "post">
		<table id="1stTable">
			<tr>
				<td colspan = "4" id="gettitle">
					<%=dto.getTitle() %>
				
				</td>
			</tr>
			<tr style="width:100%">
				<td id = "date">작성 일자: <%=dto.getReviewDate() %> </td>
				<td id ="memberId">작성자: <%=dto.getMemberId() %> </td>
			</tr>
			<tr>
				<td colspan = "3" id="map"align ='center'></td>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72d306962d4f7f31bb4597d71782852b&libraries=services"></script>
			</tr>
			<tr> 
				<td colspan = "4" height = "600px" id="content"><%=dto.getContents() %> </td>
			</tr>
				<td style="padding: 45px 0px 0px 40px; font-size:40px; text-align:center;"> 쓰레기 양:  <p id = "val"><%=dto.getTrash() %></p></td>
				<td style="padding: 42px 0px 0px 45px; font-size:40px;text-align:center;"> 플로깅 거리 : <p id = "val"><%=dto.getRun()%></p></td>
			</tr>
			<tr>
				<td>
					<div>
						<div ><input id="re" "type = "submit" value = "수정"> </div>
						<div ><input id="del" type = "submit" value = "삭제"> </div>
					</div>
				</td>
			</tr>
			
			<table>	
				<div id="down"></div>
				<div class="dbutton1" type="button" value="메인" name="main" onClick="location.href='Main.jsp'">메인</div>
				<div class="dbutton2" type="button" value="조회" name="inquiry" onClick="location.href='inquiryMain.jsp'">조회</div>
				<div class="dbutton3" type="button" value="후기" name="review" onClick="location.href='reviewMain.jsp'">후기</div>
				<div class="dbutton4" type="button" value="게시판" name="board" onClick="location.href='Board.jsp'">게시판</div>
				<div class="dbutton5" type="button" value="제보" name="report" onClick="location.href='reportPostWrite.jsp'">제보</div>
			</table>
	</form>
	<br><br><br><br><br><br><br><br><br>
</div>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(<%=dto.getLat()%>, <%=dto.getLng()%>), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	    	
	    	position: new kakao.maps.LatLng(<%=dto.getLat()%>, <%=dto.getLng()%>)
	    	// 마커의 위치
	    });
		
	    marker.setMap(map);
	    
</script>
</body>
</html>