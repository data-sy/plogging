<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href = "css/Join.css?after" rel = "stylesheet">
<script type="text/javascript">
    
        // ȸ������ ȭ���� �Է°����� �˻��Ѵ�.
        function checkid()
        {
            var form = document.userInfo;
        
            if(fr.id.value){
                alert("���̵� �Է��ϼ���.");
                form.id.focus();
            }else{
            window.open("IdCheckForm.jsp?id=" + fr.id.value,"id check","toolbar=no, width=1350, height=1450, top=1450, left=1450")
           }
        }
        // ��� ��ư Ŭ���� ùȭ������ �̵�
        function goFirstForm() {
            location.href="Main.jsp";
        }    
        function winopen(){
           //��â�� ��� �������� ���� �� -> ȸ�����̵������� ������ �ߺ�üũ
           //1. ���̵� ������ �˸�â�� ����x
           if(document.fr.id.value =="" || document.fr.id.value.length < 0){
              alert("���̵� ���� �Է����ּ���")
              document.fr.id.focus();
           }else{
              //2. ȸ���������̵� ������ �ִ� �� üũ�Ϸ��� DB�� �����ؾ��Ѵ�.
              //�ڹٽ�ũ��Ʈ�� ��� DB�� �����ұ�? => �Ķ���ͷ� id���� �������� jsp���������� �����ϸ� �ȴ�.
              window.open("check_id.jsp?userid="+document.fr.id.value,"","width=500, height=300");
           }
        }
        function pwcheck(){
            
            var pw = document.getElementById('pw').value;
            var SC = ["!","@","#","$","%"];
            var check_SC = 0;
 
            if(pw.length < 2 || pw.length>6){
                window.alert('��й�ȣ�� 2���� �̻�, 6���� ���ϸ� �̿� �����մϴ�.');
                document.getElementById('pw').value='';
            }
            for(var i=0;i<SC.length;i++){
                if(pw.indexOf(SC[i]) != -1){
                    check_SC = 1;
                }
            }
            if(check_SC == 0){
                window.alert('!,@,#,$,% �� Ư�����ڰ� �� ���� �ʽ��ϴ�. �Է����ּ���.')
                document.getElementById('pw').value='';
                document.getElementById('pw2').value='';
                
                           }
            if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
                if(document.getElementById('pw').value==document.getElementById('pw2').value){
                    document.getElementById('check').innerHTML='��й�ȣ�� ��ġ�մϴ�.'
                    document.getElementById('check').style.color='blue';
                    document.getElementById('check').style.fontSize='30px';
                }
                else{
                    document.getElementById('check').innerHTML='��й�ȣ�� ��ġ���� �ʽ��ϴ�.';
                    document.getElementById('check').style.color='red';
                    document.getElementById('check').style.fontSize='30px';
                }
            }
        }
   </script>
