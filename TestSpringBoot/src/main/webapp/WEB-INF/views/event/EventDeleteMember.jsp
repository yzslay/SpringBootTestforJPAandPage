<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.util.* "%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%> <%! @SuppressWarnings("unchecked") %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE" />
    <META HTTP-EQUIV="EXPIRES" CONTENT="0" />
    <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>活動會員刪除</title>

    <!-- Bootstrap Table with Search Column Feature -->
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round"
    />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
    />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <!-- JS -->
    <script
      src="https://code.jquery.com/jquery-3.6.0.js"
      integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
      crossorigin="anonymous"
    ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="<c:url value='/js/event/event.js'/>"></script>
  </head>

  <body>
    <form
      id="form"
      class="form-control"
      method="GET"
      action="${pageContext.request.contextPath}/eventdeletemember"
    >
      EventID:<input type="text" name="eventid" /> <br />
      MemberID:<input type="text" name="memberid" />
      <input
        type="submit"
        id="submit"
        class="btn btn-primary form-control"
        value="確認刪除"
      />
    </form>
  </body>
</html>
