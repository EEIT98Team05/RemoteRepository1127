<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <title>Chat Room</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!--     <script type="text/javascript" src="js/chat.js"></script> -->
<!--     <link rel="stylesheet" href="css/chat.css"/> -->
<script type="text/javascript">
//get message content
//data is the message content data
function GetMessageList(){
	  $.ajax({
	      type: "POST",
	      url: "${pageContext.request.contextPath}/ChatList.match",
	      data: "memId=" + memId,
	      success: function(data) {
	          $("#divContent").html(data);
	      }
	  });
	  AutoUpdContent();
} 
//auto update member and message
function AutoUpdContent() {
    setTimeout(GetMessageList, 500);
}
//send message 
function SendContent(content) {
    $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath}/SendContent.match",
        data: "content=" + content + "&memId=" + memId,
        success: function(data) {
            //alert(data);
            if (data==1) {
                GetMessageList();
                $("#txtContent").val("");
            }else {
                GetMessageList();
                alert("請先登入!");
                window.location.href="Login.html";
            }
        }
    });
}
//選單換資訊
function ChangeInfo(){
	memId = $("#idList").val();//下拉選單選擇後讀取對話
	$.ajax({
		type: "POST",
		url: "${pageContext.request.contextPath}/idInformation.match",
		data: "memId=" + memId,
		success: function(data){
			$("#infoList").empty();
			if(data.serviceId){
			var img = "../images/match/" + data.serviceId + ".jpg";
			var area = "服務地區: " + data.area;
			var type = "服務類型: " + data.type;
			var experience = "服務資歷: " + data.experience + "年";
			var introduction = "介紹: " + data.introduction;
			var cell0 = $("<img>").attr("src", img).css({width:'120px',height:'120px'});
			var cell1 = $("<h3></h3>").text(area);
			var cell2 = $("<h3></h3>").text(type);
			var cell3 = $("<h3></h3>").text(experience);
			var cell4 = $("<h3></h3>").text(introduction);
			var row = $("#infoList").append(cell0,cell1,cell2,cell3,cell4);				
			} else {
	            console.log("reservation");
			}			
	      }	
 })
}
//jQuery(document).ready(function{});
$(function() {//載入網頁後要做的事
  memId = $("#idList").val();//先讀對話
  GetMessageList();
//送出按鈕--------------------------------------------------------------------------------
    $("#Button1").click(function() { //按鈕點擊事件        
        if ($("#txtContent").val() != "") {//發送內容
            SendContent($("#txtContent").val());
        }
        else {
            alert("發送不能為空!");
            $("#txtContent").focus();
            return false;
        }
    })
//下拉選單--------------------------------------------------------------------------------
// 	$.get("${pageContext.request.contextPath}/servantIdList.match", function(data){
// 		console.log(data);
// 		$.each(data, function(i, servant){
// 			var cell1 = $("<option></option>").val(servant[0]).text(servant[1]);
// 			var row = $("#idList").append(cell1);
// 		})
// 	})
	$("#idList").on('focus',function(){
		$("#idList").empty();
        var docFrag = $(document.createDocumentFragment());
        docFrag.append("<option>請選擇</option>");
console.log(55555555555555);
		$.get("${pageContext.request.contextPath}/servantIdList.match", function(data){
			console.log(data)			
			$.each(data, function(i, servant){
				var cell1 = $("<option></option>").val(servant[0]).text(servant[1]);
				docFrag.append(cell1);				
			})
			$("#idList").html(docFrag);
		})
// 		$("#idList").prepend("<option>請選擇</option>");
// 		$("#idList").val(data[0]);
// 		memId = $('#idList option[index="1"]').attr("value");
// 		console.log(memId);
// 		ChangeInfo(); 
	})
//選單選人----------------------------------------------------------------------------------
    $("#idList").on('change',function(){
//     	if($('#test'))
//         $("#idList option[id='test']").remove();
		ChangeInfo();   		
	})
	
})
</script>    
<style>
body
{
    font-size:11px
}
h3
{
    margin:0px
}
.divShow
{
    border:solid 1px #ccc;
    height:300px;
    padding:5px;
    font-size:12px;
    overflow-y:scroll
}
#divMain
{
    border:solid 5px #ccc
} 
#divMain .divtop
{
    padding:10px
}
#divMain .divtop .divL
{
    float:left;
    width:560px;
}
#divMain .divtop .divR
{
    float:right;
  
} 
#divMain .divBot
{
    clear:both;
    padding:10px
}
#divMain .divBot .pb
{
    padding-bottom:3px
}
#divMain .divBot .pl
{
    padding-left:12px
}
#divMain .divBot .pt
{
    padding-top:3px;
    color:#555
}
.clsTip
{
    position:absolute;
    width:160px;
    text-align:center;
    font-size:13px;
    border:solid 1px #cc3300;
    margin-top:5px;
    padding:2px;
    margin-bottom:5px;
    background-color:#ffe0a3;
    display:none;
 }
 .upload
 {
 display:none;
 }
.txt
{
    border:#666 1px solid;
    padding:2px;
    margin-right:3px
 }
.btn 
{
    border:#666 1px solid;
    padding:2px;
    width:100px;
    height:50px; 
    font-size:16px;
    filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0,StartColorStr=#ffffff, EndColorStr=#ECE9D8)
}
</style>    
</head>

<body>
    <div id="divMain" style="width:900px;">
        <div class="divtop">
            <div class="divL">
            <h3>聊天室</h3>
                <div class="divShow" id="divContent"></div>
            </div>
            <select id="idList">
            <option id="test">請選擇</option>
            <!-- 即時通選單 -->
            </select>
            <div id = "infoList">          
            xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            
            xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            
            xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            
            xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            
            xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            
            xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx          
            </div>
<!--             <div class="divR"> -->
<!--                 <h3>Online Member</h3> -->
<!--                 <div class="divShow" id="divOnLine"></div> -->
<!--             </div> -->
        </div>
        <div class="divBot">
            <table cellpadding="0" cellspacing="0">
                <tr><td colspan="2" id="divFace" class="pb"></td></tr><tr><td>
                <textarea id="txtContent" cols="61" rows="3" class="txt" style="resize:none;"></textarea></td><td class="pl">
                <input id="Button1" type="button" value="送出" class="btn"/>
<!--                 <input id="Button3" type="button" value="Upload" class="btn"/> -->
<!--                 <input id="Button2" type="button" value="Exit" class="btn"/> -->
                <input id="Button4" style="display:none" type="button" value="Hide" class="btn"/>

            </td></tr><tr><td colspan="2" class="pt">請輸入對話</td></tr></table>
        </div>
        <span id="divMsg" class="clsTip">Sending Data...</span>
<!--         <div class="upload" id="file"> -->
<!--             <div id="fileQueue"></div>   -->
<!--             <input type="file" name="uploadify" id="uploadify" />  -->
<!--             <p>   -->
<!--                 <a href="javascript:$('#uploadify').uploadify('upload')">Start To Upload</a>    -->
<!--                 <a href="javascript:$('#uploadify').uploadify('cancel','*')">Cancel Upload</a>   -->
<!--             </p> -->
<!--         </div> -->

    </div>
</body>
</html>
