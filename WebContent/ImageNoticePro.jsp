<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String encType="utf-8";
int maxSize = 10*1024*1024;
String dir = application.getRealPath("/upload");

MultipartRequest multi=null;

File f = new File(dir);
if(!f.exists()) {
	f.mkdirs();
}
out.println(dir);
try{
	multi = new MultipartRequest(request, dir, maxSize,encType, new DefaultFileRenamePolicy());
	String userID = multi.getParameter("userID");
	String title = multi.getParameter("title");
	String content = multi.getParameter("Content");
	String filename  = multi.getFilesystemName("filename");
	String original = multi.getOriginalFileName("filename");
	
	String type = multi.getContentType("filename");
	out.println("<br>작성자 :" + userID);
	out.println("<br>제목 : " + title);
	out.println("<br>내용 : " + content);
	out.println("<br>파일명 : "+ original);
	
	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource) envCtx.lookup("jdbc/JspProject");
	
	Connection con = ds.getConnection();   // 2.연결 객체 생성
	
    // 3.SQL 준비 및 실행
    String sql = "INSERT INTO uploadfiles(userID,title,Content,filename) VALUES(?,?,?,?)";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1, request.getParameter("userID"));
    pstmt.setString(2, request.getParameter("title"));
    pstmt.setString(3, request.getParameter("Content"));
    pstmt.setString(4, request.getParameter(original));
    	
    //4.sql 실행
    pstmt.executeUpdate();
    pstmt.close();
    con.close();
    	
    response.sendRedirect("ImageNotice.jsp");
}catch(IOException ioe){System.out.println(ioe);}
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