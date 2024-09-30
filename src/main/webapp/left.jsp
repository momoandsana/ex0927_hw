<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>로그인 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        body {
            margin: 10px;
            padding: 10px;
        }

        form {
            display: flex;
            flex-direction: column;
            width: 150px;
        }

        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        label {
            margin-right: 10px;
            width: 50px;
        }

        input[type="text"], input[type="password"] {
            width: 80px;
            padding: 5px;
        }

        img {
            width: 150px;
            height: auto;
        }

        a{
            margin-top : 10px;
        }
    </style>

    <script>
        function clearFields() {
            $("#userId").val("");
            $("#userPwd").val("");
        }

        $(function () {
            $("a").click(function () {
                if (confirm("로그아웃할래?")) {
                    // 로그아웃 리다이렉트
                    location.href = "${pageContext.request.contextPath}/logout";
                    <%--location.href = "${applicationScope.path}/logout";--%>
                }
            });

            // 로그인 성공 후 게시판을 새로고침하는 코드 추가
            <c:if test="${not empty sessionScope.userId}">
            window.parent.frames["center"].location.reload();
            // left 에서 로그인하면 center 의 글작성 기능이 가능해야 하니까 center 프레임 새로고침
            // 그냥 부모 자체를 reload 해도 괜찮음
            </c:if>
        });
    </script>
</head>
<body>
<c:choose>
    <c:when test="${not empty sessionScope.userId}">
        <!-- 로그인 성공 시 -->
        <h1>${sessionScope.userId} 님 환영합니다</h1>
        <p>로그인 시간 : ${sessionScope.creationTime}</p>
        <img src="images/cat.jpg" alt="고양이">
        <p>
            <a href="#" class="btn btn-warning">로그아웃</a>
        </p>
    </c:when>

    <c:otherwise>
        <!-- 로그인 폼 -->
        <form action="login" method="post">
            <div class="form-group">
                <label for="userId">ID :</label>
                <input type="text" id="userId" name="userId" required size="10">
<%--                여기서 size 는 입력 필드의 넓이--%>
            </div>

            <div class="form-group">
                <label for="userPwd">PWD :</label>
                <input type="password" id="userPwd" name="userPwd" required size="10">
            </div>

            <div>
                <button type="submit" class="btn btn-primary">로그인</button>
                <button type="button" class="btn btn-danger" onClick="clearFields()">취소</button>
                <%--clearFields() 함수 : 이 부분은 자바스크립트에서 정의된 함수로, 버튼이 클릭될 때 실행됩니다.
                보통 이 함수는 입력 필드나 폼의 값을 지우거나 초기화하는 기능을 수행합니다.--%>
            </div>
        </form>
    </c:otherwise>
</c:choose>
</body>
</html>
