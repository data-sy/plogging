<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href = "css/login.css?after" rel = "stylesheet">
</head>
<body>
<div>
     <table align="center">
         <tr>
            <td><h2>Plogging</h2></td>
         </tr>
     </table>
   </div>
<form action="loginServiceCon" method = "post">
<table  align="center">
   <tr>
      <td align="center" ><h1>Login</h1><td>
   </tr>
</table>
   <table align="center">
   <tr>
   <td>
      <div align="center">
       	 <img src = "id.png" id ="inputid">
         <input type="text" class="tex" name="id"><br>
      </div>
      </td>
   </tr>
   <tr>
      <td><div align="center">
         <img src = "password.png" id ="inputid">
         <input type="password" class="tex" name="pw"><br>
      </div></td>
   </tr>
   </table>
   <table align="center">
      <tr>
 <td align="center"><div><input class="button" type = "submit" value = "�α���"></div></td>
      </tr>
      <tr>
         <td align="center"><div><input class="button" type = "button" value = "ȸ������" onClick="location.href='Join.jsp'"></div></td>
      </tr>
      <tr>
         <td align="center"><div><input class="button" type = "button" value = "���̵�ã�� / ��й�ȣ ã��"></div></td>
      </tr>
   </table>
</form>
<br><br><br><br>
<br><br><br><br>
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