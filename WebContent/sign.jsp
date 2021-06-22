<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<style>
body {

     margin-left:30px;
     font-family:맑은 고딕,돋움,굴림;
     color:#888888;
     font-size:8pt;
}
table {
	 margin-top:20px;
	 border-collapse:collapse;
     font-size:9pt;
     margin-left:0;
}
img {
	 border:none;
}

input {
	 height:18px;
}
th,td {
	 padding-left:20px;
     text-align:left;
     background-image:url(images/member/dot.gif);
     background-repeat:no-repeat;
     background-position:left;
     border-bottom:#eeeeee solid 1px;
}
#member_button {
	 margin-top:10px;
     text-align:center;
}
#name,#id,#mbpw,#pwd, {
	 width:150px;
     height:18px;
}
#btn_sign {
	margin-left: 120px;
}
</style>
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
<form action = "SignPro.jsp" method = "Post">
<table width ="940" style="padding:5px 0 5px 0;">
         <tr>
           <th>이름</th>
          <td><input type="text" name="name"></td>
         </tr>
 
        <tr>
         <th>이메일</th>
         <td><input type="text" name="email">
			</td>
      </tr>
 
      <tr>
         <th>아이디</th>
         <td> <input type="text" name="userID"><a href='#' style='cursor:pointer'></a> (영문/숫자 10~12자) </td>
      </tr>
 
      <tr>
         <th>비밀번호</th>
         <td><input type="password" name="pwd"> 영문/숫자포함 6자 이상</td>
      </tr>
<tr>
      <td colspan="2" align="center">
         <button id="btn_sign" type="submit" class="btn_register">회원가입</button>
          </a><button id="return" type="button" class="btn_register"><a href = "main.jsp">취소</a></button>
      </td>

   </tr>
   </table>
   </form>
</html>