<%@page import="java.io.PrintWriter"%>
<%@page import="ksk0525.DAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String userID= request.getParameter("id");
	String pwd = request.getParameter("pwd");

	DAO dao = new DAO();
	int check  = dao.login(userID, pwd);
	if(check == 1){
		Cookie cookie = new Cookie ("id",userID);
		cookie.setMaxAge(20*60);
		response.addCookie(cookie);
		session.setAttribute("userID", userID);
		response.sendRedirect("main.jsp?id="+userID);
	}else if(check ==0){
		
%>
<script>
	alert("비번잘못입력");
	location.href="Login.jsp";
</script>
<%}else{ %>
<script>
	alert("no")

</script>
<%} %>

</body>
</html>