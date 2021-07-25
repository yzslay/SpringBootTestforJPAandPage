<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Java Hub</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap.min.css">
<style>
.picview{
    max-height:80px;
}
</style>

</head>
<body>
<br>
<h1 class="text-center">Spring Boot Image Upload &amp; Display With Blob Using Database
<a href="${pageContext.request.contextPath}/upload" class="btn btn-danger text-right">Go Home</a>
</h1>
<br><br>
<table id="example" class="table table-striped table-bordered text-center">
        <thead>
            <tr>
                <th>SR. No.</th>
                <th>Name</th>
                <th>Image</th>
                <th>Description</th>
                <th>Price</th>
                <th>Created date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <!-- 重設 用來排序第一行的數字，應該可以拿掉 -->
        <c:set var="count" value="0" scope="page"></c:set>
        <c:forEach var="product" items="${products}">
             <!-- 第一行的數字 +1 -->
        <c:set var="count" value="${count + 1}" scope="page"></c:set>
            <tr>
                <td>${count}</td>
                <td>${product.productName}</td>
                <!-- 直接連到Controller要照片的位址讀取 -->
                <td><img class="picview" src="${pageContext.request.contextPath}/product/display/${product.productId}" /></td>
                <td>${product.productDescription}</td>
                <td>${product.productPrice}</td>
                <!-- fmt:formatDate  標簽用於以各種不同的方式格式化日期,就是後台傳過來的會改-->
                <td><fmt:formatDate pattern="dd-MMM-yyyy" value="${product.createTime}" /></td>
                <td ><a href="${pageContext.request.contextPath}/product/productdetails?id=${product.productId}" class="btn btn-info text-right" target="_blank">View</a></td>
            </tr>
         </c:forEach>
        </tbody>
        <tfoot>
            <tr>
                <th>SR. No.</th>
                <th>Name</th>
                <th>Image</th>
                <th>Description</th>
                <th>Price</th>
                <th>Created date</th>
                <th>Action</th>
            </tr>
        </tfoot>
    </table>

    <!-- 套件不解釋，Datatable是新的 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap.min.js"></script>

	<!-- 這邊套用的JQ的DataTable來呈現這個表格，https://datatables.net/  當我們寫不出來才用，請參考 -->
    <script type="text/javascript">
	$(document).ready(function() {
	    $('#example').DataTable();
	} );
	</script>
</body>
</html>