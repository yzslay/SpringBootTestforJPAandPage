<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <%! @SuppressWarnings("unchecked") %>
<!DOCTYPE html>
<html>
<head>
	<% String path=request.getContextPath();
	   String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"event";
	   System.out.println(basePath);%>
<base href="<%=basePath%>">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<meta charset="UTF-8">

 <!-- Latest compiled and minified CSS -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <!-- jQuery library -->
 <script
 src="https://code.jquery.com/jquery-3.6.0.js"
 integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
 crossorigin="anonymous"></script>
 <!-- Latest compiled JavaScript -->
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

 <script
			  src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
			  integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30="
			  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/datepicker/1.0.10/datepicker.min.js" integrity="sha512-RCgrAvvoLpP7KVgTkTctrUdv7C6t7Un3p1iaoPr1++3pybCyCsCZZN7QEHMZTcJTmcJ7jzexTO+eFpHk4OCFAg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js" integrity="sha512-ux1VHIyaPxawuad8d1wr1i9l4mTwukRq5B3s8G3nEmdENnKF5wKfOV6MEUH0k/rNT4mFr/yL+ozoDiwhUQekTg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<title>新增活動資料</title>

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

footer{
  background-color:#58876D;
  padding:13px;
  margin:5px;
  font-size:20px;
  text-align: center;
  font-weight:bolder;
}
.anchor::before {
content: "";
display: block;
height: 70px;
}

</style>

</head>

<body>
  <nav>
  <ul>
    <li><a href="queryallevent.controller" class="href">查詢所有活動</a> 	</li>
    <li><a href="createeevent.url" class="href">新增活動</a> 	</li>
    <li><a href="about" class="href">沒在用</a> 	</li>
  </ul>
</nav>	

<div class="container anchor">
  <form method="post" name="submitselection" action="/petpet/addevent.controller" >  
     <input type="hidden"  readonly name="eventid" value="${event.eventID}" />
 

    <div class="row"> 
      <div class="col">
          活動名稱 :<br> <input type="text" class="form-control" required name="eventname"  />
          <small  class="form-text text-muted">
          必填欄位
      </small>
        <p>  
        </div>
        <div class="col form-check">
          活動是否開啟: <br><input type="checkbox" class="form-check-input"  name="eventstatus" id="checkboxId" value="true" />
             <small class="form-text text-muted">
          必填欄位
           </small>      		
        </div>

      </div>
      <div class="row">
          <div class="col">
          活動起始日期: <br><input type="date"  class="form-control" required  name="eventstartdate" />
          <small id="passwordHelpBlock" class="form-text text-muted">
          必填欄位
      </small>
          <p>
        </div>
    <div class="col">
          活動起始時間: <br><input type="time"  class="form-control" required  name="eventstarttime"  />
          <small id="passwordHelpBlock" class="form-text text-muted">
          必填欄位
      </small>
          <p>
        </div>
        <div class="col">
          活動結束日期: <br><input type="date"  class="form-control" required name="eventenddate" id="date2" value ="${event.eventEnddate}" />  
          <small id="passwordHelpBlock" class="form-text text-muted">
          必填欄位
      </small><p>
        </div>
    <div class="col">
          活動結束時間: <br><input type="time"   class="form-control" required name="eventendtime" value ="${event.eventEndTime}" />  
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


  
// let checkState = $("#checkboxId").is(":checked") ? "true" : "false";

</script>

</html>