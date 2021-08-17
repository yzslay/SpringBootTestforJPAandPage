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

.custom-container-width {
    max-width: 600px;
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
	margin: 10px;
}
#demo{
  max-width:200px;
  max-height:150px;
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
<div class="container anchor  custom-container-width">
	<!-- 表格從這開始 -->
    <form  action="/addevent.controller" method="post"">  
    	 <input type="hidden"  readonly name="eventid" value="${event.eventID}" />
		 <input type="hidden"  readonly name="eventclick" value="${event.eventClick}" />

    	<div class="row"> 
    		<div class="col">
        		活動名稱 :<br> <input type="text" class="form-control" required name="eventname" value="${event.eventName}" />
	        	<small  class="form-text text-muted">
	        	必填欄位
				</small>
        	<p>  
        	</div>
			
			<div class="col form-check">
		
				 <c:choose>
					<c:when test="${event.eventStatus == 'true'}">
						<td>
						活動是否開啟:<input type="checkbox" class="form-check-input"  name="eventstatus" id="checkboxId" checked value="true" />
						</td>
						
					</c:when>
					<c:when test="${event.eventStatus == 'false'}">
						<td>
						活動是否開啟: <input type="checkbox" class="form-check-input"  name="eventstatus" id="checkboxId" value="true"  />

						</td>
					</c:when>
				</c:choose> 		
				
			</div>
			<div class="col">
				<p>商品圖片</p>
				<img src="${pageContext.request.contextPath}/event/display/${event.eventID}"  id="eventimg" alt=""> 
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
       			 活動地點: <br><input type="text" class="form-control" required   id="autocomplete" name="eventlocation" value ="${event.eventLocation}" />
       			 <small  class="form-text text-muted">
	        	 必填欄位
			  	 </small>
				 <p>        
       		 </div>
			 <div class="col">
			 活動地點預留位置<div id="map">	 
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
				  活動費用:<br><input type="text"  name="eventfee"  value ="${event.eventFee}" />
				  <small class="form-text text-muted">
				  必填欄位
				  </small>  
			</div>
        </div>

		<div class="row">
			<div class="col">
			  活動說明:<br><textarea name="eventdescription"  rows="5" cols="50"> ${event.eventDescription} </textarea><p>
			</div>
	
			<div class="col">
			  <label> 活動圖片上傳</label>
			  <input type="file" class="form-control" placeholder="" name="image" id="imgupload" required="required">
			  <p id="error_file"></p>
			</div>
			<div class="col">
			  <label class="col">圖片預覽上傳</label>
			  <img id="demo"/>
			  <!-- 先保留 -->
			  <p id="error_file"></p> 
			</div>
		  </div>
		<input type="submit" id="submit" class="btn btn-primary form-control" value="確認修改">

     </form>
	 <div id="success" class="text-center" style="color:green;"></div>
	 <div id="error" class="text-center" style="color:red;"></div>
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
    $("#submit").on("click", function() {
    	$("#submit").prop("disabled", true);//上傳一次
    	  var name = $("#name").val();
        var file = $("#imageupload").val(); 
        var price = $("#price").val();
        var description = $("#description").val();
        var form = $("#form").serialize();
        // 利用JS的FormData格式來序列化(serialize) input 當中的 name 與 file ，才可以用AJAX方式進行檔案上傳
       	var data = new FormData($("#form")[0]);
        console.log('MOO');
        
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
            });



	</script> 
</html>