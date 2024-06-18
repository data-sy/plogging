<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	table {
		width : 360px;
	}
</style>
</head>
<body>
<div>
	<table>
	<tr>
	   <td>싸이트명ㅇㅇ</td>
	   <td style = "float : right"><input type ="button" value = "내정보 검색" onClick="location.href='myPage.jsp'"></td>
	   <td style = "float : right"><input type ="button" value = "검색"></td>
	</tr>
	</table>
	<form action = "" method = "post">
		<table border = "1px" >
			<tr>
				<td colspan = "4">
					게시글 제목
				</td>
			</tr>
			<tr>
				<td colspan = "2"> 날짜 및 시간 </td>
				<td> 조회수 </td>
				<td> 닉네임 </td>
			</tr>
			<tr> <td colspan = "4" height = "300">게시 내용 </td></tr>
				<td colspan = "2"></td>
				<td> <input type = "submit" value = "수정"> </td>
				<td> <input type = "submit" value = "삭제"> </td>
			</tr>			
		</table>
		<table  border = "1px">
		<tr>
		   <td colspan = "4"> 댓글 </td>
		</tr>
		<tr>
		   <td colspan = "4"> 닉네임 </td>
		</tr>		
		<tr>
		   <td colspan = "4"> 댓글내용 </td>
		</tr>
		<tr>
		   <td colspan = "4"> 댓글시간 </td>
		</tr>
		<tr>
		   <td colspan = "4"><input type="text"  placeholder = "댓글 쓰기"></td>
		</tr>
		<tr>
		   <td colspan = "2"> prev</td>
		   <td colspan = "2"> next</td>
		</tr>
		</table>
		<table>
		<tr>
	<td><input type="button" value="메인" name="main" onClick="location.href='Main.jsp'"></td>
	<td><input type="button" value="조회" name="inquiry" onClick="location.href='inquiryMain.jsp'"></td>
	<td><input type="button" value="후기" name="review" onClick="location.href='reviewMain.jsp'"></td>
	<td><input type="button" value="게시판" name="board" onClick="location.href='Board.jsp'"></td>
	<td><input type="button" value="제보" name="report" onClick="location.href='reportPostWrite.jsp'"></td>
		</tr>
		</table>
	</form>
</div>

</body>
</html>