<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    request.setCharacterEncoding("utf-8");
    Class.forName("oracle.jdbc.driver.OracleDriver"); // 1.드라이브 로드
    
    String url = "jdbc:oracle:thin:@//localhost:1521/xepdb1";   // oracle db 선택
    String user = "KSK";
    String pwd = "1111";	
    Connection con = DriverManager.getConnection(url,user,pwd);   // 2.연결 객체 생성
    	
    // 3.SQL 준비 및 실행
    String sql = "insert into list(title,userID,content) values(?,?,?)";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1, request.getParameter("title"));
    pstmt.setString(2, request.getParameter("userID"));
    pstmt.setString(3, request.getParameter("Content"));
    	
    //4.sql 실행
    int i = pstmt.executeUpdate();
    	
    //5. 객체 해제
    pstmt.close();
    con.close();
    	
    response.sendRedirect("Notice.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>