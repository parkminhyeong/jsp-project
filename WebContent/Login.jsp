<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;                       <%--  박스의 크기를 화면에 표시  --%>
  font-family: "Noto Sans KR", sans-serif;      <%--  글꼴 설정  --%>
} 

.login_div {
	
  width: 100%;
  height: 70vh;                             <%--   vh : 높이값의 100분의 1의 단위 , 높이값이 900px일때 1vh는 9px   --%>
  display: flex;                             <%--   flex 컨테이너를 생성  --%>
  align-items: center;                        <%--  교착축의 기준으로 정렬   --%>
  justify-content: center;                    <%--  items를 중심축의 기준으로 정렬  --%>
 
}

.login {
  border: 1px solid black;
  width: 30%;
  height: 600px;
  background: white;
  border-radius: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;                      <%-- //flex 컨테이너 내의 아이템을 배치할 때 사용할 주축 및 방향(정방향, 역방향)을 지정 --%>
}

h2 {
  color: tomato;
  font-size: 2em;
}

.login_id {
  margin-top: 20px;
  width: 80%;
}

.login_id input {
  width: 100%;
  height: 50px;
  border-radius: 30px;
  margin-top: 10px;
  padding: 0px 20px;
  border: 1px solid lightgray;
  outline: none;                               <%--  outline : border의 바깥 외각선   --%>
}

.login_pw {
  margin-top: 20px;
  width: 80%;
}

.login_pw input {
  width: 100%;
  height: 50px;
  border-radius: 30px;
  margin-top: 10px;
  padding: 0px 20px;
  border: 1px solid lightgray;
  outline: none;
}

.submit {
  margin-top: 50px;
  width: 80%;
}

.submit input {
  width: 100%;
  height: 50px;
  border: 0;
  outline: none;
  border-radius: 40px;
  background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));   <%--  두 개 이상의 색이 직선을 따라 점진적으로 변화하는 이미지를 생성 --%>
  color: white;
  font-size: 1.2em;
  letter-spacing: 2px;                   <%-- 글자 사이의 간격 --%>
}
</style>
<head>
<meta charset="UTF-8">
<title>login</title>
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
<form action = "Login_check.jsp" method = "Post">    
<div class="login_div">
        <div class="login">
            <h2>로그인</h2>
            <div class="login_id">
                <h4>아이디</h4>
                <input type="text" name="id" placeholder="아이디">
            </div>
            <div class="login_pw">
                <h4>비밀번호</h4>
                <input type="password" name="pwd" placeholder="비밀번호">
            </div>
            <div class="submit">
                <input type="submit" value="로그인">
            </div>
        </div>
    </div>
</form>
</body>
</html>