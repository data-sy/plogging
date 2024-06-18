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
	// �α��� �� �ʿ�
	memberDTO info = (memberDTO) session.getAttribute("info");
	String login_id = info.getMemberId();
	System.out.println("(chatTest1������) �α��� ���̵� login_id : " + login_id);
	
	// ��ȸ, ����� ��Ͽ��� �Ѿ�� ��
	request.setCharacterEncoding("EUC-KR");	
	int noticeNumber = Integer.parseInt(request.getParameter("noticeNumber"));
	System.out.println("(chatTest1������) ���� ��ȣ  : " + noticeNumber);

	// �����ȣ�� �´� ������
	notice_BoardDAO dao = new notice_BoardDAO();
	notice_BoardDTO ndto = dao.showNoticeInfo(noticeNumber);
	System.out.println("(chatTest1������) �÷α� ��� : " + ndto.getAddr());
	System.out.println("(chatTest1������) �÷α� ���� : " + dao.changeDateFormat(ndto.getPlogDate()));
	System.out.println("(chatTest1������) ���� �ο� : " + ndto.getLimitedNumber());
		
	// ������ ����, �浵
	notice_BoardDTO dto = dao.lating(noticeNumber);
	System.out.println("(chatTest1������) ������ ���� : " + dto.getLat());
	System.out.println("(chatTest1������) ������ �浵 : " + dto.getLng());

	// �α����� ���̵� �� ä�ù濡 ������ �� �ִ��� �ľ� (��ȸ�� '����'��ư�� ���� �� �ִ���)
	ArrayList<notice_BoardDTO> c_array = dao.showMyChatroom(login_id);
	int check2 = 0;
	for (int i=0; i<c_array.size();i++){
		if (c_array.get(i).getNoticeNumber()==noticeNumber){
			check2 = 1;
		}
	}

	// �ȳ������� ���� ä�ó��� ���� -- ��� ����ڴ� announcement�� �Է��ϸ� �ȵ�...����
	ChatDAO c_dao = new ChatDAO();
	if (check2==0){
		int cnt = c_dao.insertChat(noticeNumber, login_id, "announcement");
		if(cnt>0) {
			System.out.println("�ȳ�����  ����");
		}else {System.out.println("�ȳ����� ����");
		}
	}
	
	// �α����� ���̵� �� ���� ��û �ߴ��� ���� �ľ� (ä�ù��� '��û'��ư�� ���� �� �ִ���)
	ArrayList<notice_BoardDTO> array = dao.showMyNotice(login_id);
	int check = 0;
	for (int i=0; i<array.size();i++){
		if (array.get(i).getNoticeNumber()==noticeNumber){
			check = 1;
		}
	}
	
	// �����ȣ�� ������ ������ ����
	reportTestDAO r_dao = new reportTestDAO();
	ArrayList<reportTestDTO> r_array = r_dao.showReportForNotice(noticeNumber);
	
	// ���� ��������
	reportTestDTO dto1 = new reportTestDTO(35.17522713026023, 126.90823451658422);
	reportTestDTO dto2 = new reportTestDTO(35.17703805037698, 126.90888361114155);
	reportTestDTO dto3 = new reportTestDTO(35.175599841087205, 126.90753177784862);
	// ������ ��������
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
	<!-- ��������. ��� Ȯ�ο�, ������ ���� ���� ����-->
	<div><p align="center">�������� </div>
	</td>
</tr>
<tr>
	<td class="rtd">
<!-- <div><p align="right">�����ȣ : <%=noticeNumber %> </p></div> -->
	<div><p align="center">�÷α� ���</p></div>
	</td>
	<td>
	<div><p align="center"><%=ndto.getAddr() %> </p></div>
	</td>
</tr>
<tr>
	<td class="rtd">
	<div><p align="center">�÷α� ����</p></div>
	</td>
	<td>
	<div><p align="center"><%=ndto.getPlogDate() %></p></div>
	</td>
</tr>
<tr>
	<td class="rtd">
	<div ><p align="center"> ���� ������ �ο�</p></div>
	</td>
	<td>
	<div><p align="center"><%=ndto.getLimitedNumber() %>/30 </p></div>
	</td>
