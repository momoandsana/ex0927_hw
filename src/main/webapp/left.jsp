<%--
  Created by IntelliJ IDEA.
  User: swift
  Date: 2024-09-27
  Time: 오후 7:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>로그인 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        body{
            margin:10px;
            padding:10px;
        }
        form{
            display:flex;
            flex-direction:column;
            width:150px;
        }
        /*아이디 입력 label 과 input 값을 그룹으로 묶어서 한 줄로*/

        .form-group{
            display:flex;
            align-items:center;
            margin-bottom:10px;
        }
        /*아이디와 비번 입력 칸이 같은 x축 위치에서 시작해서 같은 위치에서 끝날 수 있도록*/

        label{
            margin-right:10px;
            width:50px;
        }
        /*label ID, PWD 주변 공간 조정*/

        input[type="text"],input[type="password"]{
            width:80px;
            padding:5px;
        }

    </style>

    <script>
        function clearFields() {
            $("#username").val("");
            $("#password").val("");
        }
    </script>
</head>
<body>
<c:choose>
    <c:when test="${not empty sessionScope.userId}">
        <h1>${sessionScope.userId} 님 환영합니다</h1>
        <p>로그인 시간 : ${sessionScope.creationTime}</p>
    </c:when>

    <c:otherwise>
        <form action="login" method="post">
            <div class="form-group">
                <label for="userId">ID :</label>
                <input type="text" id="userId" name="userId" required>
            </div>

            <div class="form-group">
                <label for="userPwd">PWD :</label>
                <input type="password" id="userPwd" name="userPwd" required>
            </div>

                <%-- required 를 사용하면 사용자가 해당 필드를 비워두고 폼을 제출하려고 할 경우, 브라우저가 경고한다 --%>
            <div>
                <button type="submit" class="btn btn-primary">로그인</button>
                <button type="button" class="btn btn-danger" onClick="clearFields()">취소</button>
            </div>
        </form>
    </c:otherwise>
</c:choose>





</body>
</html>
