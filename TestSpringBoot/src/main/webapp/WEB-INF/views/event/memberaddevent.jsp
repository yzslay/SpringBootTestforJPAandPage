<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.util.* "%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
  <META HTTP-EQUIV="EXPIRES" CONTENT="0">
  <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
    <title>會員活動卡片</title>
    <!-- navbar -->
    <link rel='stylesheet' href="<c:url value='/Member/css/style.css' />" type="text/css" />	
    <script src="https://kit.fontawesome.com/c8e4d183c2.js" crossorigin="anonymous"></script>
    <!-- Latest compiled and minified CSS -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <script  async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDCn5ZqGvjfSwtQI12hbGKq2RraF1WlSa4&libraries=places&callback=initAutocomplete">
</script>
  </head>
  <style>
  .anchor::before {
    content: "";
    display: block;
    height: 20px;
  }
  .eventmargin {
    margin-top: 30px;
    margin-bottom: 30px;
  }
  .imgheigh{
    max-height: 400px;
  }
  #demo{
  max-width:200px;
  max-height:150px;
  }

  }
</style>
<body background="<c:url value='/Member/images/petBackground.jpg' />" style="background-repeat:no-repeat;">
<nav>
    <!--social-link-and-phont-number-->
    <div class="social-call">
        <!--social-links-->
        <div class="social">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
        </div>
        <!--phone-number-->
        <div class="phone">
            <span>Call +123456789</span>
        </div>
    </div>

    <!--menu-bar-------------------------------------->
    <div class="navigation">
        <!--logo---------->
        <a href="<c:url value='/index' />" class="logo">
            <img src="<c:url value='/Member/images/PetPetLogo.png' />" />
        </a>
        <!--menu-icon---------------------->
        <div class="toggle"></div>

        <!--menu----------->
        <ul class="menu">
            <li><a href="#">最新消息</a></li>

            <li><a href="#">商品總覽</a>
                <!--sale-label-->
                <span class="sale-lable">Sale</span>
            </li>

            <li><a href="#">寵愛認養</a></li>
            <li><a href="#">毛寵大小事</a></li>
            <li><a href="#">會員中心</a></li>
        </ul>
        <!--right-menu------->
        <div class="right-menu">
            <!--search-->
            <a href="javascript:void(0);" class="search">
                <i class="fas fa-search"></i>
            </a>
            <!--user-->
            <a href="<c:url value='/Logout'/>" class="user">
                <i class="fas fa-sign-out-alt"></i>
            </a>
            <!--cart-icon-->
            <a href="#">
                <i class="fas fa-shopping-cart">
                    <!--number-of-product-in-cart-->
                    <span class="num-cart-product">0</span>
                </i>
            </a>
        </div>
    </div>
</nav>
<!--search-bar------------------------------->
<div class="search-bar">
    <!--search-input-------->
    <div class="search-input">
        <!--input----->
        <input type="text" placeholder="Search For Product" />
        <!--cancel-btn-->
        <a href="javascript:void(0);" class="search-cancel">
            <i class="fas fa-times"></i>
        </a>
    </div>
</div>

<!-- 新增Event -->
<div id="home" class="container"><br>
    <form  action="${pageContext.request.contextPath}/addevent.controller" method="post"  enctype="multipart/form-data" >
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">活動名稱</label>
            <div class="col-sm-10">            
                <input type="text" required class="form-control"  name="eventname" value=${event.eventName}>
                <small  class="form-text text-muted">
                    必填欄位
                </small>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">活動是否開啟</label>
            <div class="col-sm-10"> 
                <select name="eventstatus"  selected   value="${event.eventStatus}">
                <option value="true">開啟</option>
                <option value="false">關閉</option>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">活動圖片</label>
            <div class="col-sm-6">
                <input type="file" class="form-control" placeholder="" name="image" id="imgupload" required="required">
                <small  class="form-text text-muted">
                    必填欄位
                </small>
            </div>
        </div>
        <div class="form-group row">
                <label class="col-sm-2 col-form-label">圖片預覽上傳</label>
            <div  class="col-sm-10">
                <img id="demo"/>
                <!-- 先保留 -->
                <p id="error_file"></p> 
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">活動起始日期</label>
            <div class="col-sm-10">
                <br><input type="date" id="startdate" class="form-control" required  name="eventstartdate"  >
                <small  class="form-text text-muted">
                    必填欄位
                </small>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">活動起始時間</label>
            <div class="col-sm-10">
               <input type="time" id="starttime"  class="form-control" required name="eventstarttime" > 
               <small  class="form-text text-muted">
                必填欄位
                  </small>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">活動結束日期</label>
            <div class="col-sm-10">
                <br><input type="date" id="startdate" class="form-control" required  name="eventenddate"  >
                <small  class="form-text text-muted">
                    必填欄位
                </small>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">活動結束時間</label>
            <div class="col-sm-10">
               <input type="time" id="starttime"  class="form-control" required name="eventendtime" > 
               <small  class="form-text text-muted">
                必填欄位
               </small>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">活動地點</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" required   id="autocomplete" name="eventlocation" value ="${event.eventLocation}" />
               <small  class="form-text text-muted">
                必填欄位
                  </small>
            </div>
        </div>


        <div class="form-group row">
            <label class="col-sm-2 col-form-label">活動種類</label>
            <div class="col-sm-10"> 
                <select name="eventtype"  selected   value="${event.eventType}">
                <option value="聚會">聚會</option>
                <option value="用餐">用餐</option>
                <option value="交友">交友</option>
                <option value="大型活動">大型活動</option>
                <option value="其他">其他</option>
                </select>
                <small  class="form-text text-muted">
                    必填欄位
                </small>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">活動人數上限</label>
            <div class="col-sm-10">
                <input type="text"  class="form-control" required name="eventmaxlimit"value ="${event.eventMaxLimit}" />
                <small  class="form-text text-muted">
                必填欄位
                </small>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">活動費用</label>
            <div class="col-sm-10">
                <input type="text"  name="eventfee" class="form-control" value ="${event.eventFee}" />
            </div>
        </div>


        <div class="form-group row">
            <label class="col-sm-2 col-form-label">活動說明</label>
            <div class="col-sm-10">
                <textarea name="eventdescription"  rows="7" cols="70"> ${event.eventDescription} </textarea>
            </div>
        </div>

		<input type="submit" id="submitupdate" class="btn btn-primary form-control" value="申請活動">

    </form>
  </div>


</body>
<script>

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

    $('#imgupload').change(function() {   
	  var file = $('#imgupload')[0].files[0];
	  var reader = new FileReader;
	  reader.onload = function(e) {
	    $('#demo').attr('src', e.target.result);
	  };
	  reader.readAsDataURL(file);
	});
</script>
</html>