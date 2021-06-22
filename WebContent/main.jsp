<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    
    
    <title>Document</title>
    <link rel="stylesheet" href="./mainstyle.css">
</head>
<body>
    <header>
        <a href="Notice.jsp"><div>공지사항</div></a>
        <a href="busInfo.jsp"><div>운행정보</div></a>
        <a href=""><div>고객의견</div></a>
        <a href=""><div>유실물센터</div></a>
        <a href="ImageNotice.jsp"><div>자료실</div></a>
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
    <main>
        <div class="section1">
            <div class="img">
            <h1 class="img_font"></h1>
            </div>
        </div>
        <div class="board">
            <div class="board_left">
            
            </div>
            <div class="board_right"></div>
        </div>
        <div id="map" style="width: 100%;height:500px"></div>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf912946ebf331c3bd29bb7a2a23bca5"></script>
<script>
var container = document.getElementById('map');			//지도를 담을 영역의 DOM 레퍼런스
var options = {												//지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(35.49275189835909, 129.28114272676092), 			//지도의 중심좌표
	level: 3 					// 지도의 레벨(확대,축소)
};
var map = new kakao.maps.Map(container, options);  
var markerPosition  = new kakao.maps.LatLng(35.49275189835909, 129.28114272676092);
 
var marker = new kakao.maps.Marker({
    position: markerPosition
});
marker.setMap(map);//실행코드
</script>
        
    </main>
    <footer>
        <div>1</div>
        <div>2</div>
    </footer>
</body>
</html>