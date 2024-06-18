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
	selectFile(this.files, target_id); }); }); // 파일 선택시
	function selectFile(fileObject, target_id) { var files = null; var totalFileSize = 0; // 직접 파일 등록시
	files = jQuery('#' + target_id)[0].files; // 다중파일 등록
	if (files != null) { for (var i = 0; i < files.length; i++) { // 파일 이름
		var fileName = files[i].name; var fileNameArr = fileName.split("\."); // 확장자
		var ext = fileNameArr[fileNameArr.length - 1]; var fileSize = files[i].size; // 파일 사이즈(단위 :byte)
		console.log("fileSize="+fileSize); if (fileSize <= 0) { console.log("0kb file return"); return; } var fileSizeKb = fileSize / 1024; 
		var fileSizeMb = fileSizeKb / 1024;
		var fileSizeStr = ""; if ((1024*1024) <= fileSize) { // 파일 용량이 1메가 이상인 경우
			console.log("fileSizeMb="+fileSizeMb.toFixed(2)); fileSizeStr = fileSizeMb.toFixed(2) + " Mb"; } else if ((1024) <= fileSize) { console.log("fileSizeKb="+parseInt(fileSizeKb)); fileSizeStr = parseInt(fileSizeKb) + " kb"; } else { console.log("fileSize="+parseInt(fileSize)); fileSizeStr = parseInt(fileSize) + " byte"; } // 업로드 파일 목록 생성
			jQuery("#target_file_wrap").find('span').html('첨부파일 : ' + fileName + ' (' + fileSizeStr + ')'); } } else { alert("ERROR"); } }
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
         <td colspan = "8" >작성자 : <%if(info!=null){%><span><%=info.getMemberId() %></span><%}else{ %><span name="name"  >익명</span><%} %></span></td>
         
         </tr>
   </table>
   <form action = "BoardServiceCon" method = "post"  >
      <table  class="mtable1" >
         <tr>
            <td colspan = "8" ><input type = "text" placeholder="제목" name="title" class="ltex"></td>
         </tr>
         
         <tr>
        			 <td align="left">
					<input type="file" id="input-file" name="fileName">
					</label>
					<div id="target_file_wrap">
					<a href="#" onclick="jQuery('#input-file').click()" class="btn btn-primary">사진</a>
					<span></span>
					</div>
					</td>
           <td  align = "right" ><input type = "submit" value = "글쓰기 완료" class="topicon"></td>		
         </tr>
         <tr>
            <td align="center" colspan="8"><textarea  name="textarea" placeholder="내용"></textarea></td>
         </tr>
      </table>
      </form>
      <br><br><br><br><br><br><br><br>
<table>
<div id="down"></div>
   <div  class="dbutton1" type="button" value="메인" name="main" onClick="location.href='Main.jsp'">메인</div>
   <div class="dbutton2" type="button" value="조회" name="inquiry" onClick="location.href='inquiryMain.jsp'">조회</div>
   <div class="dbutton3" type="button" value="후기" name="review" onClick="location.href='reviewMain.jsp'">후기</div>
   <div class="dbutton4" type="button" value="게시판" name="board" onClick="location.href='Board.jsp'">게시판</div>
   <div class="dbutton5" type="button" value="제보" name="report" onClick="location.href='reportPostWrite.jsp'">제보</div>
</table>

</body>
</html>