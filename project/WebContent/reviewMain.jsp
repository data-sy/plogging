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
   <td><i class="far fa-user"  type ="button" value = "������ �˻�" onClick="location.href='myPage.jsp'" id = "myimport" ></i></td>
</tr>
</table>
<div id="map"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72d306962d4f7f31bb4597d71782852b&libraries=services"></script>
	
   <div><!-- 123 -->
   <table>
   <tr>
     <td id ="reviewTitle" style = "border-bottom:3px solid">�ı�Խ���<i class="fas fa-plus" type="button" onClick="location.href='reviewNum.jsp'" id ="button"></i></td>
      </table>
      <form action = "Review8.jsp" method = "post">
      <table border='0px' style='height:100px;'>
      <%for(int i = 0; i<array.size();i++){%>
         <tr style = "border-bottom:1px">
             <td id="membertitle"> <a href = "Review8.jsp?reviewNumber=<%=array.get(i).getReviewNumber()%>">-  <%=array.get(i).getTitle()%></a></td>
             <td id ="name">�ۼ��� : <%=array.get(i).getMemberId() %></td>
         </tr>
         <%} %>
      </table>
      </form>
   </div>
<table>
<table>
<div id="down"></div>
   <div  class="dbutton1" type="button" value="����" name="main" onClick="location.href='Main.jsp'">����</div>
   <div class="dbutton2" type="button" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'">��ȸ</div>
   <div class="dbutton3" type="button" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'">�ı�</div>
   <div class="dbutton4" type="button" value="�Խ���" name="board" onClick="location.href='Board.jsp'">�Խ���</div>
   <div class="dbutton5" type="button" value="����" name="report" onClick="location.href='reportPostWrite.jsp'">����</div>
</table>
<script>
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    };
// ������ �����մϴ�    
var map = new kakao.maps.Map(mapContainer, mapOption); 

if (navigator.geolocation) {
    
    // GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // ����
            lon = position.coords.longitude; // �浵
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� �����մϴ�
            message = '<div style="padding:5px;">���⿡ ��Ű���?!</div>'; // ���������쿡 ǥ�õ� �����Դϴ�
        
        // ��Ŀ�� ���������츦 ǥ���մϴ�
        displayMarker(locPosition, message);
         
      });
    
} else { // HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation�� ����Ҽ� �����..'
        
    displayMarker(locPosition, message);
}



	<%for(int i=0; i<array.size();i++){%>

	    // ��Ŀ�� �����մϴ�
	    var marker = new kakao.maps.Marker({
	    	
	    	position: new kakao.maps.LatLng(<%=array.get(i).getLat()%>, <%=array.get(i).getLng()%>)
	    	// ��Ŀ�� ��ġ

	    });
		
	    marker.setMap(map);
	    
	    var iwContent = '<div style="padding:5px;">Hello World! <br><a  href="Review8.jsp?reviewNumber=<%=array.get(i).getReviewNumber()%>"style="color:blue" target="_self"><%=array.get(i).getTitle()%></a></div>', // ���������쿡 ǥ��� �������� HTML ���ڿ��̳� document element�� �����մϴ�
	    iwPosition = new kakao.maps.LatLng(<%=array.get(i).getLat()%>,<%=array.get(i).getLng()%>); //���������� ǥ�� ��ġ�Դϴ�

		// ���������츦 �����մϴ�
		var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	    infowindow.open(map, marker);
<%}%>

</script>
</body>
</html>