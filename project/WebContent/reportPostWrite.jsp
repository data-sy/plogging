<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
   <%@page import="java.util.ArrayList"%>
<%@page import="Model.memberDTO"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
jQuery(document).ready(function($) {
	var target_id = "input-file"; $("#" + target_id).bind('change', function() {
	selectFile(this.files, target_id); }); }); // ���� ���ý�
	function selectFile(fileObject, target_id) { var files = null; var totalFileSize = 0; // ���� ���� ��Ͻ�
	files = jQuery('#' + target_id)[0].files; // �������� ���
	if (files != null) { for (var i = 0; i < files.length; i++) { // ���� �̸�
		var fileName = files[i].name; var fileNameArr = fileName.split("\."); // Ȯ����
		var ext = fileNameArr[fileNameArr.length - 1]; var fileSize = files[i].size; // ���� ������(���� :byte)
		console.log("fileSize="+fileSize); if (fileSize <= 0) { console.log("0kb file return"); return; } var fileSizeKb = fileSize / 1024;
		var fileSizeMb = fileSizeKb / 1024;
		var fileSizeStr = ""; if ((1024*1024) <= fileSize) { // ���� �뷮�� 1�ް� �̻��� ���
			console.log("fileSizeMb="+fileSizeMb.toFixed(2)); fileSizeStr = fileSizeMb.toFixed(2) + " Mb"; } else if ((1024) <= fileSize) { console.log("fileSizeKb="+parseInt(fileSizeKb)); fileSizeStr = parseInt(fileSizeKb) + " kb"; } else { console.log("fileSize="+parseInt(fileSize)); fileSizeStr = parseInt(fileSize) + " byte"; } // ���ε� ���� ��� ����
			jQuery("#target_file_wrap").find('span').html('÷������ : ' + fileName + ' (' + fileSizeStr + ')'); } } else { alert("ERROR"); } }
	</script>

<link rel="stylesheet" href="css/report.css?after">
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body >
<%

   memberDTO info = (memberDTO)session.getAttribute("info");   

%>
    <table class="mtable1" >
         <tr>
            <td style="text-align:left;"><h2 >�����ϱ�</h2></td>
			<td align="right">
         </tr>
      </table>
   </div>
		<form action="reportPostServiceCon" method="post" enctype = "multipart/form-data">
			<table class="mtable1" >
				<tr >
					<td colspan="4"><input type="text" class="ltex" placeholder="����"
						name="title" style="background-color:#dadbdb"></td>
				</tr>
				<tr >
					<td align="left">
					<input type="file" id="input-file" name="fileName">
					</label>
					<div id="target_file_wrap">
					<a href="#" onclick="jQuery('#input-file').click()" class="btn btn-primary">����</a>
					<span></span>
					</div>
					</td>
					<td align="right">
					<a href="inputAddress.jsp" target="_self"><img
							src="Map.png"  height="100" ></a>
<%
 	request.setCharacterEncoding("EUC-KR");
	 String lat = request.getParameter("lat");
	 String lng = request.getParameter("lng");
	 String addr = request.getParameter("addr");
	 System.out.println("latdd : " + lat);
	 System.out.println("lngdd :" + lng);
	 System.out.println("addr :" + addr);
 %>
			  <input type="hidden" name="lat" id="lat">
			  <input type="hidden" name="lng" id="lng">
			  <input type="hidden" name="addr" id="addr">
			   </td>
				</tr>
				<tr>
					<td align="center" colspan="4"><textarea  name="content" placeholder="����" style="background-color:#dadbdb"></textarea></td>
				</tr>
				<tr>
					<td><input type="submit" class="topicon" value="���" float ="right"></td></td>
				</tr>
			</table >
			<br>
			<br><br><br><br>			
		</form>
<table>
<div id="down"></div>
   <div  class="dbutton1" type="button" value="����" name="main" onClick="location.href='Main.jsp'">����</div>
   <div class="dbutton2" type="button" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'">��ȸ</div>
   <div class="dbutton3" type="button" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'">�ı�</div>
   <div class="dbutton4" type="button" value="�Խ���" name="board" onClick="location.href='Board.jsp'">�Խ���</div>
   <div class="dbutton5" type="button" value="����" name="report" onClick="location.href='reportPostWrite.jsp'">����</div>
</table>
		<script>
	 <%if(lat!=null){%>
     document.getElementById('lat').value = "<%=lat%>";
     document.getElementById('lng').value = "<%=lng%>";
     document.getElementById('addr').value = "<%=addr%>";
  <%}%>   </script>
</body>
</html>