<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel = "stylesheet" href="css/address.css?after">
</head>
<body>
<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            箸獣 爽社 衣引亜 設公 蟹神澗 井酔拭澗 食奄拭 薦左背爽室推.
        </a>
    </em>
</p>
<div id="map" style="width:100%;height:350px;"></div>
<br><br><br><br><br><br><br><br>
<table>
<div id="down"></div>
   <div  class="dbutton1" type="button" value="五昔" name="main" onClick="location.href='Main.jsp'">五昔</div>
   <div class="dbutton2" type="button" value="繕噺" name="inquiry" onClick="location.href='inquiryMain.jsp'">繕噺</div>
   <div class="dbutton3" type="button" value="板奄" name="review" onClick="location.href='reviewMain.jsp'">板奄</div>
   <div class="dbutton4" type="button" value="惟獣毒" name="board" onClick="location.href='Board.jsp'">惟獣毒</div>
   <div class="dbutton5" type="button" value="薦左" name="report" onClick="location.href='reportPostWrite.jsp'">薦左</div>
</table>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3bced30872f8da5c8764563d13d480e7&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 走亀研 妊獣拝 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 走亀税 掻宿疎妊
        level: 3 // 走亀税 溌企 傾婚
    };  

// 走亀研 持失杯艦陥    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 爽社-疎妊 痕発 梓端研 持失杯艦陥
var geocoder = new kakao.maps.services.Geocoder();

// 爽社稽 疎妊研 伊事杯艦陥
geocoder.addressSearch('韻爽 疑姥 森綬掩 31-15', function(result, status) {

    // 舛雌旋生稽 伊事戚 刃戟菊生檎 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 衣引葵生稽 閤精 是帖研 原朕稽 妊獣杯艦陥
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 昔匂制亀酔稽 舌社拭 企廃 竺誤聖 妊獣杯艦陥
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">食君歳 酔軒亜 陥艦澗 員戚拭推......ばばばばばばばばば</div>'
        });
        infowindow.open(map, marker);

        // 走亀税 掻宿聖 衣引葵生稽 閤精 是帖稽 戚疑獣典艦陥
        map.setCenter(coords);
    } 
});    
</script>
</body>
</html>