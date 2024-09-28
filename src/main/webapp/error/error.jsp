<%--
  Created by IntelliJ IDEA.
  User: swift
  Date: 2024-09-28
  Time: 오전 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <script>
    alert("${requestScope.errMsg}");
    <%
    System.out.println(request.getAttribute("errMsg"));
    %>

    location.href="${pageContext.request.contextPath}/index.jsp";
  </script>

</body>
</html>
