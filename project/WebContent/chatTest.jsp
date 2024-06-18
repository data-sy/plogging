<%@page import="Model.reportTestDTO"%>
<%@page import="Model.reportTestDAO"%>
<%@page import="Model.memberDTO"%>
<%@page import="Model.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="Model.notice_BoardDTO"%>
    <%@page import="Model.notice_BoardDAO"%>
    <%@page import="Model.ChatDAO"%>
    <%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>

	#chat, #chatmain{
		overflow: auto !important;
	}
</style>

<script src="https://kit.fontawesome.com/15d6ad4059.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/chatroom.css?after">
</head>
<body>

<%
	// 로그인 시 필요
	memberDTO info = (memberDTO) session.getAttribute("info");
	String login_id = info.getMemberId();
	System.out.println("(chatTest1페이지) 로그인 아이디 login_id : " + login_id);
	
	// 조회, 공고방 목록에서 넘어올 때
	request.setCharacterEncoding("EUC-KR");	
	int noticeNumber = Integer.parseInt(request.getParameter("noticeNumber"));
	System.out.println("(chatTest1페이지) 공고 번호  : " + noticeNumber);

	// 공고번호에 맞는 정보들
	notice_BoardDAO dao = new notice_BoardDAO();
	notice_BoardDTO ndto = dao.showNoticeInfo(noticeNumber);
	System.out.println("(chatTest1페이지) 플로깅 장소 : " + ndto.getAddr());
	System.out.println("(chatTest1페이지) 플로깅 기한 : " + dao.changeDateFormat(ndto.getPlogDate()));
	System.out.println("(chatTest1페이지) 제한 인원 : " + ndto.getLimitedNumber());
		
	// 공고의 위도, 경도
	notice_BoardDTO dto = dao.lating(noticeNumber);
	System.out.println("(chatTest1페이지) 공고의 위도 : " + dto.getLat());
	System.out.println("(chatTest1페이지) 공고의 경도 : " + dto.getLng());

	// 로그인한 아이디가 이 채팅방에 참가한 적 있는지 파악 (조회의 '참가'버튼을 누른 적 있는지)
	ArrayList<notice_BoardDTO> c_array = dao.showMyChatroom(login_id);
	int check2 = 0;
	for (int i=0; i<c_array.size();i++){
		if (c_array.get(i).getNoticeNumber()==noticeNumber){
			check2 = 1;
		}
	}

	// 안내문구를 위한 채팅내역 생성 -- 대신 사용자는 announcement를 입력하면 안돼...ㅋㅋ
	ChatDAO c_dao = new ChatDAO();
	if (check2==0){
		int cnt = c_dao.insertChat(noticeNumber, login_id, "announcement");
		if(cnt>0) {
			System.out.println("안내문구  성공");
		}else {System.out.println("안내문구 실패");
		}
	}
	
	// 로그인한 아이디가 이 공고 신청 했는지 여부 파악 (채팅방의 '신청'버튼을 누른 적 있는지)
	ArrayList<notice_BoardDTO> array = dao.showMyNotice(login_id);
	int check = 0;
	for (int i=0; i<array.size();i++){
		if (array.get(i).getNoticeNumber()==noticeNumber){
			check = 1;
		}
	}
	
	// 공고번호를 가지는 제보들 추출
	reportTestDAO r_dao = new reportTestDAO();
	ArrayList<reportTestDTO> r_array = r_dao.showReportForNotice(noticeNumber);
	
	// 전대 쓰레기통
	reportTestDTO dto1 = new reportTestDTO(35.17522713026023, 126.90823451658422);
	reportTestDTO dto2 = new reportTestDTO(35.17703805037698, 126.90888361114155);
	reportTestDTO dto3 = new reportTestDTO(35.175599841087205, 126.90753177784862);
	// 상무지구 쓰레기통
	reportTestDTO dto4 = new reportTestDTO(35.156485, 126.851615);
	reportTestDTO dto5 = new reportTestDTO(35.153125922554814, 126.85512358022733);
	
	reportTestDTO dto6 = new reportTestDTO(35.155536, 126.907554);
	ArrayList<reportTestDTO> t_array = new ArrayList<reportTestDTO>();
	t_array.add(dto1);
	t_array.add(dto2);
	t_array.add(dto3);
	t_array.add(dto4);
	t_array.add(dto5);
	t_array.add(dto6);
	
	
