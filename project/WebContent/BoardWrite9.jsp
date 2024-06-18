<%@page import="Model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
<link rel = "stylesheet" href="css/BoardWrite9.css?after">
</head>
<body style = "background-color: #dadbdb">
<%
memberDTO info = (memberDTO)session.getAttribute("info");
 %>
<div>
   <table class="qq" >
 <tr>
         <td colspan = "8" >�ۼ��� : <%if(info!=null){%><span><%=info.getMemberId() %></span><%}else{ %><span name="name"  >�͸�</span><%} %></span></td>
         
         </tr>
   </table>
   <form action = "BoardServiceCon" method = "post"  >
      <table  class="mtable1" >
         <tr>
            <td colspan = "8" ><input type = "text" placeholder="����" name="title" class="ltex"></td>
         </tr>
         
         <tr>
        			 <td align="left">
					<input type="file" id="input-file" name="fileName">
					</label>
					<div id="target_file_wrap">
					<a href="#" onclick="jQuery('#input-file').click()" class="btn btn-primary">����</a>
					<span></span>
					</div>
					</td>
           <td  align = "right" ><input type = "submit" value = "�۾��� �Ϸ�" class="topicon"></td>		
         </tr>
         <tr>
            <td align="center" colspan="8"><textarea  name="textarea" placeholder="����"></textarea></td>
         </tr>
      </table>
      </form>
      <br><br><br><br><br><br><br><br>
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