</tr>
</table>

	
<!-- ��������. ��� Ȯ�ο�, ������ ���� ���� ����-->
	<div><p style="margin-left:30px;">���� ����</p></div>
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
			<td ><input class="topicon" type="button" value="ä�ù���" name="main" onClick="location.href='chatChoice.jsp'">
	<% if (check==0){%></td>
			<td align="right" margin-right="5px"><input class="rtopicon" type='button' value="��û" name="attend" 
				onClick="location.href='inquiryServiceCon?noticeNumber=<%=noticeNumber%>&login_id=<%=login_id%>'"></td>
		<% }else{ %>
			<td><p1 align="right" >��û�Ͻ� �����Դϴ�.</p1></td>
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
				<td align="left"><input type="text" id="content" name="content" placeholder="���� �Է�" maxlength='30'></td>
				<td align="right" ><button id="send" >�Է�</button><br></td>
			</tr>
		</table>

	</div>
	<br><br><br><br><br><br><br><br>
	<table>
<div id="down"></div>
   <div  class="dbutton1" type="button" value="����" name="main" onClick="location.href='Main.jsp'">����</div>
   <div class="dbutton2" type="button" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'">��ȸ</div>
   <div class="dbutton3" type="button" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'">�ı�</div>
   <div class="dbutton4" type="button" value="�Խ���" name="board" onClick="location.href='Board.jsp'">�Խ���</div>
   <div class="dbutton5" type="button" value="����" name="report" onClick="location.href='reportPostWrite.jsp'">����</div>
</table>


	<!-- ä�� ���  -->

	<script type="text/javascript">
	
		// �����ͺ��̽��� ����� ä�� ������ ���� �ѷ��ִ� �ѷ��ִ� �κ�
		// setInterval�� �ֱ����� ���� �Լ��� 0.2�ʸ��� ����Ʈ�ؼ� �ѷ��ְڴٴ� �ǹ�
		setInterval(function(){
			var chatRoomNum = <%=noticeNumber%>;
			$.ajax({
			       url: "ChatSelectCon", //��Ʈ�ѷ� URL
			       dataType: 'json',
			       type: 'POST',
			       data:{"chatRoomNum":chatRoomNum},
			       // �ѱ۵� �����ϵ��� ���ڵ�. jquery�� utf-8 ���
			       contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
			       success: function (res) {
			    	   // �ѷ��ְ� ���� ����ֱ� (�� �׷��� ��� ����Ʈ�� ���鼭 ��ȭ�� ��� �ݺ��ؼ� �Ѹ��� ��)
			    	   	$("#chat").empty();
			    	   	var chatContainer = $("#chat");
			    	   	// �Է����� res�� ChatSelectCon���� ������ ����Ʈ ���(����Ʈ)�� ��� �ְ� �� �߿� member_id�� content�� �����ͼ�
			    	   	// for�� ����ؼ� �ѷ��ֱ�
			    		for(var i = 0; i < res.length; i++){
			    			var id = res[i].member_id;
			    			var content = res[i].content;
		    				if(content=="announcement"){
	/////////////////////////////////// ��ɸ� ���� �������� ���ϴ´�� �ٲٸ� �� ///////////////////////////////////////////////////////////////////////////////////////////
		    					chatContainer.append("<div class='announcement' style='text-align:center;'>" + id + "���� " + chatRoomNum + "�� �濡 �����ϼ̽��ϴ�.</div>");
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
 // ä�� �ӵ��� ���Ⲳ��
		
			// ���̵�� ä�ó��� �Է¹޴� �κ�
			// �Է¹��� ���� ChatInsertCon���� ������ �����ͺ��̽��� ������ ��
			$("#send").on('click',function(){
				var chatRoomNum = <%=noticeNumber %>;
				var id = "<%=login_id%>";
				var content = $('#content').val();
				  $.ajax({
				       url: "ChatInsertCon", //��Ʈ�ѷ� URL
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

var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
mapOption = {
    center: new kakao.maps.LatLng(<%=dto.getLat()%>, <%=dto.getLng()%>), // ������ �߽���ǥ
    level: 3 // ������ Ȯ�� ����
};

//������ �����մϴ�    
var map = new kakao.maps.Map(mapContainer, mapOption); 


var imageSrc2 = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
//�������� ��Ŀ
<%for(int i=0; i<t_array.size();i++){%>

//��Ŀ �̹����� �̹��� ũ�� �Դϴ�
var imageSize2 = new kakao.maps.Size(24, 35); 

//��Ŀ �̹����� �����մϴ�    
var markerImage2 = new kakao.maps.MarkerImage(imageSrc2, imageSize2); 

//��Ŀ�� �����մϴ�
 // ��Ŀ�� �����մϴ�
var marker = new kakao.maps.Marker({
     map: map, // ��Ŀ�� ǥ���� ����
     position: new kakao.maps.LatLng(<%=t_array.get(i).getLat()%>, <%=t_array.get(i).getLng()%>),
     image : markerImage2 // ��Ŀ �̹��� 
 });
 

marker.setMap(map);


<%}%>



<%for(int i=0; i<r_array.size();i++){%>

	// ��Ŀ�� �����մϴ�
	var marker = new kakao.maps.Marker({
        map: map, // ��Ŀ�� ǥ���� ����
        position: new kakao.maps.LatLng(<%=r_array.get(i).getLat()%>, <%=r_array.get(i).getLng()%>),
		// ��Ŀ�� ��ġ
	
	});
	
	marker.setMap(map);

<%}%>



</script>
</body>
</html>