%>	
<table style="width:100%;height:500px;" class="ttable">
<tr >
	<td style="width:50%;" colspan='2' rowspan='4'>
	<div id="map"  align="center" ></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72d306962d4f7f31bb4597d71782852b&libraries=services"></script>
	</td>
	<td colspan='2'>
	<!-- 공고정보. 기능 확인용, 디자인 맘껏 수정 가능-->
	<div><p align="center">공고정보 </div>
	</td>
</tr>
<tr>
	<td class="rtd">
<!-- <div><p align="right">공고번호 : <%=noticeNumber %> </p></div> -->
	<div><p align="center">플로깅 장소</p></div>
	</td>
	<td>
	<div><p align="center"><%=ndto.getAddr() %> </p></div>
	</td>
</tr>
<tr>
	<td class="rtd">
	<div><p align="center">플로깅 기한</p></div>
	</td>
	<td>
	<div><p align="center"><%=ndto.getPlogDate() %></p></div>
	</td>
</tr>
<tr>
	<td class="rtd">
	<div ><p align="center"> 현재 참가한 인원</p></div>
	</td>
	<td>
	<div><p align="center"><%=ndto.getLimitedNumber() %>/30 </p></div>
	</td>
</tr>
</table>

	
<!-- 제보사진. 기능 확인용, 디자인 맘껏 수정 가능-->
	<div><p style="margin-left:30px;">제보 사진</p></div>
	<div id="reportImg">
		<%if(r_array.size()!=0){%>
			<% for(int i=0; i<r_array.size(); i++){ %>
				<span>
					<img id="img" src="img/<%=r_array.get(i).getImg()%>">
				</span>
			<% } %>	
		<% } %>
	</div>	
	<table width="100%" >
		<tr>
			<td ><input class="topicon" type="button" value="채팅방목록" name="main" onClick="location.href='chatChoice.jsp'">
	<% if (check==0){%></td>
			<td align="right" margin-right="5px"><input class="rtopicon" type='button' value="신청" name="attend" 
				onClick="location.href='inquiryServiceCon?noticeNumber=<%=noticeNumber%>&login_id=<%=login_id%>'"></td>
		<% }else{ %>
			<td><p1 align="right" >신청하신 공고입니다.</p1></td>
		<% } %>
		</tr>
	</table>
	
			
	<div id="chatmain">
		<div id="chat">
		</div>
	</div>

	<div>
		<table width="100%">
			<tr>
				<td align="left"><input type="text" id="content" name="content" placeholder="내용 입력" maxlength='30'></td>
				<td align="right" ><button id="send" >입력</button><br></td>
			</tr>
		</table>

	</div>
	<br><br><br><br><br><br><br><br>
	<table>
<div id="down"></div>
   <div  class="dbutton1" type="button" value="메인" name="main" onClick="location.href='Main.jsp'">메인</div>
   <div class="dbutton2" type="button" value="조회" name="inquiry" onClick="location.href='inquiryMain.jsp'">조회</div>
   <div class="dbutton3" type="button" value="후기" name="review" onClick="location.href='reviewMain.jsp'">후기</div>
   <div class="dbutton4" type="button" value="게시판" name="board" onClick="location.href='Board.jsp'">게시판</div>
   <div class="dbutton5" type="button" value="제보" name="report" onClick="location.href='reportPostWrite.jsp'">제보</div>