</head>
<body>
<div>
     <table align="center">
         <tr>
            <td><h2>Plogging</h2></td>
         </tr>
     </table>
   </div>
   <table>
      <tr>
         <h1 align="center">ȸ������</h1>
      </tr>
   </table>
   <form action="joinServiceCon" method="post" name="fr">
      <table align="center" >
         <tr>
            <td align="right" width="35%"><h3>���̵�</h3></td>
            <td align="left"><input type="text" name="id" maxlength="50" class="tex">
            <input type="button" value="�ߺ�Ȯ��" class="dbutton" onclick="winopen()">
               
            </td>
         </tr>
      </table>
      
      <table align="center" >
         <tr>
            <td align="right" width="35%"><h3>��й�ȣ</h3></td>
            <td align="left"><input type="password" name="pass" maxlength="20" id="pw"
                     onchange="pwcheck()" class="tex">
            </td>
         </tr>
      </table>  
      
      <table align="center" >
         <tr>
            <td align="right" width="35%"><h3>��й�ȣ Ȯ��</h3><span id="check"></span></td>
            <td align="left"><input type="password" name="passcheck" maxlength="20"
               id="pw2" onchange="pwcheck()" class="tex" >
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
            <td><input type="text" name="age" maxlength="20" class="tex">
            </td>
         </tr>
      </table>  
      
      <table align="center" >
         <tr>
            <td align="right" width="35%"><h3>�ּ�</h3></td>
            <td><input type="text" id="sample5_address" placeholder="�ּ�" class="tex"></td>
            	<td align="left"><input type="button" onclick="sample5_execDaumPostcode()" value="�ּ� �˻�" class="dbutton"><br>
               <input type="text" id="latlng" name="latlng" style="display: none">
               <input type="text" id="lat" name="lat" style="display: none">
               <input type="text" id="lng" name="lng" style="display: none">
               <div id="map" style="width: 1px; height: 1px;"></div>
               <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
               <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e08bf3a21c48702f150d8aa74eed2e61&libraries=services"></script>

               <script>
                            var mapContainer = document.getElementById('map'), // ������ ǥ���� div
                                mapOption = {
                                    center: new daum.maps.LatLng(37.537187, 127.005476), // ������ �߽���ǥ
                                    level: 5 // ������ Ȯ�� ����
                                };
                        
                            //������ �̸� ����
                            //var map = new daum.maps.Map(mapContainer, mapOption);
                            //�ּ�-��ǥ ��ȯ ��ü�� ����
                            var geocoder = new daum.maps.services.Geocoder();
                            
                            //��Ŀ�� �̸� ����
                            var marker = new daum.maps.Marker({
                                position: new daum.maps.LatLng(37.537187, 127.005476),
                                map: map
                            });
                        
                            function sample5_execDaumPostcode() {
                                new daum.Postcode({
                                    oncomplete: function(data) {
                                        var addr = data.address; // ���� �ּ� ����
                        
                                        // �ּ� ������ �ش� �ʵ忡 �ִ´�.
                                        document.getElementById("sample5_address").value = addr;
                                        // �ּҷ� �� ������ �˻�
                                        geocoder.addressSearch(data.address, function(results, status) {
                                            // ���������� �˻��� �Ϸ������
                                            if (status === daum.maps.services.Status.OK) {
                        
                                                var result = results[0]; //ù��° ����� ���� Ȱ��
                        
                                                // �ش� �ּҿ� ���� ��ǥ�� �޾Ƽ�
                                                var coords = new daum.maps.LatLng(result.y, result.x);
                                                // (coords ��ü�� (����, �浵) ���·� ����)
                                                document.getElementById("latlng").value = coords.toString();
                                                document.getElementById("lat").value = coords.getLat().toString();
                                                document.getElementById("lng").value = coords.getLng().toString();
                                                console.log(coords.toString());
                                                console.log(coords.coords.getLat().toString());
                                                console.log(coords.coords.getLng().toString());
                                 
                                                // ������ �����ش�.
                                                mapContainer.style.display = "block";
                                                map.relayout();
                                                // ���� �߽��� �����Ѵ�.
                                                map.setCenter(coords);
                                                // ��Ŀ�� ��������� ���� ��ġ�� �ű��.
                                                marker.setPosition(coords)
                                            }
                                        });          
                                    }
                                }).open();
                            }
                            </script></td>
         </tr>
      </table>  

		<table align="center" >
         <tr>
            <td align="right" width="35%"><h3>�÷α� ����</h3></td>
            <td ><label style="font-size:30px; padding-left:30px;"><input type="radio"  style="width:30px;height:30px" name="exp" value="��">
                 	��</label>

                  <label style="font-size:30px;"><input type="radio"  style="width:30px;height:30px" name="exp" value="��">
                  	��</label>

         </tr>
		</table>  


      <div class="btn_area" align="center">
         <p>
            <input type="submit" value="�����ϱ�" class="button">
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