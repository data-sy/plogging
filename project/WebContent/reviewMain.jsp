<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="Model.reviewBoardDTO"%>
	<%@page import="Model.reviewBoardDAO"%>
	<%@page import="java.util.ArrayList"%>
	<%@page import="Model.memberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/15d6ad4059.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/reviewMain.css?after">
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
ArrayList<reviewBoardDTO> array = new ArrayList<reviewBoardDTO>();
reviewBoardDAO dao = new reviewBoardDAO();
array = dao.showBoard();
%>
<table>
<tr>
   <div style = "background: #FEEDCC;
    width: 991px;
    height: 139px;
    position: absolute;
    z-index: -1;
    margin: -7px 0px 0px -8px;"><td id="title" style=" font-family: 'netmarbleB';">Plogging</td></div>
   <td><i class="far fa-user"  type ="button" value = "내정보 검색" onClick="location.href='myPage.jsp'" id = "myimport" ></i></td>
</tr>
</table>
<div id="map"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72d306962d4f7f31bb4597d71782852b&libraries=services"></script>
	
   <div><!-- 123 -->
   <table>
   <tr>
     <td id ="reviewTitle" style = "border-bottom:3px solid">후기게시판<i class="fas fa-plus" type="button" onClick="location.href='reviewNum.jsp'" id ="button"></i></td>
      </table>
      <form action = "Review8.jsp" method = "post">
      <table border='0px' style='height:100px;'>
      <%for(int i = 0; i<array.size();i++){%>
         <tr style = "border-bottom:1px">
             <td id="membertitle"> <a href = "Review8.jsp?reviewNumber=<%=array.get(i).getReviewNumber()%>">-  <%=array.get(i).getTitle()%></a></td>
             <td id ="name">작성자 : <%=array.get(i).getMemberId() %></td>
         </tr>
         <%} %>
      </table>
      </form>
   </div>
<table>
<table>
<div id="down"></div>
   <div  class="dbutton1" type="button" value="메인" name="main" onClick="location.href='Main.jsp'">메인</div>
   <div class="dbutton2" type="button" value="조회" name="inquiry" onClick="location.href='inquiryMain.jsp'">조회</div>
   <div class="dbutton3" type="button" value="후기" name="review" onClick="location.href='reviewMain.jsp'">후기</div>
   <div class="dbutton4" type="button" value="게시판" name="board" onClick="location.href='Board.jsp'">게시판</div>
   <div class="dbutton5" type="button" value="제보" name="report" onClick="location.href='reportPostWrite.jsp'">제보</div>
</table>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
         
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}



	<%for(int i=0; i<array.size();i++){%>

	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	    	
	    	position: new kakao.maps.LatLng(<%=array.get(i).getLat()%>, <%=array.get(i).getLng()%>)
	    	// 마커의 위치

	    });
		
	    marker.setMap(map);
	    
	    var iwContent = '<div style="padding:5px;">Hello World! <br><a  href="Review8.jsp?reviewNumber=<%=array.get(i).getReviewNumber()%>"style="color:blue" target="_self"><%=array.get(i).getTitle()%></a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = new kakao.maps.LatLng(<%=array.get(i).getLat()%>,<%=array.get(i).getLng()%>); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	    infowindow.open(map, marker);
<%}%>

</script>
</body>
</html>