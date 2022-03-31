<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport content"= width="device-width" initial-scale="1">
//부스스트랩은 해상도에 맞게 디자인이 변경되는 템플렛이라 간단하게 반응형 메타만적용
<link rel="stylesheet" href="css/bootstrap.css">
//스타일시트.css 폴더의 부트스트랩 참조하겠다는의미
<title>JSP 웹 게시판</title>
<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decorateion: none;
	}
</style>
</head>
<body>
	<%
		String userID = null;
	if (session.getAttribute("userID.") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>
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
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav"> // navbar(메뉴바)
			<li><a href="main.jsp">메인</a></li>
			<li class="active"><a href="bbs.jsp">게시판</a></li>
			</ul>
			<%
				if(userID == null) {
			%>
		    <ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="login.jsp">로그인</a></li>
					<li><a href="join.jsp">회원가입</a></li>
				</ul>
				</li>
			</ul>
				
			<%
				} else {
			%>		
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="logoutAction.jsp">로그아웃</a></li>
				</ul>
				</li>
			</ul>
			<% 	
				}
			%>
					</div>
	</nav>
	<div class="contatiner">
			<div class="row">
				<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
					<thead>
						<tr>
						<th style="background-color: #eeeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeeee; text-align: center;">작성일</th>
						</tr>
					</thead>
					<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
					ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
					for(int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><%= list.get(i).getBbsID() %></td>
							<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
							<td><%= list.get(i).getUserID() %></td>		
							<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분" %></td>				
						</tr>
						
						<%
					}
					%>
						
					</tbody>
				</table>
				<%
					if(pageNumber !=1) {
				%>
						<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-left">이전</a>
				<% 
					} if(bbsDAO.nextPage(pageNumber + 1)) {		
				%>
					<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-left">다음</a>
				<%	
					}
				%>
				<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
			</div>
	</div>
	<script src ="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	//에니메이션담당하는 자바스크립트 jquery참조
	<script src="js/bootstrap.js"></script>
	//부트스트랩에서 지원하는 자바스크립트파일

</body>
</html>