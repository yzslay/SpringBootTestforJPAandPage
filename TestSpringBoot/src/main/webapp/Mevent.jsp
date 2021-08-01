<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.example.practice.customEL.ImgOut"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/backstage/backstage.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/backstage/backstagemevent.css"/>
<!-- Bootstrap Table with Search Column Feature -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="<c:url value='/js/mevent/index.js'/>"></script>
<title>BackStage</title>
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
<div class="content" align="center">
    <div class="container-fluid">
        <div class="table-responsive">
            <div class="table-wrapper">			
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2><b>線上行銷活動列表</b></h2>
                        </div>
                        <div class="col-sm-3">
						    <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>新增活動</span></a>
						    <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>刪除</span></a>						
				    	</div>
                        <div class="col-sm-3">
                            <div class="search-box">
                                <div class="input-group">								
                                    <input type="text" id="search" class="form-control" placeholder="搜尋活動名稱">
                                    <span class="input-group-addon"><i class="material-icons">&#xE8B6;</i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>
							    <span class="custom-checkbox">
								    <input type="checkbox" id="selectAll">
								    <label for="selectAll"></label>
							    </span>
						    </th>
                            <th>活動名稱</th>
					    	<th>類型ID</th>
					    	<th>活動開始時間</th>
					    	<th>活動結束時間</th>
						    <th>活動辦法</th>
					    	<th>是否上線</th>
						    <th>圖片</th>
					    	<th>負責人ID</th>
                            <th>修改刪除</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach  items="${mevents}" var="mevent" varStatus="i">
                        <tr>
                            <td>
							    <span class="custom-checkbox">
								    <input type="checkbox" id="checkbox<c:out value='${i.index+1}'/>" name="options[]" value="<c:out value='${i.index+1}'/>">
								    <label for="checkbox1"></label>
						    	</span>
						    </td>
                            <td><c:out value="${mevent.meventname}" /></td>
						    <td><c:out value="${mevent.meventtypeid}" /></td>
						    <td><c:out value="${mevent.meventstartdate}" /></td>
						    <td><c:out value="${mevent.meventenddate}" /></td>
					    	<td><c:out value="${mevent.meventdescription}" /></td>
					    	<td><c:out value="${mevent.meventonline}" /></td>
					    	<td><c:choose>
								<c:when test="${mevent.meventpicture!=null }">
									<img
										src="data:image/jpg;base64,${ImgOut().ImgWrite(mevent.meventpicture) }"
										width="250px">
								</c:when>
								<c:otherwise>沒有圖片喔</c:otherwise>
							    </c:choose></td>
					    	<td><c:out value="${mevent.meventownerid}" /></td>
                            <td>
                                <input type="hidden" name="id" value="<c:out value='${mevent.meventid}' />" />
							    <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="修改">&#xE254;</i></a>
							    <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="刪除">&#xE872;</i></a>
						    </td>
                        </tr>  
                        <c:set var="count" value="${i.count }" />
                    </c:forEach>
                    </tbody>
                </table>
                <div class="clearfix">
				    <div class="hint-text">共<b>${count}</b>筆資料</div>
				    <!--
                            <ul class="pagination">
					        <li class="page-item disabled"><a href="#">Previous</a></li>
					        <li class="page-item"><a href="#" class="page-link">1</a></li>
					        <li class="page-item"><a href="#" class="page-link">2</a></li>
				    	    <li class="page-item active"><a href="#" class="page-link">3</a></li>
					        <li class="page-item"><a href="#" class="page-link">4</a></li>
					        <li class="page-item"><a href="#" class="page-link">5</a></li>
				    	    <li class="page-item"><a href="#" class="page-link">Next</a></li>
				            </ul>
                    -->
			    </div>
            </div>
        </div>        
    </div>     
</div>
<!-- Edit Modal HTML -->
<div id="addEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="post" action="<c:url value='/mevent/insert'/>" enctype="multipart/form-data">
				<div class="modal-header">						
					<h4 class="modal-title">新增活動</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<div class="form-group">
						<label>活動名稱:</label>
						<input type="text" class="form-control" required name="name" id="name">
					</div>
					<div class="form-group">
						<label>活動類型:</label>
						<select name="typeid" class="form-control" required>
                        	<option value="1">會員招募活動</option>
							<option value="2">商品促銷活動</option>
							<option value="3">限時搶購活動</option>
							<option value="4">滿額登記抽獎</option>
						</select>
					</div>
					<div class="form-group">
						<label>活動開始時間:</label>
						<input type="date" name="startdate" class="form-control" required><span id="spsd"></span><br>
						<input type="time" name="starttime" step="1" class="form-control" required><span id="spst"></span>
					</div>
					<div class="form-group">
						<label>活動結束時間:</label>
						<input type="date" name="enddate" class="form-control" required><span id="sped"></span><br>
						<input type="time" name="endtime" step="1" class="form-control" required><span id="spet"></span>
					</div>
                    <div class="form-group">
						<label>活動辦法:</label>
						<textarea rows="5" cols="50" name="description"></textarea>
					</div>
                    <div class="form-group">
						<label>活動是否上線:</label>
						<input type="radio" name="online" value="true" checked>是
						<input type="radio" name="online" value="false">否
					</div>
                    <div class="form-group">
						<label>活動圖片:</label>
						<input type="file" name="pic" id="file1" multiple="multiple"><hr>預覽:<br><img id="img1">
					</div>					
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="取消">
					<input type="submit" class="btn btn-success" value="新增">
				</div>
			</form>
		</div>
	</div>
