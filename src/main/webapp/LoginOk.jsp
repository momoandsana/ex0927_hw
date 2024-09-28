<%--
  Created by IntelliJ IDEA.
  User: swift
  Date: 2024-09-28
  Time: 오전 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
  <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>

  <script>
    $(function(){
      $("a").click(function(){
        if(confirm("로그아웃할래?")){
          location.href="${pageContext.request.contextPath}/logout";
        }
      })
    })
  </script>

  <style>
    img{
      width:100px;
      height:auto;
    }
  </style>
</head>
<body>
<h3>
   (${sessionScope.userId})님 로그인 중<br>
  [ 접속시간 : ${sessionScope.creationTime}]
</h3>
<img src="images/cat.jpg" alt="고양이">
<p>
  <a href="#">로그아웃</a>
</p>
</body>
</html>
