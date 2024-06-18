<%@page import="java.util.ArrayList"%>
<%@page import="Model.memberDTO"%>
<%@page import="Model.notice_BoardDAO"%>
<%@page import="Model.reviewBoardDAO"%>
<%@page import="Model.boardDAO"%>
<%@page import="Model.reviewBoardDTO"%>
<%@page import="Model.notice_BoardDTO"%>
<%@page import="Model.reportTestDAO"%>
<%@page import="Model.reportTestDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
    // html dom �� �� �ε��� �� ����ȴ�.
    $(document).ready(function(){
        // menu Ŭ���� �ٷ� ������ �ִ� a �±׸� Ŭ��������
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu �� ȭ��� ���϶��� ���� ������� ���� �ƴϸ� �Ʒ��� ������� ��ġ��
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
</script>

<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/15d6ad4059.js" crossorigin="anonymous"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);

.nanumgothic * {
 font-family: 'Nanum Gothic', sans-serif;
}
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@import url(//fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
.nanummyeongjo * {
 font-family: 'Nanum Myeongjo', serif;
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
body {
  font-family: "Noto Sans KR", sans-serif !important;
}
</style>
<link rel="stylesheet" href="css/Main.css?after">
</head>
<body>
<%
   memberDTO info = (memberDTO)session.getAttribute("info");   
   if (info!=null){
      double memberLat = info.getMemberLat();
      double memberLng = info.getMemberLng();
      System.out.println("(������������ ������� ������ �� �Ѿ������) memberLat : "+ memberLat);
      System.out.println("(������������ ������� �浵�� �� �Ѿ������) memberLng : "+ memberLng);
   }
   // �������� ����
   notice_BoardDAO dao = new notice_BoardDAO();
   
      // ���� ������ - �÷α� ���� ���� ����� ����
   int cnt = dao.plogDateUpdate();
   if(cnt>0) {
      System.out.println("�÷α� ���� ���� ����");
   }else {System.out.println("�÷α� ���� ���� ����");
   }
   
   // ���� ä�ù� ��� (��ȸ���� '����' Ŭ���� ���)
   ArrayList<notice_BoardDTO> array = new ArrayList<notice_BoardDTO>();
   if (info!=null){
      array = dao.showMyChatroom(info.getMemberId());
      for(int i=0; i<array.size(); i++){
         System.out.println(" ä�ù� ��ȣ  : " + array.get(i).getNoticeNumber() );
      }
   } 
   // (����� ������ ����) ���� ���
   ArrayList<reportTestDTO> report_array = new ArrayList<reportTestDTO>();
   reportTestDAO report_dao = new reportTestDAO();
   report_array = report_dao.reportShow();
   for(int i=0; i<report_array.size(); i++){
      System.out.println(" ���� ��ȣ  : " + report_array.get(i).getReport_number());
   }
   
   
   ArrayList<reviewBoardDTO> reviewArray = new ArrayList<reviewBoardDTO>();
   reviewBoardDAO reviewDao = new reviewBoardDAO();
   reviewArray = reviewDao.showBoard();
   %>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
  function openCloseToc() {
    if(document.getElementById('hide').style.display === 'block') {
      document.getElementById('toc-content').style.display = 'none';
    } else {
      document.getElementById('toc-content').style.display = 'block';
    }
  }
</script>
<table>
   <tr>
      <div style = "background: #FEEDCC;
    width: 991px;
    height: 139px;
    position: absolute;
    z-index: -1;
    margin: -7px 0px 0px -8px;"><td id="title" style=" font-family: 'netmarbleB';">Plogging</td></div>
         <% if(info != null) { %>
      <!-- <td><input style="margin: 0px 0px 0px 238px;"  type ="button" value = "�α׾ƿ�" onClick="location.href='logoutServiceCon'"></td> -->
      <td>
         <ul style="list-style: none; ">
              <li class="menu" >
                  <a><div class="topicon" onclick="openCloseToc()" >ä�ù�</div></a>
                  <ul id="hide" style="display:none; list-style: none; margin-left: 500px;">
                     <% if(info != null) { %>
                        <% for(int i=0; i<array.size(); i++){ %>
                        		<%int a = 10*i; %>
                            <li><div style="margin-top:<%=a %>px" value="<%=array.get(i).getNoticeNumber()%>�� ����" name="chat" onClick="location.href='chatTest.jsp?noticeNumber=<%=array.get(i).getNoticeNumber()%>'"><%=array.get(i).getNoticeNumber()%></div></li>
                           <%}%>
                     <%}%>   
                  </ul>
              </li>
          </ul>
      </td>
      <td><i class="far fa-user"  type ="button" value = "������ �˻�" onClick="location.href='myPage.jsp'" id = "myimport" ></i></td>
         <% }else { %>
      <td > <a id = "myimport" onClick="location.href='Login.jsp'"><img id='login' src= "login.png" style ="margin:10px 10px 0px 10px; width:30px; color: #ffffff;" >�α���</a> </td>
      <% } %>
   </tr>
</table>

<br>

<%if(info !=null){ %>
<form action = "reportPostWrite.jsp" method = "post">
   <h2 style = "font-size: 2em;
    position: absolute;
    z-index: 2;
    margin-left: 145px;
    margin-top: 11px;
    font-family: 'Nanum Gothic', sans-serif;
}">�������� �����ϰ� �÷α� �غ��°� ����?</h2>
   <div id="map" style="width: 981px;
    height: 600px;
    position: relative;
    overflow: hidden;
    background: url(http://t1.daumcdn.net/mapjsapi/images/2x/bg_tile.png);
    box-shadow: 0px 36px 0px black inset;
    border-top: 3px solid;
    border-bottom: 3px solid;
    margin: -20px 0px 0px 0px;"></div>
</form>
<div style="background:#F7F7F7; margin: -18px -18px 5px -7px;">
      <div id ="cafe"><th>ȸ������ �������� �ı�</th></div>
      <table border='0px' style='height:100px;'>
            <%for(int i = 0; i<3;i++){%>
            <tr style = "border-bottom:1px">
            <td id = "membertitle"><a href = "Review8.jsp?reviewNumber=<%=reviewArray.get(i).getReviewNumber()%>">- <%=reviewArray.get(i).getTitle()%></a></td>
            <td id = "ae" style="padding: 0px 0px 0px 100px; width: 100px; font-size: 1.3em;">�ۼ��� : <%=reviewArray.get(i).getMemberId() %></td>
           </tr>
      <%} %>
      </table>
      </div>
      <br>
<div style="background:#F7F7F7;">
<div id ="New" style="
	font-size: 40px;
    font-family: 'Nanum Myeongjo', serif;
    padding: 28px 0px 0px 23px;
         ">���㴺��!</div>
         <div style="
	width: 282px;
    margin: 27px 0px 0px 10px;
    float: left;
    /* font-size: 21px; */
    background: white;
    padding: 90px 20px 90px 20px;
    box-shadow: 10px 10px 10px 10px #ebebeb;
    border-radius: 80px;
      "><a style="font-size:38px;"href="https://blog.naver.com/purity_k/222459285852">�뼼�� ���븻�� �ݱ�! ����õ �÷α� �ı�</a></div>
      <div style="width: 282px;
    margin: 20px 0px 0px 358px;
    /* width: 300px; */
    background: white;
    padding: 80px 10px 49px 14px;
    box-shadow: 10px 10px 10px 10px #ebebeb;
    border-radius: 80px;
      "><a style="font-size:38px;" href="https://blog.naver.com/earthactkgjn/222180131468">���� � Ʈ����� '�÷α�' �ǰ��� ȯ�� ��� ��Ű��!</a></div>
      <div style="
      width: 282px;
    margin: -330px 10px 0px 0px;
    background: white;
    float: right;
    padding: 84px 10px 91px 0px;
    border-radius: 80px;
    box-shadow: 10px 10px 10px 10px #ebebeb;
      "><a style="font-size:38px;"href="https://blog.naver.com/flydms/222290879041">�÷α����� ���������� ���� ���������?</a></div>
</div>
<%}else { %>

<table>
<tr>
<div><iframe src="https://www.youtube.com/embed/7XrxTrejx8w" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
<div style="background:#F7F7F7; margin: -47px -18px 5px -7px;">
      <div id ="cafe"><div>ȸ������ �������� �ı�</div></div>
      <table border='0px' style='background:#F7F7F7;height:100px;margin: -5px -18px 3px -8px;'>
            <%for(int i = 0; i<3;i++){%>
            <tr style = "border-bottom:1px">
            <td id = "membertitle"><a href = "Review8.jsp?reviewNumber=<%=reviewArray.get(i).getReviewNumber()%>">- <%=reviewArray.get(i).getTitle()%></a></td>
            <td id = "ae" style="padding: 0px 0px 0px 100px; width: 100px; font-size: 1.3em;">�ۼ��� : <%=reviewArray.get(i).getMemberId() %></td>
           </tr>
      <%} %>
      </table>
      </div>
      <br>
<div style="background:#F7F7F7; margin:0px -17px 0px -6px">
<div id ="New" style="
	font-size: 40px;
    font-family: 'Nanum Myeongjo', serif;
    padding: 28px 0px 0px 23px;
         ">���㴺��!</div>
         <div style="
	width: 282px;
    margin: 14px 0px 0px 10px;
    float: left;
    /* font-size: 21px; */
    background: white;
    padding: 80px 20px 90px 20px;
    box-shadow: 10px 10px 10px 10px #ebebeb;
    border-radius: 80px;
      "><a style="font-size:38px;"href="https://blog.naver.com/purity_k/222459285852">�뼼�� ���븻�� �ݱ�! ����õ �÷α� �ı�</a></div>
      <div style="width: 282px;
    margin: 20px 0px 0px 358px;
    /* width: 300px; */
    background: white;
    padding: 80px 10px 49px 14px;
    box-shadow: 10px 10px 10px 10px #ebebeb;
    border-radius: 80px;
      "><a style="font-size:38px;" href="https://blog.naver.com/earthactkgjn/222180131468">���� � Ʈ����� '�÷α�' �ǰ��� ȯ�� ��� ��Ű��!</a></div>
      <div style="
      width: 282px;
    margin: -330px 10px 0px 0px;
    background: white;
    float: right;
    padding: 84px 10px 91px 0px;
    border-radius: 80px;
    box-shadow: 10px 10px 10px 10px #ebebeb;
      "><a style="font-size:38px;"href="https://blog.naver.com/flydms/222290879041">�÷α����� ���������� ���� ���������?</a></div>
</div>
<%} %>
<br><br><br><br><br><br><br>
<table>
<div id="down"></div>
   <div  class="dbutton1" type="button" value="����" name="main" onClick="location.href='Main.jsp'">����</div>
   <div class="dbutton2" type="button" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'">��ȸ</div>
   <div class="dbutton3" type="button" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'">�ı�</div>
   <div class="dbutton4" type="button" value="�Խ���" name="board" onClick="location.href='Board.jsp'">�Խ���</div>
   <div class="dbutton5" type="button" value="����" name="report" onClick="location.href='reportPostWrite.jsp'">����</div>
</table>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72d306962d4f7f31bb4597d71782852b&libraries=services"></script>
<script><!-- ����������-->
   <%if(info !=null){%>
      var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
      mapOption = {
            center: new kakao.maps.LatLng(<%=info.getMemberLat()%>,<%=info.getMemberLng()%>), // ������ �߽���ǥ
            level: 5 // ������ Ȯ�� ����
      };

      //������ �����մϴ�    
      var map = new kakao.maps.Map(mapContainer, mapOption); 
   
      // ��������
      let lat;
      let lng;
      
      <%for(int i=0; i<report_array.size();i++){%>
         // ��Ŀ�� �����մϴ�
         // ���� �� �������� Ȯ��
         lat = <%=report_array.get(i).getLat()%>;
         lng = <%=report_array.get(i).getLng()%>;
         report_number = <%=report_array.get(i).getReport_number()%>;
         console.log('lat, lng: ', lat, lng);
   
         var marker = new kakao.maps.Marker({      
            position: new kakao.maps.LatLng(lat, lng)
         // ��Ŀ�� ��ġ
         });
         
         makeMarkerDeletable(report_number, marker);
      
         marker.setMap(map);
      <%}%>
   <%}%>
   
      // '���� �� �ִ� ��Ŀ �����' �Լ� ����
   function makeMarkerDeletable(targetReportNumber, targetMarker) {

      //href="maingDelete?lat="+latlng.getLat()+"&lng="+latlng.getLng();
      //��Ŀ�� ����� �̺�Ʈ
      kakao.maps.event.addListener(targetMarker, 'click', function() {
        // ��Ŀ ���� ���������츦 ǥ���մϴ�
        var lat = targetMarker.getPosition().getLat()
        var lng = targetMarker.getPosition().getLng()
        console.log('lat : ', lat);
        console.log('lng : ', lng);
        targetMarker.setMap(null);
        
      $.ajax({
         url: "deleteReportServiceCon",
          type: 'POST',
          data:{"report_number" : targetReportNumber},
          contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
          success: function (res) {
              console.log(res);
          },
          error: function (xhr) {
              alert(xhr);
          } 
      });
      
      });
   }
</script>
</body>
</html>