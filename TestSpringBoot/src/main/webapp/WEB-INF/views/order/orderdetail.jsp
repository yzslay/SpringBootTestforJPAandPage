<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.util.* "%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/backstage/backstage.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/backstage/backstagemevent.css"/>
<!-- Bootstrap Table with Search Column Feature -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- JS -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="<c:url value='/js/event/event.js'/>"></script>
<title>查詢訂單</title>
<style>
    img{
        max-width: 150px;
    }
</style>
</head>
<body>
    <!-- 左側版型 -->
        <div class="sidenav">
            <a href="#" id="a_emp">員工管理</a>
            <a href="#" id="a_member">會員管理</a>
            <a href="#" id="a_product">商品管理</a>
            <a href="#" id="a_mevent">線上行銷活動管理</a>
            <a href="#" id="a_event">線下活動管理</a>
            <a href="#" id="a_forum">論壇管理</a>
            <a href="#" id="a_">認養管理</a>
        </div>
        
<!-- 右邊上面版型 -->
<div class="content" align="center">
    <div class="container-fluid">
        <div class="table-responsive">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-2">
                            <h2><b>訂單管理</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="${pageContext.request.contextPath}/listorder" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>回訂單總頁</span></a>
                            <a href="${pageContext.request.contextPath}/Eventdelete" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>沒用想要放什麼</span></a>
				    	</div>
                        <div class="col-sm-4">
                            <div class="search-box">
                                <div class="input-group">								
                                    <input type="text" id="search" class="form-control" placeholder="搜尋訂單名稱">
                                    <span class="input-group-addon"><i class="material-icons">&#xE8B6;</i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
<!-- 右邊下面表格版型，標題 -->
<div class="container">
    <!-- Nav pills -->
    <ul class="nav nav-pills" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" data-toggle="pill" href="#home">訂單詳情</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="pill" href="#menu1">產品</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="pill" href="#menu2">顧客資料</a>
      </li>
 
    </ul>
  
    <!-- Tab panes -->
    <div class="tab-content">
      <div id="home" class="container tab-pane active"><br>
        <form>
            <div class="form-group row">
                <lavel class="col-sm-2 col-form-label">訂單ID</lavel>
                <div class="col-sm-10">
                    <input type="text" readonly class="form-control" value=${order.id}>
                </div>
            </div>
            <div class="form-group row">
                <lavel class="col-sm-2 col-form-label">顧客名稱</lavel>
                <div class="col-sm-10">
                    <input type="text" readonly class="form-control" value=${order.membername}>
                </div>
            </div>
            <div class="form-group row">
                <lavel class="col-sm-2 col-form-label">商品價格</lavel>
                <div class="col-sm-10">
                    <input type="text" readonly class="form-control" value=${order.productCost}>
                </div>
            </div>
            <div class="form-group row">
                <lavel class="col-sm-2 col-form-label">運費價格</lavel>
                <div class="col-sm-10">
                    <input type="text" readonly class="form-control" value=${order.shippongCost}>
                </div>
            </div>
            <div class="form-group row">
                <lavel class="col-sm-2 col-form-label">稅額</lavel>
                <div class="col-sm-10">
                    <input type="text" readonly class="form-control" value=${order.tax}>
                </div>
            </div>
            <div class="form-group row">
                <lavel class="col-sm-2 col-form-label">總價</lavel>
                <div class="col-sm-10">
                    <input type="text" readonly class="form-control" value=${order.total}>
                </div>
            </div>
            <div class="form-group row">
                <lavel class="col-sm-2 col-form-label">付款方式</lavel>
                <div class="col-sm-10">
                    <input type="text" readonly class="form-control" value=${order.paymentMethod}>
                </div>
            </div>
            <div class="form-group row">
                <lavel class="col-sm-2 col-form-label">訂單日期</lavel>
                <div class="col-sm-10">
                    <input type="text" readonly class="form-control" value=${order.ordertime}>
                </div>
            </div>
        </form>
      </div>
      <div id="menu1" class="container tab-pane fade"><br>

        <c:forEach items="${order.orderDetails}" var="detail" varStatus="s">
            <c:set var="product" value="${detail.product}" />
            <div class="row align-items-start" style="border: radius 5px; border-color: rgb(207, 241, 147) ; padding: 10px;border-style:solid;">
                <div class="col-sm-1">
                    ${s.count}
                </div>
                <div class="col-sm-2">
                    <img src="${pageContext.request.contextPath}/product/display/${product.productId}" 
                    class="image" alt=""> 
                </div>
                <div class="col-sm-1"></div>
                <div class="col-sm-6 ">
                    <form>
                    <div class="form-group row">
                        <lavel class="col-sm-3 col-form-label">產品名稱:</lavel>
                        <div class="col-sm-9">
                            <input type="text" readonly class="form-control" value=${product.productName}>
                        </div>                   
                    </div>
                    <div class="form-group row">
                        <lavel class="col-sm-3 col-form-label">產品價格:</lavel>
                        <div class="col-sm-9">
                            <input type="text" readonly class="form-control" value=${detail.productCost}>
                        </div>                   
                    </div>
                    <div class="form-group row">
                        <lavel class="col-sm-3 col-form-label"> 產品數量:</lavel>
                        <div class="col-sm-9">
                            <input type="text" readonly class="form-control" value=${detail.quantity}>
                        </div>                   
                    </div>
                    <div class="form-group row">
                        <lavel class="col-sm-3 col-form-label"> 價格小計:</lavel>
                        <div class="col-sm-9">
                            <input type="text" readonly class="form-control" value=${detail.subtotal}>
                        </div>                   
                    </div>
                    </form>
                </div>
            </div>
        </c:forEach>
      </div>
    <div id="menu2" class="container tab-pane fade"><br>
        <form>
            <div class="form-group row">
                <lavel class="col-sm-2 col-form-label">客戶名稱</lavel>
                <div class="col-sm-10">
                    <input type="text" readonly class="form-control" value=${order.membername}>
                </div>
            </div>
            <c:set var="member" value="${order.mockmember}" />

            <div class="form-group row">
                <lavel class="col-sm-2 col-form-label">客戶地址</lavel>
                <div class="col-sm-10">
                    <input type="text" readonly class="form-control" value=${member.address}>
                </div>
            </div>


    </div>
  </div>
</div>
</div>
</body>

<html>

