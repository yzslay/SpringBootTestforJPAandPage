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
    nav {
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
    }
    .anchor::before {
      content: "";
      display: block;
      height: 70px;
    }
    .eventmargin {
      margin-top: 30px;
      margin-bottom: 30px;
    }
  </style>

  <body>
    <nav>
      <ul>
        <li>
          <a href="queryallevent.controller" class="href">查詢所有活動</a>
        </li>
        <li><a href="createeevent.url" class="href">新增活動</a></li>
        <li><a href="about" class="href">about</a></li>
      </ul>
    </nav>

    <div class="anchor container">
      <div class="container-fluid d-flex justify-content-end eventmargin">
        <a
          href="${pageContext.request.contextPath}/queryevent.controller?eventid=-1"
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
        <select style="margin-left: 30px">
          <option>請選擇你喜歡的活動類型</option>
          <option>交友</option>
          <option>聚餐</option>
          <option>散步</option>
        </select>
      </div>

      <c:set var="count" value="0" scope="page" />
      <div class="card-deck" style="margin: 0.5em 0;">
      <c:forEach items="${events}" var="event" varStatus="s">
        
        <c:if test="${count%4==0}">
          <div class="card-deck"  style="margin: 0.5em 0">
        </c:if>
            <div class="card" style="width: 400px">
              <img class="card-img-top" src="${pageContext.request.contextPath}/event/display/${event.eventID}" alt="Card image" />
              <div class="card-body">
                <h4 class="card-title">${event.eventName} </h4>
                <p class="card-text">${event.eventType}</p>
                <p class="card-text"><fmt:formatDate pattern="yyyy-MM-dd aa HH:mm" value='${event.eventStartTime}'/></p>
                <a
                  href="https://www.google.com/"
                  class="btn btn-primary stretched-link"
                  >See Profile</a
                >
                <a href="https://www.yahoo.com/" class="btn btn-success">See MOO</a>
              </div>
            </div>
        <c:if test="${count%4==3}">
        </div> 
        </c:if>
        <c:set var="count" value="${count + 1}" scope="page"/>
      </c:forEach>
     </div>
    </div>
  </body>
</html>
