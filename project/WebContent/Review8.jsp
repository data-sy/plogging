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
		    	<i class="far fa-user"  type ="button" value = "������ �˻�" onClick="location.href='myPage.jsp'" id = "myimport" ></i>
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
				<td id = "date">�ۼ� ����: <%=dto.getReviewDate() %> </td>
				<td id ="memberId">�ۼ���: <%=dto.getMemberId() %> </td>
			</tr>
			<tr>
				<td colspan = "3" id="map"align ='center'></td>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72d306962d4f7f31bb4597d71782852b&libraries=services"></script>
			</tr>
			<tr> 
				<td colspan = "4" height = "600px" id="content"><%=dto.getContents() %> </td>
			</tr>
				<td style="padding: 45px 0px 0px 40px; font-size:40px; text-align:center;"> ������ ��:  <p id = "val"><%=dto.getTrash() %></p></td>
				<td style="padding: 42px 0px 0px 45px; font-size:40px;text-align:center;"> �÷α� �Ÿ� : <p id = "val"><%=dto.getRun()%></p></td>
			</tr>
			<tr>
				<td>
					<div>
						<div ><input id="re" "type = "submit" value = "����"> </div>
						<div ><input id="del" type = "submit" value = "����"> </div>
					</div>
				</td>
			</tr>
			
			<table>	
				<div id="down"></div>
				<div class="dbutton1" type="button" value="����" name="main" onClick="location.href='Main.jsp'">����</div>
				<div class="dbutton2" type="button" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'">��ȸ</div>
				<div class="dbutton3" type="button" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'">�ı�</div>
				<div class="dbutton4" type="button" value="�Խ���" name="board" onClick="location.href='Board.jsp'">�Խ���</div>
				<div class="dbutton5" type="button" value="����" name="report" onClick="location.href='reportPostWrite.jsp'">����</div>
			</table>
	</form>
	<br><br><br><br><br><br><br><br><br>
</div>
<script>
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = {
        center: new kakao.maps.LatLng(<%=dto.getLat()%>, <%=dto.getLng()%>), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    };
// ������ �����մϴ�    
var map = new kakao.maps.Map(mapContainer, mapOption); 
	    // ��Ŀ�� �����մϴ�
	    var marker = new kakao.maps.Marker({
	    	
	    	position: new kakao.maps.LatLng(<%=dto.getLat()%>, <%=dto.getLng()%>)
	    	// ��Ŀ�� ��ġ
	    });
		
	    marker.setMap(map);
	    
</script>
</body>
</html>