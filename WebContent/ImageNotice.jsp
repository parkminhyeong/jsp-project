<%@page import="java.util.ArrayList"%>
<%@page import="ksk0525.DAO2"%>
<%@page import="ksk0525.DTO2"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    int numOfRecords = 10;
	int p = 1;
	int numOfPages = 5;
	
	DAO2 dao2 = new DAO2();
	
	String p_ = request.getParameter("p");
	
	if(p_ != null && !p_.equals("")){
		p = Integer.parseInt(p_);
	}
	
	ArrayList<DTO2> dtos = dao2.getListUser(p, numOfRecords);
	
	int count = dao2.getCount();
	int startNum = p - ((p-1) % numOfPages);
	int lastNum = (int)Math.ceil((double)count / numOfRecords);
%>
<!DOCTYPE html>
<html>
<head>
<%
      	Class.forName("oracle.jdbc.driver.OracleDriver"); // 1.드라이브 로드
    
    	String url = "jdbc:oracle:thin:@//localhost:1521/xepdb1";   // oracle db 선택
    	String user = "KSK";
    	String pwd = "1111";
    	
    	Connection con = DriverManager.getConnection(url,user,pwd);   // 2.연결 객체 생성
    	
    	// 3.SQL 준비 및 실행
    	String sql = "select * From uploadfiles";
    	Statement st = con.createStatement();
    	// 4.반환 객체
    	ResultSet rs = st.executeQuery(sql);
    	%>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="./mainstyle.css">
</head>
<body>
<header>
        <a href="Notice.jsp"><div>공지사항</div></a>
        <a href="busInfo.jsp"><div>운행정보</div></a>
        <a href=""><div>고객의견</div></a>
        <a href=""><div>유실물센터</div></a>
        <a href="ImageNotice.jsp"><div>자료실</div></a>
        <div class="user">
            <span>
                <button><a href = "Login.jsp">로그인</a></button>
            </span>
            <span>
                <button><a href = "sign.jsp">회원가입</a></button>
            </span>
        </div>
    </header>
<div class = "container"> 
<h1 class = "text-center font-weight-bold">자료실</h1>
<br></br>
	<table class = "table table-hover">
	<tr>
	<th>제목</th>
	<th>작성자</th>
	<th>날짜</th>
	</tr>
<% 
	//5. 결과집합 처리 //0507
	for(DTO2 dto2: dtos) {
%>	
		<tr> 	
			<td><a href="updateForm.jsp?id=<%=dto2.getTitle() %>"><%=dto2.getTitle() %></a></td>
			<td><td><%=session.getAttribute("userID") %></td></td>
			<td><%=dto2.getRegdate() %></td>
		</tr>
<%}
	// 6.연결 해제
	rs.close();
	st.close();
	con.close();
	%>
	</table>
	</div>
	<div>	
<ul class="pagination justify-content-center" style="margin:20px 0">
<!-- previous 부분  -->
<%if(startNum <=1) {%>
	<li class = "page-item"><a class="page-link" style="color:gray" onclick="alert('더 이상 앞페이지가 없다.')" href="#">Previous</a></li>
<% } else { %>
<li class = "page-item"><a class="page-link" style="color:gray" href="?p=<%=startNum-1%>">Previous</a></li>

<% } %>
<!-- 숫자 링크 부분 -->
<%for(int i = 0; i< numOfPages; i++){
	if(startNum+i <= lastNum){
		if(p==startNum+i){
			%>
			<li class="page-item active"><a class="page-link" href="?p=<%=startNum+i%>"><%=startNum+i %></a></li>
		<%}else{%>
		<li class="page-item"><a class="page-link" href="?p=<%=startNum+i%>"><%=startNum+i %></a></li>
	<%  }%>
	<% }
	}
	%>
  <!-- next 부분 -->
  <%if(startNum+numOfPages > lastNum) {%>
	    <li class="page-item"><a class="page-link"  style="color:gray" onclick="alert('더 이상 페이지가 없습니다')" href="#">Next</a></li>
  <% }else{ // startNium+ numOfpages : 뒤에 페이지들이 있을 때 %>
   <li class="page-item"><a class="page-link" href="?p=<%= startNum+numOfPages %>">Next</a></li>
  <% }%>
  
</ul>
</div>
		<a href="ImageNoticeForm.jsp"><input type = "submit" value="등록"></a>
</body>
</html>