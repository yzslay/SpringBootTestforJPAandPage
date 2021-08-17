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
  </head>
  <style>
    /* nav {
      background-color: #60ca91;
      padding: 13px;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      z-index: 100;
    }
    nav ul {
      display: flex;
      margin: 0 auto;
      padding: 0;
      justify-content: center;
      list-style-type: none;
    }
    nav ul li a {
      color: deepblue;
      padding: 15px;
      font-size: 28px;
      margin: 40px;
    } */
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
  </style>

<body background="<c:url value='/Member/images/petBackground.jpg' />" style="background-repeat:no-repeat;">
    <!--navigation-------------------------------->
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


    <div class="anchor container">
      <div class="container-fluid d-flex justify-content-end eventmargin">
        <a
          href="${pageContext.request.contextPath}/member.addevent.controller"
          class="btn btn-success"
          ><i class="fa fa-pencil-square-o" aria-hidden="true"></i
          ><span>新增活動</span></a
        >
        <a
          href="${pageContext.request.contextPath}/queryevent.controller?eventid=-1"
          class="btn btn-success"
          style="margin-left: 20px"
          ><i class="fa fa-search" aria-hidden="true"></i>
          <span>查詢建立活動</span></a
        >
        <select id="sort" style="margin-left: 30px">
          <option value="eventName">排序方法</option>
          <option value="eventName">活動名稱</option>
          <option value="eventStartTime">活動時間</option>
        </select>
        <select id="sortdict" style="margin-left: 30px">
          <option value="asc">排序方向</option>
          <option value="asc">asc</option>
          <option value="desc">desc</option>
        </select>
      </div>

      <c:set var="count" value="0" scope="page" />
      <div class="card-deck" style="margin: 0.5em 0;">
          <c:forEach items="${events}" var="event" varStatus="s">
            
            <c:if test="${count%3==0}">
              <div class="card-deck"  style="margin: 0.5em 0">
            </c:if>
                <div class="card" style="width: 400px">
                  <img class="card-img-top  imgheigh" src="${pageContext.request.contextPath}/event/display/${event.eventID}" alt="Card image" />
                  <div class="card-body">
                    <h4 class="card-title">${event.eventName} </h4>
                    <p class="card-text">${event.eventType}</p>
                    <p class="card-text"><fmt:formatDate pattern="yyyy-MM-dd aa HH:mm" value='${event.eventStartTime}'/></p>
                    <a
                      href="/petpet/queryevent.controller?eventid=${event.eventID}"
                      class="btn btn-primary stretched-link"
                      >加入活動</a
                    >
                    <a href="https://www.yahoo.com/" class="btn btn-success">活動詳情</a>
                  </div>
                </div>
            <c:if test="${count%3==2}">
              </div> 
            </c:if>
            <c:set var="count" value="${count + 1}" scope="page"/>
            </c:forEach>
     </div>
     <!-- 頁面  -->
     <div class="container">
          <ul class="pagination">
            <c:if test="${currentPage > 1}">
            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/member.queryallevent.controller/page/${currentPage - 1}?sortField=${sortField}&sortDir=${sortDir}">前一頁</a></li>
            </c:if>
            
            <c:if test="${currentPage > 1}">
              <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/member.queryallevent.controller/page/1?sortField=${sortField}&sortDir=${sortDir}">1</a></li>
            </c:if>
            <c:if test="${currentPage == 1}">
              <li class="page-item"><a class="page-link" >1</a></li>
            </c:if>

            <c:forEach var="i" begin="2" end="${totalPages}">

              <c:if test="${currentPage != i}">
                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/member.queryallevent.controller/page/${i}?sortField=${sortField}&sortDir=${sortDir}"">${i}</a></li>
              </c:if>
              <c:if test="${currentPage == i}">
                <li class="page-item"><a class="page-link" >${i}</a></li>
              </c:if>
            </c:forEach>
            
          <c:if test="${currentPage < totalPages}">
            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/member.queryallevent.controller/page/${currentPage + 1}?sortField=${sortField}&sortDir=${sortDir}"">下一頁</a></li>
          </c:if>
          <c:if test="${currentPage == i}">
            <li class="page-item"><a class="page-link">下一頁</a></li>
          </c:if>

          <c:if test="${currentPage < totalPages}">
            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/member.queryallevent.controller/page/${totalPages}?sortField=${sortField}&sortDir=${sortDir}"">最後一頁</a></li>
          </c:if>
          <c:if test="${currentPage == totalPages}">
            <li class="page-item"><a class="page-link">最後一頁</a></li>
          </c:if>
        </ul>
      </div>
    </div>
  </body>

  <script>
$(document).ready(function() {
  $('#sort').change("click", function() {
    var sorting = $('#sort').val();
    var sortdict = $('#sortdict').val();
    console.log(sorting);
    window.location.href="${pageContext.request.contextPath}/member.queryallevent.controller/page/${currentPage}?sortField="+sorting+"&sortDir="+sortdict;
  })  
  $('#sortdict').change("click", function() {
    var sorting = $('#sort').val();
    var sortdict = $('#sortdict').val();
    console.log(sortdict);
    window.location.href="${pageContext.request.contextPath}/member.queryallevent.controller/page/${currentPage}?sortField="+sorting+"&sortDir="+sortdict;
  })



})

  </script>
</html>