</div>
<script src="<c:url value='/js/mevent/formcheck.js'/>"></script>
<!-- Edit Modal HTML -->
<div id="editEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="post" action="<c:url value='/mevent/edit'/>" enctype="multipart/form-data">
				<div class="modal-header">						
					<h4 class="modal-title">修改活動設定</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
                    <input type="hidden" name="id" id="ide"/>	
                    <input type="hidden" name="title" id="title"/>				
					<div class="form-group">
						<label>活動名稱:</label>
						<input type="text" class="form-control" name="name" id="namee" required>
					</div>
					<div class="form-group">
						<label>活動類型:</label>
						<select name="typeid" class="form-control" id="typeid" required>
                            <c:choose>
								<c:when test="${mevent.meventtypeid==1 }">
									<option value="1" selected>會員招募活動</option>
								</c:when>
								<c:otherwise>
									<option value="1">會員招募活動</option>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${mevent.meventtypeid==2 }">
									<option value="2" selected>商品促銷活動</option>
								</c:when>
								<c:otherwise>
									<option value="2">商品促銷活動</option>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${mevent.meventtypeid==3 }">
									<option value="3" selected>限時搶購活動</option>
								</c:when>
							<c:otherwise>
									<option value="3">限時搶購活動</option>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${mevent.meventtypeid==4 }">
									<option value="4" selected>滿額登記抽獎</option>
								</c:when>
								<c:otherwise>
									<option value="4">滿額登記抽獎</option>
								</c:otherwise>
							</c:choose>
                        </select>
					</div>
					<div class="form-group">
						<label>活動開始時間:</label>
						<input type="date" id="startdate" name="startdate" class="form-control" required><span id="spsd"></span><br>
						<input type="time" id="starttime" name="starttime" step="1" class="form-control" required><span id="spst"></span>
					</div>
					<div class="form-group">
						<label>活動結束時間:</label>
						<input type="date" id="enddate" name="enddate" class="form-control" required><span id="sped"></span><br>
						<input type="time" id="endtime" name="endtime" step="1" class="form-control" required><span id="spet"></span>
					</div>
                    <div class="form-group">
						<label>活動辦法:</label>
						<textarea rows="5" cols="50" name="description" id="description"></textarea>
					</div>
                    <div class="form-group">
						<label>活動是否上線:</label>
						<c:choose>
							<c:when test="${mevent.meventonline==true }">
								<input type="radio" name="online" value="true" checked>是
								<input type="radio" name="online" value="false">否
							</c:when>
    						<c:otherwise>
	    							<input type="radio" name="online" value="true">是
		    						<input type="radio" name="online" value="false" checked>否
			    			</c:otherwise>
						</c:choose>
					</div>
                    <div class="form-group">
						<label>活動圖片:</label>
							<img id="img0e" >
                            <input type="file" name="pic" id="file1e" multiple="multiple"><hr>預覽:<br><img id="img1e">
					</div>		
                    <input type="hidden" name="ownerid" id="ownerid" />						
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="取消">
					<input type="submit" class="btn btn-info" value="儲存">
				</div>
			</form>
		</div>
	</div>
</div>
<script>
document.getElementById("file1e").addEventListener("change",fileviewer1);
function fileviewer1() {
	let reader = new FileReader();
	reader.addEventListener("load", function (e) {
	let fileContent = e.target.result;
	let show = document.getElementById("img1e");
	show.setAttribute("src", fileContent);
	show.setAttribute("width","600px");
	})
	let file = document.getElementById("file1e").files[0];
	reader.readAsDataURL(file);
}
</script>
<!-- Delete Modal HTML -->
<div id="deleteEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="post" action="<c:url value='/mevent/delete'/>" enctype="application/x-www-form-urlencoded">
				<div class="modal-header">						
					<h4 class="modal-title">刪除活動</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<p>是否要刪除所選活動?</p>
					<p class="text-warning"><small>刪除無法復原</small></p>
				</div>
				<div class="modal-footer">
                    <input type="hidden" name="id" id="id" />
					<input type="button" class="btn btn-default" data-dismiss="modal" value="取消">
					<input type="submit" class="btn btn-danger" value="刪除">                
				</div>
			</form>
		</div>
	</div>
</div>
<footer>
&copy; 2021 EEIT131 第7組
</footer>
<!-- 
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.25/datatables.min.js"></script>
<script src="${pageContext.request.contextPath}/js/backstage/backstage.js"></script>
-->
</body>
</html>


 

