<%@page import="Model.boardReDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.boardReDAO"%>
<%@page import="Model.memberDTO"%>
<%@page import="Model.boardDTO"%>
<%@page import="Model.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Forty by HTML5 UP</title>
	<meta charset="utf-8" />
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
	<!--<link rel="stylesheet" href="assetsBoard/css/main.css" />-->
	<!--<link rel="stylesheet" href="assetsBoard/css/board.css" />-->
	<script src="https://kit.fontawesome.com/15d6ad4059.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="css/viewBoard.css?after">
	<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	<script type="text/javascript">
	</script>
</head>
<body>

<%
   memberDTO info = (memberDTO)session.getAttribute("info");
	if(info!=null){
	   System.out.println("info�� id Ȯ�� : " + info.getMemberId());
	}
   int boardNum = Integer.parseInt(request.getParameter("boardNum"));   
   System.out.println("Board���� viewBoard�� board_num�� �� �Ѿ�Դ��� Ȯ�� : "+ boardNum);
   
   boardDAO dao = new boardDAO();
   // �Խù�ȣ�� �´� �Խñ� �������� ��� �޼ҵ�
   boardDTO dto = dao.showOne(boardNum);
   System.out.println("dto�� �Խù�ȣ Ȯ�� : " + dto.getBoardNum());
   System.out.println("dto�� �Խû��id Ȯ�� : " + dto.getMemberId());
   System.out.println("dto�� �Խó�¥ Ȯ�� : " + dto.getBoardDate());
   System.out.println("dto�� �Խó��� Ȯ�� : " + dto.getBoardContent());
   System.out.println("dto�� �Խ����� Ȯ�� : " + dto.getBoardTitle());
   System.out.println("dto�� �Խ��̹��� Ȯ�� : " + dto.getBoardImage());
    
   boardReDAO dao1= new boardReDAO();
   ArrayList<boardReDTO> boardRe_list= dao1.boardRe_li(boardNum);
%>
<table>
	<tr>
		<div style = "background: #FEEDCC;
				width: 991px;
				height: 139px;
				position: absolute;
		   		z-index: -1;
		   		margin: -7px 0px 0px -8px;">
		<td id="title" style=" font-family: 'netmarbleB';">Plogging</td>
		<% if(info != null) { %>
			<td>
				<i id="myimport" class="far fa-user" type="button" value="������ �˻�" onClick="location.href='myPage.jsp'" ></i>
			</td>
		<% }else { %>
			<td>
				<a id="myimport" onClick="location.href='Login.jsp'">
					<img id='login' src= "login.png" style ="margin:10px 10px 0px 10px; width:30px;" >
					�α���
				</a>
			</td>
		<% } %>
	</tr>
</table>

	<div class="board">     
		<table>
			<tr>
				<td colspan="2" id="gettitle">���� : <%= dto.getBoardTitle()%></td>
			</tr>
            <tr>
				<td id ="date" > �ۼ� ���� : <%=dto.getBoardDate() %> </td>   
				<td id ="memberId" > �ۼ��� : <%=dto.getMemberId() %> </td>
            </tr>
            <tr>
   		</table>
   	<hr>
   		<table>
            <tr>
               <td colspan="2" id="content" height="600px">
                  <% if(dto.getBoardImage()!=null) {%>
                      <img src="img/<%=dto.getBoardImage()%>">
                    <% } %>
                    <% if(dto.getBoardContent()!=null) {%>
                       <%= dto.getBoardContent() %>
                    <% } %>
                </td>
            </tr>
		</table>
   	<hr>
		<table>
			<tr>
				<%if(info!=null){ %>
					<%if(info.getMemberId().equals(dto.getMemberId())) {%> 
                  		<td><a href="DeleteOneServiceCon?num=<%=dto.getBoardNum()%>">���� </a></td>
                   <%}else{%>
                   		<td></td>
                   <%} %>
                <%}else{ %>
                <td></td>
                <%} %>
				<td style="text-align:right"><a href="Board.jsp"><button class="dbuttonRe">�ڷΰ���</button></a></td>
	         </tr>
       </table>
	</div>	
<br>
<br>

   	<hr>

	<div class="board">     
		<table>
			<tr>
				<td colspan="2" id="re">���</td>
			</tr>
			<% for(int i = 0; i<boardRe_list.size();i++){ %>
				<tr>
					<td id ="memberId" ><%=boardRe_list.get(i).getMemberID()%></td>
					<td style="padding:8px"><%=boardRe_list.get(i).getCommentsContents()%></td>
				</tr>
			<%} %>
		</table>
	</div>

<br>

<form action="ReBoardServiceCon" method="post">
	<input type="hidden" value="<%=boardNum%>" name="boardNum">
		<table>
			<tr>
				<td colspan="4" id="re">���</td>
			</tr>
			<tr>
				<td id ="memberId" >�̸�</td>
				<td>
					<%if(info!=null){ %>
						<span><%=info.getMemberId() %></span>
					<%}else{ %>
						<input class="tex" type="text" name="name">
					<% } %>
				</td>
				<td style="text-align:right;">��й�ȣ</td>
				<td><input class="tex" type="password" name="password"></td>
				<td></td>
			</tr>
			<tr>
				<td id ="memberId" >����</td>
				<td colspan="3">
				<textarea class="tex" style="width:85%" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td>
				<input class="dbuttonRe" type="reset" value="�ٽþ���">
				</td>
				<td colspan="2"></td>
				<td style="text-align:right; padding:0px 20px;" >
				<input class="dbuttonRe" type="submit" value="����" name="cmd">
				</td>
				
			</tr>
		</table>
</form>
   
<br><br><br>    
<br><br><br>    
<br><br><br>     
<table>
<table>
<div id="down"></div>
   <div  class="dbutton1" type="button" value="����" name="main" onClick="location.href='Main.jsp'">����</div>
   <div class="dbutton2" type="button" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'">��ȸ</div>
   <div class="dbutton3" type="button" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'">�ı�</div>
   <div class="dbutton4" type="button" value="�Խ���" name="board" onClick="location.href='Board.jsp'">�Խ���</div>
   <div class="dbutton5" type="button" value="����" name="report" onClick="location.href='reportPostWrite.jsp'">����</div>
</table>  
<!-- Scripts -->
 <!--  <script src="assets/js/jquery.min.js"></script>-->
 <!--  <script src="assets/js/jquery.scrolly.min.js"></script>-->
 <!--  <script src="assets/js/jquery.scrollex.min.js"></script>-->
 <!--  <script src="assets/js/skel.min.js"></script>-->
 <!--  <script src="assets/js/util.js"></script>-->
   <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
  <!--  <script src="assets/js/main.js"></script>-->
</body>
</html>