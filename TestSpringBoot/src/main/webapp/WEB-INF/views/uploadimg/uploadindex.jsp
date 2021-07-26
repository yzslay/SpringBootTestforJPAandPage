<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>圖片上傳練習</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <style>
  .container{
  max-width: 1200px;    
  }
  #demo{
  max-width:100px;
  max-height:80px;
  }

  /* 很醜我知道，不然你來改阿 */
  .backgroundform{
      background-color: rgb(134, 214, 138);
  }
  body{
    background-color: rgb(148, 238, 153);

  }
  #form{
    border-style: solid;
  }
  </style>
  
</head>
<body>
<br><br>
<h1 class= "text-center">商城商品上傳練習</h1><br><br>
<!-- 請參考網址BootStrap https://getbootstrap.com/docs/4.4/utilities/spacing/ -->
<div class="contact py-sm-5 py-4 backgroundform">  
		<div class="container py-xl-4 py-lg-2 mainbox">
		<!-- form -->
        <!-- 這邊發送表單用AJAX來送，所以沒有method ，action="${pageContext.request.contextPath}/uploadfile"  -->
		<form  id="form" >
				<!-- 用${pageContext.request.contextPath}代替現在路徑，應該跟C:url類似 -->
                <div class="contact-grids1">
					<div class="row">
						<div class="col-md-6 col-sm-6 contact-form1 form-group">
							<label class="col-form-label-lg">物品名稱</label>
							<input type="text" class="form-control" placeholder="Product Name" id="name" name="name" required="required">
                            <!-- 錯誤時會跳的訊息欄位，但我看不出來怎麼樣會錯 -->
							<p id="error_name"></p> 
						</div>
						<div class="col-md-6 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">敘述</label>
							<textarea class="form-control" placeholder="Product Description" id="description" rows="3" cols="45" name="description" required="required"></textarea>
							<p id="error_description"></p>
						</div>
						
						<div class="col-md-3 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Image</label>
							<input type="file" class="form-control" placeholder="" name="image" id="imgupload" required="required">
							<p id="error_file"></p>
						</div>
						<div class="col-md-3 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Image預覽</label>
							<img id="demo"/>
							<p id="error_file"></p>
						
						</div>
						<div class="col-md-6 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">價格</label>
							<input type="text" class="form-control" placeholder="Price" name="price" id="price" required="required">
							<p id="error_price"></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<input type="submit" id="submit" class="btn btn-primary form-control" value="Submit">
							<br><br>
						</div>
                        <div class="col-md-6">
			    			<a href="${pageContext.request.contextPath}/product/show" style="float:left;" class="btn btn-success form-control  text-right">Show All</a>
                        </div>
                    </div>
				</div>
				<br><br>
				<div id="success" class="text-center" style="color:green;"></div>
				<div id="error" class="text-center" style="color:red;"></div>
			</form>
		</div>
	</div>
	
<!-- <p class="text-center"> -->
<%--   	<img src="${pageContext.request.contextPath}/images/loader.gif" alt="loader" style="width: 150px;height: 120px;" id="loader"> --%>
<!-- </p> -->
<%-- 	<script src="${pageContext.request.contextPath}/js/product.js"></script> --%>
</body>
<script>

// 預覽功能
$('#imgupload').change(function() {   
	  var file = $('#imgupload')[0].files[0];
	  var reader = new FileReader;
	  reader.onload = function(e) {
	    $('#demo').attr('src', e.target.result);
	  };
	  reader.readAsDataURL(file);
	});

// AJAX+錯誤回報
$(document).ready(function() {
    $('#loader').hide();

    $("#submit").on("click", function() {
    	$("#submit").prop("disabled", true);//上傳一次
    	var name = $("#name").val();
        var file = $("#imageupload").val(); 
        var price = $("#price").val();
        var description = $("#description").val();
        var form = $("#form").serialize();
        // 利用JS的FormData格式來序列化(serialize) input 當中的 name 與 file ，才可以用AJAX方式進行檔案上傳
    	var data = new FormData($("#form")[0]);
        
    	//alert(data);
        $('#loader').show();
        //如果表格內input的四個如果有空的話，顯示下面的CSS格式，把Submit鎖住，Loader藏起來，邊框改為紅色，Error messgae跳出字串
        if (name === "" || file === "" || price === "" || description === "") {
        	$("#submit").prop("disabled", false);
            $('#loader').hide();
            $("#name").css("border-color", "red");
            $("#image").css("border-color", "red");
            $("#price").css("border-color", "red");
            $("#description").css("border-color", "red");
            $("#error_name").html("Please fill the required field.");
            $("#error_file").html("Please fill the required field.");
            $("#error_price").html("Please fill the required field.");
            $("#error_description").html("Please fill the required field.");
        } else {
            $("#name").css("border-color", "");
            $("#image").css("border-color", "");
            $("#price").css("border-color", "");
            $("#description").css("border-color", "");
            $('#error_name').css('opacity', 0);
            $('#error_file').css('opacity', 0);
            $('#error_price').css('opacity', 0);
            $('#error_description').css('opacity', 0);

            //jquery 發送ajax的語法https://ithelp.ithome.com.tw/articles/10226692
                    $.ajax({
                        type: 'POST',
                        enctype: 'multipart/form-data',
                        data: data,
                        url: "/petpet/uploadfile", 
                        processData: false,  //將原本不是xml時會自動將所發送的data轉成字串(String)的功能關掉
                        contentType: false,  //默认值为contentType = "application/x-www-form-urlencoded".在默认情况下，内容编码类型满足大多数情况。但要上傳檔案，要設為False
                        cache: false,
                        success: function(data, statusText, xhr) {  //	請求成功時執行函式,  前面新增的FormData物件放在第一個 ，第二個我不知道，第三個XMLHttpRequest(XHR) 物件發送
                        console.log(xhr.status);
                        if(xhr.status == "200") {
                        	$('#loader').hide(); 
                        	$("#form")[0].reset();
                        	$('#success').css('display','block');
                            $("#error").text("");
                            $("#success").html("Product Inserted Succsessfully."); //錯誤訊息
                            $('#success').delay(5000).fadeOut('slow');
                            // setTimeout( "self.location.reload(); ",5000);  // Reload或轉到其他頁面
                         }	   
                        },
                        error: function(e) {
                        	$('#loader').hide();
                        	$('#error').css('display','block');
                            $("#error").html("Oops! something went wrong.");
                            $('#error').delay(5000).fadeOut('slow');
                            location.reload();
                        }
                    });
        }
            });
        });

</script>

</html>