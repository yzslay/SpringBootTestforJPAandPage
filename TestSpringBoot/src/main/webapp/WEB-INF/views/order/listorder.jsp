<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.util.* "%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
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
						    <a href="#deleteEmployeeModal" class="btn btn-danger"><i class="material-icons">&#xE15C;</i><span>刪除訂單</span></a>	
                            <a href="${pageContext.request.contextPath}/EventAdd" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>沒用</span></a>
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
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="selectAll">
                                    <label for="selectAll"></label>
                                </span>
                            </th>
                            <th scope="col"><a href="${pageContext.request.contextPath}/order.queryallevent.controller/page/${currentPage}?sortField=id&sortDir=${reverseSortDir}">訂單ID</a></th>
                            <th scope="col"><a href="${pageContext.request.contextPath}/order.queryallevent.controller/page/${currentPage}?sortField=membername&sortDir=${reverseSortDir}">購買者</a></th>
                            <th scope="col"><a href="${pageContext.request.contextPath}/order.queryallevent.controller/page/${currentPage}?sortField=ordertime&sortDir=${reverseSortDir}">訂單產生時間</a></th>
                            <th scope="col"><a href="${pageContext.request.contextPath}/order.queryallevent.controller/page/${currentPage}?sortField=deliverDate&sortDir=${reverseSortDir}">寄出日期</a></th>
                            <th scope="col"><a href="${pageContext.request.contextPath}/order.queryallevent.controller/page/${currentPage}?sortField=address&sortDir=${reverseSortDir}">收件地址</a></th>
                            <th scope="col"><a href="${pageContext.request.contextPath}/order.queryallevent.controller/page/${currentPage}?sortField=total&sortDir=${reverseSortDir}">訂單金額</a></th>
                            <th scope="col"><a href="${pageContext.request.contextPath}/order.queryallevent.controller/page/${currentPage}?sortField=paymentMethod&sortDir=${reverseSortDir}">付款方式</a></th>
                            <th scope="col">修改刪除</th>
                        </tr>
                    </thead>
<!-- 迴圈的部分 -->
                    <tbody>
                        <c:forEach items="${orders}" var="order" varStatus="s">
                            <tr>
                                <td>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="checkbox<c:out value='${i.index+1}'/>" name="options[]" value="<c:out value='${i.index+1}'/>">
                                        <label for="checkbox"></label>
                                        <p style="display: none">${order.id}</p>
                                    </span>
                                </td>
                                <td>
                                    <a href="<c:url value='/queryevent.controller?eventid=${order.id}'/>">  ${order.id} </a>
                                </td>
                            
                                <td>
                                    <a href="#">  ${order.membername} </a>
                                </td>
               
                                <td><fmt:formatDate pattern="yyyy-MM-dd aa HH:mm" value='${order.ordertime}'/></td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd aa HH:mm" value='${order.deliverDate}'/></td>
                                <td><c:out value="${order.address}"/></td>
                                <td><c:out value="${order.total}"/></td>
                                <td><c:out value="${order.paymentMethod}"/></td>
                                <td><a href='${pageContext.request.contextPath}/orders/detail/${order.id}' class="edit"   value = "訂單詳情"> <i class="material-icons" data-toggle="tooltip" title="訂單詳情">&#xE254;</i>   
                                    <a href="#" class="delete" id="delete"  value="刪除"><i class="material-icons" data-toggle="tooltip" title="刪除">&#xE872;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="clearfix">
                    <ul class="pagination">
                      <c:if test="${currentPage > 1}">
                      <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/order.queryallevent.controller/page/${currentPage - 1}?sortField=${sortField}&sortDir=${sortDir}">前一頁</a></li>
                      </c:if>
                      
                      <c:if test="${currentPage > 1}">
                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/order.queryallevent.controller/page/1?sortField=${sortField}&sortDir=${sortDir}">首頁</a></li>
                      </c:if>
                      <c:if test="${currentPage == 1}">
                        <li class="page-item"><a class="page-link" >1</a></li>
                      </c:if>
            
                      <c:forEach var="i" begin="2" end="${totalPages}">
            
                        <c:if test="${currentPage != i}">
                          <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/order.queryallevent.controller/page/${i}?sortField=${sortField}&sortDir=${sortDir}"">${i}</a></li>
                        </c:if>
                        <c:if test="${currentPage == i}">
                          <li class="page-item"><a class="page-link" >${i}</a></li>
                        </c:if>
                      </c:forEach>
                      
                    <c:if test="${currentPage < totalPages}">
                      <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/order.queryallevent.controller/page/${currentPage + 1}?sortField=${sortField}&sortDir=${sortDir}"">下一頁</a></li>
                    </c:if>
                    <c:if test="${currentPage == i}">
                      <li class="page-item"><a class="page-link">下一頁</a></li>
                    </c:if>
            
                    <c:if test="${currentPage < totalPages}">
                      <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/order.queryallevent.controller/page/${totalPages}?sortField=${sortField}&sortDir=${sortDir}"">最後一頁</a></li>
                    </c:if>
                    <c:if test="${currentPage == totalPages}">
                      <li class="page-item"><a class="page-link">最後一頁</a></li>
                    </c:if>
                  </ul>
                </div>

     
            </div>
        </div>
    </div>
<div>
     <!-- 頁面  -->


</body>
<script>

</script>