<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Google Maps</title>

    <style type="text/css">
        /* Set the size of the div element that contains the map */
        #map {
            height: 800px;
            /* The height is 400 pixels */
            width: 100%;
            /* The width is the width of the web page */
        }
    </style>
    <script  src="./busStop.js"></script>
    <script>
        function initMap() {

            // 지도 스타일
            const map = new google.maps.Map(document.getElementById("map"), {
                zoom: 14,
                zoomControl: true,
                scaleControl: false,
                center: { lat: 35.543305, lng: 129.259857 },
            });
            35.543906945266706, 129.25627356906733
            // 마커 정보
            var locations = [
                { place: "울산대학교", lat: 35.543906945266706, lng: 129.25627356906733 },
               
            ];


            // 지도에 표시된 마커 객체를 가지고 있을 배열
            var markers = [];

            //인포윈도우
            var infowindow = new google.maps.InfoWindow();

            //마커 생성
            for (var i = 0; i < BUS_STOP.length; i++) {
                var marker = new google.maps.Marker({
                    //map: map,
                    visible: true,
                    position: new google.maps.LatLng(BUS_STOP[i][3], BUS_STOP[i][2]),
                });

                markers.push(marker);

                google.maps.event.addListener(marker, 'click', (function (marker, i) {
                    return function () {
                        //html로 표시될 인포 윈도우의 내용
                        infowindow.setContent(BUS_STOP[i][0]+"\n" +BUS_STOP[i][1]);
                        
                        //인포윈도우가 표시될 위치
                        infowindow.open(map, marker);
                    }
                })(marker, i));

                if (marker) {
                    marker.addListener('click', function () {
                        //중심 위치를 클릭된 마커의 위치로 변경
                        map.setCenter(this.getPosition());
                        //마커 클릭 시의 줌 변화
                        map.setZoom(17);
                    });
                }
            }
            // 일정 줌값 이상일때만 마커 표시
            google.maps.event.addListener(map, 'zoom_changed', function () {
                var zoom = map.getZoom();
                console.log("현재 zoom level : " + zoom)
                
                if (zoom >= 16) {
                    for (var i = 0; i < markers.length; i++) {
                        markers[i].setMap(map);
                    }
                }
                else {
                    for (var i = 0; i < markers.length; i++) {
                        markers[i].setMap(null);
                    }
                }
            });

        }

    </script>
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
    <!--The div element for the map -->
    <div id="map"></div>

    <!-- Async script executes immediately and must be after any DOM elements used in callback. -->
    <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCKNruvEWBEdU_aPm73GcNmnlsFvXv8Wcs&callback=initMap&libraries=&v=weekly"
        async></script>
</body>

</html>