<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.* "%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%! @SuppressWarnings("unchecked") %>
<!DOCTYPE html>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
			  src="https://code.jquery.com/jquery-3.6.0.js"
			  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
			  crossorigin="anonymous"></script>
			  <script src="https://cdnjs.cloudflare.com/ajax/libs/datepicker/1.0.10/datepicker.min.js" integrity="sha512-RCgrAvvoLpP7KVgTkTctrUdv7C6t7Un3p1iaoPr1++3pybCyCsCZZN7QEHMZTcJTmcJ7jzexTO+eFpHk4OCFAg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/datepicker/1.0.10/datepicker.min.js" integrity="sha512-RCgrAvvoLpP7KVgTkTctrUdv7C6t7Un3p1iaoPr1++3pybCyCsCZZN7QEHMZTcJTmcJ7jzexTO+eFpHk4OCFAg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<html>
<head>
	<% String path=request.getContextPath();
	   String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"event";
	   System.out.println(basePath);%>
	<base href="<%=basePath%>">
<style>

nav {
  background-color: #60CA91;
  padding:13px;
  position:fixed;
  top:0;
  left:0;
  width:100%;
  z-index:100;
}
nav ul{
  display:flex;
  margin:0 auto;
  padding:0;
  justify-content:center;
  list-style-type: none;
}
nav ul li a{
  color:deepblue;
  padding:15px;
  font-size:28px;
  margin:40px;
}

.anchor::before {
content: "";
display: block;
height: 80px;
}
footer{
  background-color:#58876D;
  padding:13px;
  margin:0px;
  font-size:20px;
  text-align: center;
  font-weight:bolder;
}
</style>
<meta charset="UTF-8">
<title>修改活動資料</title>
</head>


<body>
    <nav>
		<ul>
			<li><a href="queryallevent.controller" class="href">查詢所有活動</a> 	</li>
			<li><a href="addevent.controller" class="href">新增活動</a> 	</li>
			<li><a href="about" class="href">沒在用</a> 	</li>
		</ul>
	</nav>	
	
<div class="container anchor">
    <form method="post" name="submitselection" action="/petpet/modifyevent.controller" >  
    	 <input type="hidden"  readonly name="eventid" value="${event.eventID}" />
   

    	<div class="row"> 
    		<div class="col">
        		活動名稱 :<br> <input type="text" class="form-control" required name="eventname" value="true" />
	        	<small  class="form-text text-muted">
	        	必填欄位
				</small>
        	<p>  
        	</div>
        	<div class="col">
      		  活動是否關閉: <br><input type="checkbox" class="form-control" required name="eventstatus" id="checkboxId" />
      		     <small class="form-text text-muted">
	        	必填欄位
				</small>      		
      		</div>

      	</div>
      	<div class="row">
            <div class="col">
        		活動起始日期: <br><input type="text"  class="form-control" required  name="eventstartdate" value ="${event.eventStratdate}" />
        		<small id="passwordHelpBlock" class="form-text text-muted">
	        	必填欄位
				</small>
        		<p>
        	</div>
			<div class="col">
        		活動起始時間: <br><input type="text" step="1" class="form-control" required  name="eventstartime" value ="${event.eventStratTime}" />
        		<small id="passwordHelpBlock" class="form-text text-muted">
	        	必填欄位
				</small>
        		<p>
        	</div>
        	<div class="col">
      			活動結束日期: <br><input type="text"  class="form-control" required name="eventenddate" value ="${event.eventEnddate}" />  
      			<small id="passwordHelpBlock" class="form-text text-muted">
	        	必填欄位
				</small><p>
        	</div>
			<div class="col">
				活動結束時間: <br><input type="text" step="1" class="form-control" required name="eventendtime" value ="${event.eventEndTime}" />  
				<small id="passwordHelpBlock" class="form-text text-muted">
			  必填欄位
			  </small><p>
		  </div>
        </div>
        <div class="row">
     	     <div class="col">
       			 活動地點: <br><input type="text" class="form-control" required  name="eventlocation" value ="${event.eventLocation}" />
       			 <small id="passwordHelpBlock" class="form-text text-muted">
	        	必填欄位
				</small>
				<p>        
       		 </div>
       	</div>
       	 <div class="row">
       		 <div class="col">
        		活動種類: <br><input type="text" class="form-control" required name="eventtype" value ="${event.eventType}"/>
        		<small id="passwordHelpBlock" class="form-text text-muted">
	        	必填欄位
				</small>
				<p>
             </div>
        </div>
        <div class="row">
        	<div class="col">
		        活動人數上限: <br><input type="text"  class="form-control" required name="eventmaxlimit"value ="${event.eventMaxLimit}" /><p>
		    </div>
		    <div class="col">
        	活動費用:<br><input type="text"  name="eventfee"  value ="${event.eventFee}" />
        	 <small class="form-text text-muted">
		     必填欄位
			 </small>  <p>
        	</div>
        </div>
        <div>
        活動說明:<br><textarea name="eventdescription"  rows="5" cols="50"> ${event.eventDescription} </textarea><p>
   		</div>
        <button type="submit" class="btn btn-primary">確認</button>
     </form>

</div>

共被點選${event.eventclick}次
    
<footer>
	第八組組員-蕭詠謙
</footer>
    

</body>
<script>
$( "#date" ).datepicker(
  		{ dateFormat: 'yy-mm-dd' }
	);
$(".timepicker").timepicker({
  timeFormat: "h:mm p", // 時間隔式
  interval: 60, //時間間隔
  minTime: "10", //最小時間
  maxTime: "6:00pm", //最大時間
  defaultTime: "11", //預設起始時間
  startTime: "10:00", // 開始時間
  dynamic: true, //是否顯示項目，使第一個項目按時間順序緊接在所選時間之後
  dropdown: true, //是否顯示時間條目的下拉列表
  scrollbar: true, //是否顯示捲軸
});

	let checkState = $("#checkboxId").is(":checked") ? "true" : "false";


	// window.onload=function(){ 
	//  var osel=document.getElementById("selID"); //得到select的ID
	//  var opts=osel.getElementsByTagName("option");//得到陣列option
	//  var obt=document.getElementById("bt");
	//  obt.onclick=function(){
	//  opts[3].selected=true;//設定option第4個元素，即value="3"為預設選中
	//  }
	// } 
	</script> 
</html>