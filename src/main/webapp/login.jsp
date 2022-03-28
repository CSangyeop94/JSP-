<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport content="width=device-width", initial-scale="1">
//부스스트랩은 해상도에 맞게 디자인이 변경되는 템플렛이라 간단하게 반응형 메타만적용
<link rel="stylesheet" href="css/bootstrap.css">
//스타일시트.css 폴더의 부트스트랩 참조하겠다는의미
<title>JSP 웹 게시판</title>
</head>
<body>
HelloWorld
	<nav class="navbar navbar-default"> //네비게이션 구현-웹사이트의 전반적인 구상을 보여주는 역할
	<div class="navbar-header"> // header 홈페이지의 로고를 담는 영역
	<button type="button" class="navbar-toggle collapsed"
		data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
		aria-expanded="false">
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a> //  brand 로고같은것
		</div>
		<div class="collapse navbar-collapse" di="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav"> // navbar(메뉴바)
			<li><a href="main.jsp">메인</a></li>
			<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li class="active"><a href="login.jsp">로그인</a></li>
					<li><a href="join.jsp">회원가입</a></li>
				</ul>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container"> // 로그인 양식 만들기
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="loginAction.jsp"> // post(정보를 숨기면서 보낼때 사용하는 메소드)
					<h3 style="text-align:center;">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" palceholder="아이디" name="userID" maxlength="20">
					</div>				
					<div class="form-group">
						<input type="password" class="form-control" palceholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인">
				</form>
				
		</div>
		<div class="col-lg-4"></div>
	</div>
	<script src ="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	//에니메이션담당하는 자바스크립트 jquery참조
	<script src="js/bootstrap.js"></script>
	//부트스트랩에서 지원하는 자바스크립트파일
	</div>
</body>
</html>