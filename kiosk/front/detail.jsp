<%@ page import = "java.sql.*" %>
<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>

<!DOCTYPE html>
<html>

<head>
        <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>T-shirts Detail</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />
    <link href="css/all.min.css" rel="stylesheet" />
        <link href="css/detail-style.css" rel="stylesheet" />
</head>

<body>
        <div class="container">
        <!-- Top box -->
                <!-- Logo & Site Name -->
                <div class="placeholder">
                        <div class="parallax-window" data-parallax="scroll"><img src="img/background.png" class="tm-background" />
                                <div class="tm-header">
                                        <div class="row tm-header-inner">
                                                <div class="col-md-6 col-12">
                                                        <img src="img/ksk.png" alt="Logo" class="tm-site-logo" />
                                                        <div class="tm-site-text-box">
                                                                <h1 class="tm-site-title">쿠슈크</h1>
                                                                <h6 class="tm-site-description">NEW PARADIGM OF KIOSK</h6>
                                                        </div>
                                                </div>
                                        </div>
                                </div>
                        </div>
                </div>

                <main>
                        <header class="row tm-welcome-section">
                                <h2 class="col-12 text-center tm-section-title"><b>상품 상세</b></h2>
                                <p class="col-12 text-center">상품 상세 페이지입니다.</p>
                                <p class="col-12 text-center">상품의 위치를 확인하고 싶으신 경우 페이지 하단의 <b><u> 위치 찾기</u></b> 버튼을 눌러주세요.</p>
                        </header>
<%
        String category = request.getParameter("category");
        String brand = request.getParameter("brand");
        String name = request.getParameter("name");

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/ksk";
        Connection conn = DriverManager.getConnection(url, "root", "ckddmlrhks401!");

        pstmt = conn.prepareStatement("select * from clothes where name=?");
        pstmt.setString(1, name);

        rs = pstmt.executeQuery();

        while (rs.next()) {
%>
                        <div class="tm-container-inner-2 tm-contact-section">
                                <div class="row">
                                        <div class="col-md-6">
                                                <img src = "<%= rs.getString("img") %>" alt="Image" class="img-fluid tm-gallery-img2" />
                                        </div>
                                        <div class="col-md-6">
                                                <div class="tm-address-box">
                                                        <h4 class="tm-info-title tm-text-success"><b>브랜드</b></h4>
                                                        <address>
                                                                <%= brand %>
                                                        </address>
                                                        <h4 class="tm-info-title tm-text-success"><b>이름</b></h4>
                                                        <address>
                                                                <%= name %>
                                                        </address>
                                                        <h4 class="tm-info-title tm-text-success"><b>가격</b></h4>
                                                        <address>
                                                                <%= rs.getString("price") %>
                                                        </address>
                                                        <h4 class="tm-info-title tm-text-success"><b>재고</b></h4>
                                                        <address>
                                                                <%= rs.getInt("stock") %>
                                                        </address>
                                                </div>
                                        </div>
                                <a href="#" onclick='history.go(-1); return false;' class = "button">이전으로</a>
                                <a href="map.jsp?category=<%= category %>&brand=<%= brand %>&name=<%= name %>" class="button2">위치 찾기</a>
                                </div>
                        </div>
                        <div class="tm-section tm-container-inner">
                                <div class="row">
                                        <div class="col-md-6">
                                                <figure class="tm-description-figure">
                                                        <img src="img/LOGO.png" alt="Image" class="s-logo" />
                                                </figure>
                                        </div>

                                        <div class="col-md-6">
                                                <div class="tm-description-box">
                                                        <h4 class="tm-gallery-title">NET CHALLENGE SEASON 8</h4>
                                                        <p class = "tm-mb-42">Team KSK.</p>
                                                        <p class = "tm-mb-45">S-LAND</p>
                                                        <p class = "tm-mb-45">(도로명) 서울특별시 동작구 사당로 46</p>
                                                        <p class = "tm-mb-45">(지번) 서울특별시 동작구 상도동 508-1</p>
                                                        <p class = "tm-mb-45">대표 전화 02)820-0841</p>
                                                </div>
                                        </div>
                                </div>
                        </div>
                </main>
<% } %>

                        <footer class="tm-footer text-center">
                        <p>Copyright &copy; 2021 NETCC

            | Designed by KSK</p>
                </footer>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/parallax.min.js"></script>
        <script>
                $(document).ready(function(){
                        var acc = document.getElementsByClassName("accordion");
                        var i;

                        for (i = 0; i < acc.length; i++) {
                          acc[i].addEventListener("click", function() {
                            this.classList.toggle("active");
                            var panel = this.nextElementSibling;
                            if (panel.style.maxHeight) {
                              panel.style.maxHeight = null;
                            } else {
                              panel.style.maxHeight = panel.scrollHeight + "px";
                            }
                          });
                        }
                });
        </script>
        </div>

</body>
</html>
