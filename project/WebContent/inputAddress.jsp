<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/inputAddress.css?after">
<script language="javascript">
//��ưŬ���� javascript ȣ���մϴ�.
function javascript(){
    self.close();   //�ڱ��ڽ�â�� �ݽ��ϴ�.
}
</script>
</head>
<body>
    <table class="mtable1" >
         <tr>
            <td style="text-align:left;">
            	<h2 style="font-size: 50px; padding:0px 30px;">������ ��ġ�� Ŭ���ϼ���.</h2>
            </td>
			<td align="right">
         </tr>
    </table>
    <hr>
    <form action = "reportPostWrite.jsp" method = "post">
		<div id="map"></div>
		<input type="hidden" name="lat" id="lat" onchange="valueChange()">
		<input type="hidden" name="lng" id="lng">
		<div class = "ttt">
		</div>
		<hr>
		<div class="ttt">
			<input type="text" name="addr" id="addr">
			<input type = "submit" class="topicon" value = "����"  float ="right">
		</div>
	</form>
	
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72d306962d4f7f31bb4597d71782852b&libraries=services"></script>
<script><!-- ����������-->
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ���� 
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

// HTML5�� geolocation���� ����� �� �ִ��� Ȯ���մϴ� 
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

// ������ ��Ŀ�� ���������츦 ǥ���ϴ� �Լ��Դϴ�
function displayMarker(locPosition, message) {

    // ��Ŀ�� �����մϴ�
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // ���������쿡 ǥ���� ����
        iwRemoveable = true;

    // ���������츦 �����մϴ�
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // ���������츦 ��Ŀ���� ǥ���մϴ� 
    infowindow.open(map, marker);
    
    // ���� �߽���ǥ�� ������ġ�� �����մϴ�
    map.setCenter(locPosition);      
}
        // ������ Ŭ���� ��ġ�� ǥ���� ��Ŀ�Դϴ�
    var marker = new kakao.maps.Marker({ 
        // ���� �߽���ǥ�� ��Ŀ�� �����մϴ� 
        position: map.getCenter() 
    }); 
    // ������ ��Ŀ�� ǥ���մϴ�
    marker.setMap(map);
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // Ŭ���� ����, �浵 ������ �����ɴϴ� 
    var latlng = mouseEvent.latLng; 
    
    // ��Ŀ ��ġ�� Ŭ���� ��ġ�� �ű�ϴ�
    marker.setPosition(latlng);
    document.getElementById('lat').value = latlng.getLat();
    document.getElementById('lng').value = latlng.getLng();

    var geocoder = new kakao.maps.services.Geocoder();

    var callback = function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            //document.getElementById('a').innerHTML =result[0].address_name ;
            //console.log('�������� �ڵ�:' + result[0].address_name);
        	$('#addr').val(result[0].address_name);
        }
    };

    geocoder.coord2RegionCode(latlng.getLng(),latlng.getLat(),callback);
});

</script>


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