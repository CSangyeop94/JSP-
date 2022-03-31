<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 웹 게시판</title>
</head>
<body>
	<%
		session.invalidate(); //현재 이페이의 접속한 회원이 세션을 빼아서 로그아웃 시켜줌
	%>
	<script>
	location.href = "main.jsp" //메인.jsp로 이동시켜줌
	</script>

</body>
</html>