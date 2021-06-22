<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"%>
    
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<link href="/css/test/test.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="./mainstyle.css">
</head>

<body>
<header>
        <a href="Notice.jsp"><div>공지사항</div></a>
        <a href="busInfo.jsp"><div>운행정보</div></a>
        <a href=""><div>고객의견</div></a>
        <a href=""><div>유실물센터</div></a>
        <a href=""><div>자료실</div></a>
         <% if(session.getAttribute("userID")==null){ %>
        <div class="user">
            <span>
                <button><a href = "Login.jsp">로그인</a></button>
            </span>
            <span>
                <button><a href = "sign.jsp">회원가입</a></button>
            </span>
        </div>
        <% }else{ %>
          <form action="logout.jsp" method="post">
			<%=session.getAttribute("userID") %>님 환영합니다
			<input type="submit" value="로그아웃" />
			</form>
			<% } %>
    </header>
    
	<div class="container">
		<table class="table table-bordered">
			<thead>
				<h1>글쓰기</h1>
			</thead>
			<tbody>
				<form action="NoticePro.jsp" method="post">
					<tr>
						<th>제목:</th>
						<td><input type="text" placeholder="제목을 입력하세요." name="title" class="form-control" /></td>
					</tr>
					<tr>
						<th>내용:</th>
						<td><textarea placeholder="내용을 입력하세요 . " name="Content" class="form-control" style="height: 200px;"></textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							<button id="btn_register" type="submit" class="btn_register">등록</button>
					</tr>
				</form>
			</tbody>
		</table>
	</div>
</body>
</html>