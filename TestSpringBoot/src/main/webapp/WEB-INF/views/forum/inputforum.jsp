<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.util.* "%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
    <META HTTP-EQUIV="EXPIRES" CONTENT="0">
    <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
    <title>foruminput</title>
    <script src="/petpet/ckeditor/ckeditor.js"></script>
    <style>
        body{
            text-align: center;
        }
        .center{
            display: block;
        }
    </style>
</head>
<body>
    <form action="${pageContext.request.contextPath}/inputforum.controller" method="post">
    <h2>title</h2>
    <input type="text" name="title" id="articletitle"><br>

    <h2>textarea</h2>
    <div class="center"> 
    <textarea name="article" id="article" class="article" cols="30" rows="5"></textarea><br><br>
    
    <input type="submit" value="送出">
    </div>
    </form>
</body>
<script>
    // Replace the <textarea id="editor1"> with a CKEditor 4
    // instance, using default configuration.
    CKEDITOR.replace( 'article', {
      

    });


</script>
</html>