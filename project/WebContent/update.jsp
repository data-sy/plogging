<%@page import="Model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<link href = "css/update.css?after" rel = "stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
memberDTO info = (memberDTO)session.getAttribute("info");
%>
<div>
     <table align="center">
         <tr>
            <td><h2>Plogging</h2></td>
         </tr>
     </table>
   </div>
   <table >
      <tr>
         <h1 align="center" >ȸ�� ���� ����</h1>
      </tr>
   </table>
   
            <form action="updateServiceCon" method = "post">
            <table align="center" >
               <tr>
               <td>
                  <div>
                     <h3 align="center" >������ ID : <% if(info!=null){%><span><%= info.getMemberId()%></span><%}else{ %><span>a</span><%} %></h3>
                  </div>
                  </td>
               </tr>
               </table>
				<br>
				
		<table align="center" >
        	<tr>
            	<td align="right" width="35%"><h3>��й�ȣ</h3></td>
            	<td align="left"><input type="password" name="pass" maxlength="20" class="tex">
            	</td>
         	</tr>
      	</table>  
      	
		 <table align="center" >
        	<tr>
            	<td align="right" width="35%"><h3>�̸�</h3></td>
            	<td align="left"><input type="text" name="name" maxlength="20" class="tex">
            	</td>
         	</tr>
      	</table>  		
               
         <table align="center" >
        	<tr>
            	<td align="right" width="35%"><h3>����</h3></td>
            	<td align="left"><input type="text" name="age" maxlength="20" class="tex">
            	</td>
         	</tr>
      	 </table>  
            

               <br>
            <div class="btn_area" align="center">
                  <input type="submit" value="���� �Ϸ�" class="button">
            </div>
            </form>
      <br>
   <br>
   <br>
   <br>
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