<%--
  Created by IntelliJ IDEA.
  User: swift
  Date: 2024-09-27
  Time: 오후 7:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인 페이지</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        body{
            margin:10px;
            padding:10px;
        }
        form{
            display:flex;
            flex-direction:column;
            width:220px;
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
            width:100px;
            padding:5px;
        }
        /*입력칸의 크기 조정*/
    </style>

    <script>
        function clearFields() {
            $("#username").val("");  // jQuery를 사용하여 username 필드 지우기
            $("#password").val("");  // jQuery를 사용하여 password 필드 지우기
        }
    </script>
</head>
<body>
<c:choose>
    <c:when test="${not empty sessionScope.userId}">
        <h1>${sessionScope.userId} 님 환영합니다</h1>
        <p>로그인 시간 : ${sessionScope.loginTime}</p>
    </c:when>

    <c:otherwise>
        <form action="login" method="post">
            <div class="form-group">
                <label for="username">ID :</label>
                <input type="text" id="username" name="username" required>
            </div>

            <div class="form-group">
                <label for="password">PWD :</label>
                <input type="password" id="password" name="password" required>
            </div>

                <%-- required 를 사용하면 사용자가 해당 필드를 비워두고 폼을 제출하려고 할 경우, 브라우저가 경고한다 --%>
            <div>
                <button type="submit">로그인</button>
                <button type="button" onClick="clearFields()">취소</button>
            </div>
        </form>
    </c:otherwise>
</c:choose>





</body>
</html>
