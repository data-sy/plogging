<%@page import="Model.memberDAO"%>
<%@page import="Model.boardDTO"%>
<%@page import="Model.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/check_id.css?after">
</head>
<body>
<table  align="center">
   <tr>
      <td><h2>���̵��ߺ�üũ</h2><td>
   </tr>
</table>
<table align="center">
<tr>
<td align="center" style="font-size:15px;">
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("userid");
memberDAO dao = new memberDAO();
int result = dao.checkId(id);

if(result==1){
   out.print("��밡���� ���̵��Դϴ�.");

%>
</td>
<td align="center" style="font-size:15px; height:50px;">
<input type="button" class="dbutton" value="���̵� ����ϱ�" onclick="result();">
<%}else if(result==0){
   out.print("�ߺ��Ⱦ��̵��Դϴ�.");
   }else{
   out.print("���� �߻�!!(-1)");
   }
   %>
   </td>
   </tr>
   </table>
   

   
   <form action="check_id.jsp" method="post" name=wfr>
   <table align="center" >
         <tr>
            <td align="right" width="35%"><h3>���̵�</h3></td>
            <td align="center"><input type="text" style="width:100px;height:25px;font-size:15px;" class="stex3" name="userid" value="<%=id%>"></td>
   		<td><input type="submit" class="dbutton" value="�ߺ�Ȯ��"> </td>
            </td>
         </tr>
      </table>  
 
   </form>
   <table>

<script type="text/javascript">



function result(){
   opener.document.fr.id.value=document.wfr.userid.value;
   opener.document.fr.id.readOnly=true;
   window.close();
}



</script>


</body>
</html>