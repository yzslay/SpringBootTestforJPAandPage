<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>產品上傳頁面</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Expires" content="0" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
	.center{
		color: rgb(28, 138, 55);
		text-align: center;
	}
	.image{
		max-width: 150px;
		margin: 10px;
	}
	.box {
    padding: 5px 40px 5px 40px;
}
#demo{
  max-width:200px;
  max-height:150px;
  }
.fontsize{
	font-size: 24px;
}
#message{
	font-size: 40px;
}
</style>

</head>
<body>
<br>

		<div class="container-fluid py-lg-2 center">
			<!-- tittle heading -->
			<div>
			<h3 class="productdetail">Product Details</h3><br>
			<!-- tittle heading -->
			</div>
				<form id="form" >
					<input type="hidden"  class="form-control" name="id" id="id" value=${id} >
					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4">
						<div class="col box">
							<p class="fontsize">產品名稱</p>
						</div>
						<div class="col box">
							<input type="text" class="form-control input-sm" value="${name}" id="name" name="name" required="required">
						</div>
						<div class="col box fontsize">
							<p>商品圖片</p>
						</div>
						<div class="col box">
							<img src="${pageContext.request.contextPath}/product/display/${id}" 
									class="image" alt=""> 
						</div>
						<div class="col box">
							<input type="file" class="form-control" placeholder="" name="image" id="imgupload" required="required">
						</div>
						<div class="col box">
							<label class="col-form-label fontsize">商品圖片預覽</label>
							<img id="demo"/>
							<p id="error_file"></p>		
						</div>

						<div class="col box">
							<span class="fontsize">金額</span>
						</div>
						<div class="col box">
							<input type="text" class="form-control" placeholder="" value="${price}" id="price" name="price" required="required">
						</div>
						<div class="col box">
							<span class="fontsize">產品敘述</span>
						</div>
						<div class="col box">
						<textarea class="form-control" placeholder="" id="description" rows="3" cols="45" name="description" required="required">${description}</textarea>

						</div>
					</form>

						<div class="col box">
							<span id="message"></span>
						</div>
						<div class="col box">
							<input type="text" id="submit" class="btn btn-primary form-control " value="Submit">
						</div>
					</div>
			
				<div>
					<span id="message"></span>
				</div>
				<div class="row">
					<div class="col box">
						<a href="${pageContext.request.contextPath}/product/show" style="float:left;" class="btn btn-success form-control  text-right">回上頁</a>
					</div>
					&nbsp;&nbsp
					<div class="col box" style="margin-top:15px">
						<a href="${pageContext.request.contextPath}/upload" style="float:left;" class="btn btn-success form-control  text-right">回上傳頁面</a>
					</div>
				</div>			
		</div>

</body>
<script>
	// 預覽功能 ，使用FileReader物件
$('#imgupload').change(function() {   
	  var file = $('#imgupload')[0].files[0];
	  var reader = new FileReader;
	  reader.onload = function(e) {
	    $('#demo').attr('src', e.target.result);
	  };
	  reader.readAsDataURL(file);
	});

	// AJAX送出新增表單
$(document).ready(function() {
    $("#submit").on("click", function() {
    	$("#submit").prop("disabled", true);//上傳一次
		var id = $("#id").val();
    	var name = $("#name").val();
        var file = $("#image").val(); 
        var price = $("#price").val();
        var description = $("#description").val();
		console.log(id);
		console.log(name);
		console.log(file);
		console.log(price);
		console.log(description);
        var form = $("#form").serialize();
    	var data = new FormData($("#form")[0]);

                    $.ajax({
                        type: 'POST',
                        enctype: 'multipart/form-data',
                        data: data,
                        url: "/petpet/updatefile", 
                        processData: false,  //將原本不是xml時會自動將所發送的data轉成字串(String)的功能關掉
                        contentType: false,  //默认值为contentType = "application/x-www-form-urlencoded".在默认情况下，内容编码类型满足大多数情况。但要上傳檔案，要設為False
                        cache: false,
                        success: function(data, statusText, xhr) {  //	請求成功時執行函式,  前面新增的FormData物件放在第一個 ，第二個我不知道，第三個XMLHttpRequest(XHR) 物件發送
                        console.log(xhr.status);
                        if(xhr.status == "200") {
                            setTimeout( "self.location.reload(); ",10000);  // Reload或轉到其他頁面
							$("#message").html("修改成功");
							$("#message").css("font-color","green");
                         }	   
                        },
                        error: function(e) {
							console.log('錯誤');
							
                            // location.reload();
                        }
                    });
  
            });
        });



</script>

</html>