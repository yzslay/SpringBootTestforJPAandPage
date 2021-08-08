<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.* "%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%! @SuppressWarnings("unchecked") %>
<!DOCTYPE html>
<html>
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/backstage/backstage.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/backstage/backstagemevent.css"/>

<!-- JQ -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<!-- Bootstrap套件 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Google Api -->
<script  async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDCn5ZqGvjfSwtQI12hbGKq2RraF1WlSa4&libraries=places&callback=initAutocomplete">
</script>
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
#eventimg{
	max-width: 150px;
	margin: 5px;
}
#demo{
  max-width:200px;
  max-height:150px;
  }



</style>
<title>活動資料</title>
</head>
<body>
    <div class="sidenav">
        <a href="#" id="a_emp">員工管理</a>
        <a href="#" id="a_member">會員管理</a>
        <a href="#" id="a_product">商品管理</a>
        <a href="#" id="a_mevent">線上行銷活動管理</a>
        <a href="#" id="a_event">線下活動管理</a>
        <a href="#" id="a_forum">論壇管理</a>
        <a href="#" id="a_">認養管理</a>
    </div>

<div class="content custom-container-width" align="center">
    <div class="container-fluid">
        <div class="table-responsive">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2><b>線下活動管理</b></h2>
                        </div>
                        <div class="col-sm-3">
						    <a href="${pageContext.request.contextPath}/queryallevent.controller" class="btn btn-success" > <i class="material-icons">search</i> <span>查詢活動</span></a>
				    	</div>

                    </div>
                </div>

    <form  id="form" name="submitselection">  
    	 <input type="hidden"  readonly name="eventid" value="${event.eventID}" />
		 <input type="hidden"  readonly name="eventclick" value="${event.eventClick}" />

    	<div class="row"> 
    		<div class="col-sm-3">
        		活動名稱 :<br> <input type="text" class="form-control" required name="eventname" value="${event.eventName}" />
	        	<small  class="form-text text-muted">
	        	必填欄位
				</small>
        	
        	</div>
			
			<div class=" form-check col-sm-2">
				<c:if test="${empty event.eventID}">
					<input type="checkbox" class="form-check-input"  name="eventstatus" id="checkboxId"  value="true" />
					<label for="checkboxId"> 活動是否開啟:</label><br>
				</c:if>


				 <c:choose>
					<c:when test="${event.eventStatus == 'true'}">
						<td>
						<input type="checkbox" class="form-check-input"  name="eventstatus" id="checkboxId" checked value="true" />
                        <label for="checkboxId"> 活動是否開啟:</label><br>
						</td>
						
					</c:when>
					<c:when test="${event.eventStatus == 'false'}">
						<td>
						<input type="checkbox" class="form-check-input"  name="eventstatus" id="checkboxId" value="true"  />
                        <label for="checkboxId"> 活動是否開啟:</label><br>
						</td>
					</c:when>
				</c:choose> 		
				
			</div>
			<div class="col-sm-3">
				<p>活動圖片</p>
				<img src="${pageContext.request.contextPath}/event/display/${event.eventID}"  id="eventimg" alt=""> 
			</div>

      	</div>
      	<div class="row">	
			<div class="col">
        		活動起始日期: <br><input type="date" id="startdate" class="form-control" required  name="eventstartdate"  >
        		<small  class="form-text text-muted">
	        	必填欄位
				</small>
        		<p>
   			</div>
			<div class="col">
				活動起始時間: <br><input type="time" id="starttime"  class="form-control" required name="eventstarttime" > 
				<small class="form-text text-muted">
			    必填欄位
			    </small><p>
		    </div>
        
        	<div class="col">
      			活動結束日期: <br><input type="date" id="enddate" class="form-control" required name="eventenddate"  >  
      			<small  class="form-text text-muted">
	        	必填欄位
				</small><p>
        	</div>
			<div class="col">
				活動結束時間: <br><input type="time" id="endtime" class="form-control" required name="eventendtime" />  
				<small class="form-text text-muted">
		   	    必填欄位
		   	    </small><p>
		    </div>
        </div>
        <div class="row">
     	     <div class="col">
       			 活動地點: <br><input type="text" class="form-control" required   id="autocomplete" name="eventlocation" value ="${event.eventLocation}" />
       			 <small  class="form-text text-muted">
	        	 必填欄位
			  	 </small>
				 <p>        
       		 </div>
			 <div class="col">
			 活動地點預留位置<div id="map">	 </div>
			 </div>
       	</div>
       	<div class="row">
			<div class="col">
				活動種類: <br><input type="text" class="form-control" required name="eventtype" value ="${event.eventType}"/>
				<small  class="form-text text-muted">
				必填欄位
				</small>
				<p>
			</div>
		  
		  
			<div class="col">
				活動人數上限: <br><input type="text"  class="form-control" required name="eventmaxlimit"value ="${event.eventMaxLimit}" /><p>
			</div>
			<div class="col">
				活動費用:<br><input type="text"  name="eventfee" class="form-control" value ="${event.eventFee}" />
				<small class="form-text text-muted">
				必填欄位
				</small>  
			</div>
        </div>

		<div class="row">
			<div class="col-sm-6">
			    活動說明:<br><textarea name="eventdescription"  rows="7" cols="40"> ${event.eventDescription} </textarea><p>
			</div>
	
			<div class="col-sm-3">
				<label> 活動圖片上傳</label>
				<input type="file" class="form-control" placeholder="" name="image" id="imgupload" required="required">
			</div>
			<div class="col-sm-3">
			  <label class="col">圖片預覽上傳</label>
			  <img id="demo"/>
			</div>
		</div>
        
        <c:if test="${empty event.eventID}">
            <input type="submit" id="submitadd" class="btn btn-primary form-control" value="確認新增">
        </c:if>
        <c:if test="${not empty event.eventID}">
		<input type="submit" id="submitupdate" class="btn btn-primary form-control" value="確認修改">
        </c:if>
     </form>
	 <div id="success" class="text-center" style="color:green;"></div>
	 <div id="error" class="text-center" style="color:red;"></div>
    </div>