</table>


	<!-- 채팅 기능  -->

	<script type="text/javascript">
	
		// 데이터베이스에 저장된 채팅 정보를 웹에 뿌려주는 뿌려주는 부분
		// setInterval은 주기적인 실행 함수로 0.2초마다 셀렉트해서 뿌려주겠다는 의미
		setInterval(function(){
			var chatRoomNum = <%=noticeNumber%>;
			$.ajax({
			       url: "ChatSelectCon", //컨트롤러 URL
			       dataType: 'json',
			       type: 'POST',
			       data:{"chatRoomNum":chatRoomNum},
			       // 한글도 가능하도록 인코딩. jquery는 utf-8 사용
			       contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
			       success: function (res) {
			    	   // 뿌려주고 나서 비워주기 (안 그러면 계속 셀렉트가 돌면서 대화를 계속 반복해서 뿌리게 돼)
			    	   	$("#chat").empty();
			    	   	var chatContainer = $("#chat");
			    	   	// 입력인자 res에 ChatSelectCon에서 실행한 셀렉트 결과(리스트)가 들어 있고 그 중에 member_id와 content를 가져와서
			    	   	// for문 사용해서 뿌려주기
			    		for(var i = 0; i < res.length; i++){
			    			var id = res[i].member_id;
			    			var content = res[i].content;
		    				if(content=="announcement"){
	/////////////////////////////////// 기능만 넣음 디자인은 원하는대로 바꾸면 됨 ///////////////////////////////////////////////////////////////////////////////////////////
		    					chatContainer.append("<div class='announcement' style='text-align:center;'>" + id + "님이 " + chatRoomNum + "번 방에 입장하셨습니다.</div>");
		    				}else{
		    					if(id=="<%=login_id%>"){

				    				chatContainer.append("<div class='my'>" + id +"</div>"+"<br>"+"<div class='myContent'>"+ content + "</div>");

				    			}else{
					    			chatContainer.append("<div class='others'><i class='far fa-user'  type ='button' id = 'myimport' class='lmyimport'></i>" + id + "</div>"+"<br>"+"<div class = 'otherContent'>" + content + "</div>");
				    			};
		    				};    	
			    		}
			         console.log(res);
			         var divdiv = document.getElementById("chat");
			         
			         var divdiv2 = document.getElementById("chatmain"); 
			         divdiv.scrollTop = divdiv.scrollHeight;
			         divdiv2.scrollTop = divdiv.scrollHeight;
			       },error: function (xhr) {
			         //alert(xhr);
			       } 
			    });
		}, 500);
 // 채팅 속도좀 늦출께요
		
			// 아이디와 채팅내용 입력받는 부분
			// 입력받은 값을 ChatInsertCon으로 보내서 데이터베이스에 넣으려 해
			$("#send").on('click',function(){
				var chatRoomNum = <%=noticeNumber %>;
				var id = "<%=login_id%>";
				var content = $('#content').val();
				  $.ajax({
				       url: "ChatInsertCon", //컨트롤러 URL
				       dataType: 'text',
				       type: 'POST',
				       data:{"chatRoomNum":chatRoomNum,"id":id,"content":content},
				       contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				       success: function (res) {
				        	console.log(res);
				        	var divdiv = document.getElementById("chat");
					         divdiv.scrollTop = divdiv.scrollHeight;
				       },error: function (xhr) {
				         //alert(xhr);
				       } 
				    });
				  //document.getElementById("send").value='';
			});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(<%=dto.getLat()%>, <%=dto.getLng()%>), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 


var imageSrc2 = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
//쓰레기통 마커
<%for(int i=0; i<t_array.size();i++){%>

//마커 이미지의 이미지 크기 입니다
var imageSize2 = new kakao.maps.Size(24, 35); 

//마커 이미지를 생성합니다    
var markerImage2 = new kakao.maps.MarkerImage(imageSrc2, imageSize2); 

//마커를 생성합니다
 // 마커를 생성합니다
var marker = new kakao.maps.Marker({
     map: map, // 마커를 표시할 지도
     position: new kakao.maps.LatLng(<%=t_array.get(i).getLat()%>, <%=t_array.get(i).getLng()%>),
     image : markerImage2 // 마커 이미지 
 });
 

marker.setMap(map);


<%}%>



<%for(int i=0; i<r_array.size();i++){%>

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: new kakao.maps.LatLng(<%=r_array.get(i).getLat()%>, <%=r_array.get(i).getLng()%>),
		// 마커의 위치
	
	});
	
	marker.setMap(map);

<%}%>



</script>
</body>
</html>