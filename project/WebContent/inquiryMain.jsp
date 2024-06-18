<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="Model.notice_BoardDTO"%>
<%@page import="Model.notice_BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.memberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href = "css/inquiryMain.css" rel = "stylesheet">
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
	memberDTO info = (memberDTO)session.getAttribute("info");
	ArrayList<notice_BoardDTO> array = new ArrayList<notice_BoardDTO>();
	notice_BoardDAO dao = new notice_BoardDAO();
	if (info!=null){
		array = dao.showBoard(info.getMemberId());
		System.out.print("��ȸ�� �ߴ� ���� ���� : " + array.size());
	}
	

    
    
%>
   <div>
      <table align="center" >
<tr>
   <div style = "background: #FEEDCC;
	width: 1006px;
    height: 91px;
    position: absolute;
    z-index: -1;
    margin: -7px 0px 0px -8px;"><td id="title" style=" font-family: 'netmarbleB';">Plogging</td></div>
            <td style="float: right">
            	<i class="far fa-user"  type ="button" value = "������ �˻�" onClick="location.href='myPage.jsp'" id = "myimport" ></i>
            </td>
         </tr>
      </table>
   </div>

<table align="center" >
		<div class="searchbox">
           <div class="header">
             <div>����� �÷α��� ã�Ƶ帱�Կ�</div>
             <input onkeyup="filter()" type="text" id="value" placeholder="������ �ּ����� �Է����ּ���">
           </div>
         </div>
</table>
<table align="center" >
    		<div class="container" style="display:none">
           	<%for(int i=0; i<array.size(); i++){%>
				<%if(info != null){%>
				<form action = "chatTest.jsp">
		           	<tr>
		    			<td class="Itable">
							<div class = "item"><span id="mula"><br>
							<div><img id="img" src="img/<%=array.get(i).getNoticeImage()%>"></div><br>
							<span id="iconee" class="name"> �ּ��� : <%=array.get(i).getAddr() %></span><br>
							<span id="iconee"> �÷α� ���� : <%=dao.changeDateFormat(array.get(i).getPlogDate())%></span><br>
							<span><input id = "iconee" type= "hidden" name="noticeNumber" value="<%=array.get(i).getNoticeNumber()%>"></span>
							<span id="iconee"> �÷α� ���� �ο�  : <%=array.get(i).getLimitedNumber()%></span><br>
							<span><%=array.get(i).getNoticeNumber()%>�� �����</span>
							<span ><input id ="input" type = "submit" value = "����"></span></div>
							</div>
							<input type= "hidden" name="noticeNumber" value="<%=array.get(i).getNoticeNumber()%>">
						<td>
		    		</tr>
		    	 </form>
    		</div>  	
				<%}else{%>
			<div>
				<tr>
	    			<td class="Itable">
				   		ȸ���Բ����� �� ���� ��û�� �� �����ϴ�!
				   	<td>
	    		</tr>
			</div>
				<%}%>
			<%}%>
</table>
<br><br><br><br><br><br>
<br><br><br>
<table>
<div id="down"></div>
   <div  class="dbutton1" type="button" value="����" name="main" onClick="location.href='Main.jsp'">����</div>
   <div class="dbutton2" type="button" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'">��ȸ</div>
   <div class="dbutton3" type="button" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'">�ı�</div>
   <div class="dbutton4" type="button" value="�Խ���" name="board" onClick="location.href='Board.jsp'">�Խ���</div>
   <div class="dbutton5" type="button" value="����" name="report" onClick="location.href='reportPostWrite.jsp'">����</div>
</table>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72d306962d4f7f31bb4597d71782852b&libraries=services"></script>
<script>
    function filter(){
        var value, name, item, i;
        value = document.getElementById("value").value.toUpperCase();
        item = document.getElementsByClassName("item");
        for(i=0;i<item.length;i++){
          name = item[i].getElementsByClassName("name");
          if(name[0].innerHTML.toUpperCase().indexOf(value) > -1){
            item[i].style.display = "flex";
          }else{
            item[i].style.display = "none";
          }
        }
      }
</script>

</body>
</html>