<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.* "%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%! @SuppressWarnings("unchecked") %>
<!DOCTYPE html>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
			  src="https://code.jquery.com/jquery-3.6.0.js"
			  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
			  crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<html>
<head>
	<% String path=request.getContextPath();
	   String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"event";
	   System.out.println(basePath);%>
	<base href="<%=basePath%>">
<script>
			  src="https://code.jquery.com/jquery-3.6.0.js"
			  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
			  crossorigin="anonymous"
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

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
	<fmt:setLocale value="en" /> 
<div class="container anchor">
    <form method="post" name="submitselection" action="/petpet/modifyevent.controller" >  
    	 <input type="hidden"  readonly name="eventid" value="${event.eventID}" />
   

    	<div class="row"> 
    		<div class="col">
        		活動名稱 :<br> <input type="text" class="form-control" required name="eventname" placeholder="${event.eventName}" value="true" />
	        	<small  class="form-text text-muted">
	        	必填欄位
				</small>
        	<p>  
        	</div>
			
			<div class="col form-check">
		
				 <c:choose>
					<c:when test="${event.eventStatus == 'true'}">
						<td>
						活動是否開啟: <br><input type="checkbox" class="form-check-input"  name="eventstatus" id="checkboxId" checked value="true" />
						<small class="form-text text-muted">
						必填欄位
						</small> 
						</td>
					</c:when>
					<c:when test="${event.eventStatus == 'false'}">
						<td>
						活動是否開啟: <br><input type="checkbox" class="form-check-input"  name="eventstatus" id="checkboxId" value="true" />
						<small class="form-text text-muted">
						必填欄位
						 </small> 
						</td>
					</c:when>
				</c:choose> 		
			</div>

      	</div>
      	<div class="row">
			
			<div class="col">
        		活動起始日期: <br><input type="date" id="startdate" class="form-control" required  name="eventstartdate"  >
        		<small id="passwordHelpBlock" class="form-text text-muted">
	        	必填欄位
				</small>
        		<p>
        	</div>
			<div class="col">
				活動起始時間: <br><input type="time" id="starttime"  class="form-control" required name="eventstarttime" > 
				<small id="passwordHelpBlock" class="form-text text-muted">
			  必填欄位
			  </small><p>
		  </div>
        	<div class="col">
      			活動結束日期: <br><input type="date" id="enddate" class="form-control" required name="eventenddate"  >  
      			<small id="passwordHelpBlock" class="form-text text-muted">
	        	必填欄位
				</small><p>
        	</div>
			<div class="col">
				活動結束時間: <br><input type="time" id="endtime" class="form-control" required name="eventendtime" />  
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

共被點選${event.eventClick}次
    
<footer>
	第八組組員-蕭詠謙
</footer>
    

</body>
<script>

$(document).ready(function() {
	var startdatevalue = "<fmt:formatDate pattern="yyyy-MM-dd" value="${event.eventStartTime}"/>";
	console.log(startdatevalue);
	document.getElementById("startdate").value =  startdatevalue;

	var starttimevalue = "<fmt:formatDate pattern="HH:mm" value="${event.eventStartTime}"/>";
	console.log(starttimevalue);
	document.getElementById("starttime").value =  starttimevalue;

	var enddatevalue = "<fmt:formatDate pattern="yyyy-MM-dd" value="${event.eventEndTime}"/>";
	console.log(enddatevalue);
	document.getElementById("enddate").value =  enddatevalue;

	var endtimevalue = "<fmt:formatDate  pattern="HH:mm" value="${event.eventEndTime}"/>";
	console.log(endtimevalue);
	document.getElementById("endtime").value =  endtimevalue;

})





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