</div>
共被點選${event.eventClick}次
<footer>
	第八組-蕭詠謙
</footer>
    
</body>
<script>

$(document).ready(function() {
	// 用來匯入前面的函數的
	var startdatevalue = "<fmt:formatDate pattern="yyyy-MM-dd" value="${event.eventStartTime}"/>";
	document.getElementById("startdate").value =  startdatevalue;

	var starttimevalue = "<fmt:formatDate pattern="HH:mm" value="${event.eventStartTime}"/>";
	document.getElementById("starttime").value =  starttimevalue;

	var enddatevalue = "<fmt:formatDate pattern="yyyy-MM-dd" value="${event.eventEndTime}"/>";
	document.getElementById("enddate").value =  enddatevalue;

	var endtimevalue = "<fmt:formatDate  pattern="HH:mm" value="${event.eventEndTime}"/>";
	document.getElementById("endtime").value =  endtimevalue;
})
function initAutocomplete(){
    var autocomplete;
    autocomplete = new google.maps.places.Autocomplete((document.getElementById('autocomplete')), 
    {
        types: ['establishment'],
        componentRestrictions: {
        'country':[ 'TW' ]
        },
        fields:['place_id','geometry','name']
    });
  }; 
// let checkState = $("#checkboxId").is(":checked") ? "true" : "false";
$('#imgupload').change(function() {   
	  var file = $('#imgupload')[0].files[0];
	  var reader = new FileReader;
	  reader.onload = function(e) {
	    $('#demo').attr('src', e.target.result);
	  };
	  reader.readAsDataURL(file);
	});
  
$(document).ready(function() {
    $("#submitupdate").on("click", function() {
    	$("#submitupdate").prop("disabled", true);//上傳一次

        var form = $("#form").serialize();
        // 利用JS的FormData格式來序列化(serialize) input 當中的 name 與 file ，才可以用AJAX方式進行檔案上傳
       	var data = new FormData($("#form")[0]);
        
            //jquery 發送ajax的語法https://ithelp.ithome.com.tw/articles/10226692
          $.ajax({
              type: 'POST',
              enctype: 'multipart/form-data',
              data: data,
              url: "/petpet/modifyevent.controller", 
              processData: false,  //將原本不是xml時會自動將所發送的data轉成字串(String)的功能關掉
              contentType: false,  //默认值为contentType = "application/x-www-form-urlencoded".在默认情况下，内容编码类型满足大多数情况。但要上傳檔案，要設為False
              cache: false,
              success: function(data, statusText, xhr) {  //	請求成功時執行函式,  前面新增的FormData物件放在第一個 ，第二個我不知道，第三個XMLHttpRequest(XHR) 物件發送
              console.log(xhr.status);
                if(xhr.status == "200") {
                  $("#success").html("活動修改成功"); //成功訊息
                    // setTimeout( "self.location.reload(); ",5000);  // Reload或轉到其他頁面
                  }	   
                },
                error: function(e) {
                    $("#error").html("活動修改失敗");
                }
            });
        })
    $("#submitadd").on("click", function() {
    	$("#submitadd").prop("disabled", true);//上傳一次

        var form = $("#form").serialize();
        // 利用JS的FormData格式來序列化(serialize) input 當中的 name 與 file ，才可以用AJAX方式進行檔案上傳
       	var data = new FormData($("#form")[0]);
            //jquery 發送ajax的語法https://ithelp.ithome.com.tw/articles/10226692
          $.ajax({
              type: 'POST',
              enctype: 'multipart/form-data',
              data: data,
              url: "/petpet/addevent.controller", 
              processData: false,  //將原本不是xml時會自動將所發送的data轉成字串(String)的功能關掉
              contentType: false,  //默认值为contentType = "application/x-www-form-urlencoded".在默认情况下，内容编码类型满足大多数情况。但要上傳檔案，要設為False
              cache: false,
              success: function(data, statusText, xhr) {  //	請求成功時執行函式,  前面新增的FormData物件放在第一個 ，第二個我不知道，第三個XMLHttpRequest(XHR) 物件發送
              console.log(xhr.status);
                if(xhr.status == "200") {
                  $("#success").html("活動新增成功"); //成功訊息
                    // setTimeout( "self.location.reload(); ",5000);  // Reload或轉到其他頁面
                  }	   
                },
                error: function(e) {
                    $("#error").html("活動新增失敗");
                }
            });
        })
});
	</script> 
</html>