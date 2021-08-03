<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.* , com.petpet.bean.EventBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
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


<title>BackStage</title>
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
                        <div class="col-sm-4">
                            <h2><b>線下活動管理</b></h2>
                        </div>
                        <div class="col-sm-5">
						    <a href="${pageContext.request.contextPath}/queryevent.controller?eventid=-1"  class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>新增活動</span></a>
						    <a href="#deleteEmployeeModal" class="btn btn-danger"><i class="material-icons">&#xE15C;</i> <span>刪除活動</span></a>	
                            <a href="${pageContext.request.contextPath}/EventAdd" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>成員新增活動</span></a>
                            <a href="${pageContext.request.contextPath}/Eventdelete" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>成員刪除活動</span></a>
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
                            <th scope="col">活動名稱</th>
                            <th scope="col">活動是否開啟</th>
                            <th scope="col">起始時間</th>
                            <th scope="col">結束時間</th>
                            <th scope="col">地點</th> 
                            <th scope="col">種類</th>
                            <th scope="col">人數上限</th>
                            <th scope="col">費用</th>
                            <th scope="col">點閱次數</th>
                            <th scope="col">修改刪除</th>
                        </tr>
                    </thead>
            <!-- 右邊下面內容欄位 -->
                <tbody>
                    <c:forEach items="${events}" var="event" varStatus="s">
                        <tr>
                            <td>
                                <!-- 隱藏的P   EventID用來給Checkbox用來選取刪除用 -->
							    <span class="custom-checkbox">
								    <input type="checkbox" id="checkbox<c:out value='${i.index+1}'/>" name="options[]" value="<c:out value='${i.index+1}'/>">
								    <label for="checkbox"></label>
                                    <p style="display: none">${event.eventID}</p>
						    	</span>
						    </td>
                            <td>
                                <a href="<c:url value='/queryevent.controller?eventid=${event.eventID}'  />">  ${event.eventName} </a>
                            </td>
                            <!-- 利用Choose 來換標籤 -->
                            <c:choose>
                                <c:when test="${event.eventStatus == 'true'}">
                                    <td>開放 <i class="fa fa-check fa-1x" aria-hidden="true"></i></td>
                                </c:when>
                                <c:when test="${event.eventStatus == 'false'}">
                                    <td>不開放<i class="fa fa-times" aria-hidden="true"></i>
                                    </td>
                                </c:when>
                            </c:choose>
                            <!-- 更改時間格式，比較清楚 -->
                            <td><fmt:formatDate pattern="yyyy-MM-dd aa HH:mm" value='${event.eventStartTime}'/></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd aa HH:mm" value='${event.eventEndTime}'/></td> 
                            <td><c:out value="${event.eventLocation}" /> </td>
                            <td><c:out value="${event.eventType}"/></td>
                            <td><c:out value="${event.eventMaxLimit}"/></td>
                            <td><c:out value="${event.eventFee}"/></td>
                            <td><c:out value="${event.eventClick}"/></td>
                            <td><a href='/petpet/queryevent.controller?eventid=${event.eventID}' class="edit"   value = "修改"> <i class="material-icons" data-toggle="tooltip" title="修改">&#xE254;</i>   
                                <a href="/petpet/deleteevent.controller?eventid=${event.eventID}" class="delete" id="delete"  value="刪除"><i class="material-icons" data-toggle="tooltip" title="刪除">&#xE872;</i></a>
                            </td>
                            <td>
                            <c:set var="eventmember" value="${event.members}" />
                            <c:if test="${not empty eventmember}">
                                <c:forEach items="${eventmember}" var="eventmember" varStatus="s">

                                <c:set var="eventmembername" value="${eventmember}" />
                                ${eventmembername.userName}
                               </c:forEach>
                               <!-- 利用C:set撈出EL資料，迴圈撈出活動參加人員，Test檢驗是否有參加會員 -->
                            </c:if>   
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>


            </div>
        </div>
    </div>
</div>

</body>
<script>
//  右側的刪除標籤確認AJAX
 $(document).ready(function() {
    $("#delete").on("click", function() {
        if (confirm("你確定要刪除這個活動嗎")) {
            // let  web="/petpet/deleteevent.controller?eventid="+ID;
            // window.location.href=web;
            $.get( "/petpet/deleteevent.controller?eventid=${event.eventID}", function( ) {
                alert( "刪除成功" );
                location.reload() ;
            });
        }
        return false;
    })
//左上方Checkbox 全選，全不選
    var checkbox = $('table tbody input[type="checkbox"]');
	$("#selectAll").click(function(){
		if(this.checked){
			checkbox.each(function(){
				this.checked = true;                        
			});
		} else{
			checkbox.each(function(){
				this.checked = false;                        
			});
		} 
	});
	checkbox.click(function(){
		if(!this.checked){
			$("#selectAll").prop("checked", false);
		}
	});
// 點選刪除標籤，將ID放到LIST內跑迴圈送出AJAX做批次刪除
    $("a[class='btn btn-danger']").click(function(){
	var ckdlist = [];
		$('tbody input[type="checkbox"]').each(function(){
            if($(this).prop("checked")){
                let id=$(this).next().next().text();
                console.log(id);    
                ckdlist.push(id);
            }
        });
        console.log(ckdlist.toString());
        ckdlist.forEach (id =>
        $.get ("/petpet/deleteevent.controller?eventid="+id, function() {
                alert( "刪除成功" );
                location.reload() ;
            })
        )   
    })
    
})
</script>
</html>