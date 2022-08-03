<%@ page import = "java.sql.*" %>
<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<!DOCTYPE html>
<html>

<head>
        <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>KSK</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400" rel="stylesheet" />
        <link href="css/templatemo-style.css" rel="stylesheet" />
</head>
<!--

Simple House

https://templatemo.com/tm-539-simple-house

-->
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
                                <h2 class="col-12 text-center tm-section-title"><b>안녕하세요. 쿠슈크에 오신 것을 환영합니다.</b></h2>
                                        <p class="col-12 text-center"><b>Hello. Welcome to the KSK.</b></p>
                        </header>

                        <div class="tm-paging-links">
                                <nav>
                                        <ul>
                                                <li class="tm-paging-item"><a href="tshirts.jsp" class="tm-paging-link">티셔츠 T-shirts</a></li>
                                                <li class="tm-paging-item"><a href="jumper_hoodie.jsp" class="tm-paging-link">맨투맨 / 후드 Jumper / Hoodie </a></li>
                                                <li class="tm-paging-item"><a href="neat_sweater.jsp" class="tm-paging-link">니트 / 스웨터 Neat / Sweater </a></li>
                                                <li class="tm-paging-item"><a href="shirts.jsp" class="tm-paging-link">셔츠  Shirts </a></li>
                                                <li class="tm-paging-item"><a href="pants_skirt.jsp" class="tm-paging-link">바지 / 치마 Pants / Skirt </a></li>
                                        </ul>
                                </nav>
                        </div>

                        <div class="tm-paging-links">
                                <nav>
                                        <ul>
                                                <li class="tm-paging-item"><a href="red.jsp" class="tm-button1"></a></li>
                                                <li class="tm-paging-item"><a href="orange.jsp" class="tm-button2"></a></li>
                                                <li class="tm-paging-item"><a href="yellow.jsp" class="tm-button3"></a></li>
                                                <li class="tm-paging-item"><a href="green.jsp" class="tm-button4"></a></li>
                                                <li class="tm-paging-item"><a href="blue.jsp" class="tm-button5"></a></li>
                                                <li class="tm-paging-item"><a href="navy.jsp" class="tm-button6"></a></li>
                                                <li class="tm-paging-item"><a href="purple.jsp" class="tm-button7"></a></li>
                                                <li class="tm-paging-item"><a href="white.jsp" class="tm-button8"></a></li>
                                                <li class="tm-paging-item"><a href="grey.jsp" class="tm-button12"></a></li>
                                                <li class="tm-paging-item"><a href="black.jsp" class="tm-button9"></a></li>
                                                <li class="tm-paging-item"><a href="pink.jsp" class="tm-button10"></a></li>
                                                <li class="tm-paging-item"><a href="brown.jsp" class="tm-button11"></a></li>
                                        </ul>
                                </nav>
                        </div>

                        <!-- Gallery -->
                        <%
                                Statement pstmt = null;
                                ResultSet rs = null;
                                Class.forName("com.mysql.jdbc.Driver");
                                String url = "jdbc:mysql://localhost:3306/ksk";
                                Connection conn = DriverManager.getConnection(url, "root", "ckddmlrhks401!");

                                pstmt = conn.createStatement();

                                if(pstmt.execute("select * from clothes where color='pink' order by readcount desc")) {
                                       rs = pstmt.getResultSet();
                                }

                         %>


                        <div class="row tm-gallery">

                        <%
                                while (rs.next()) {
                        %>
                                <!-- gallery page 1 -->
                                <div id="tm-gallery-page-pizza" class="tm-gallery-page">
                                        <article class="col-lg-3 col-md-4 col-sm-6 col-12 tm-gallery-item">
                                                <figure>
                                                        <a href = "detail.jsp?category=<%= rs.getString("category") %>&brand=<%= rs.getString("brand") %>&name=<%= rs.getString("name")%>">
                                                                <img src="<%= rs.getString("img")%>" alt="Image" class="img-fluid tm-gallery-img" />
                                                                <figcaption>
                                                                        <h4 class="tm-gallery-title"><%= rs.getString("name") %></h4>
                                                                        <p class="tm-gallery-price"><%= rs.getString("price") %></p>
                                                                </figcaption>
                                                        </a>
                                                </figure>
                                        </article>
                                </div>

                        <%
                        }
                        %>
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
                                                        <p class="tm-mb-42">Team KSK.</p>
                                                        <p class="tm-mb-45">S-LAND</p>
                                                        <p class="tm-mb-45">(도로명) 서울특별시 동작구 사당로 46</p>
                                                        <p class="tm-mb-45">(지번) 서울특별시 동작구 상도동 508-1</p>
                                                        <p class="tm-mb-45">대표 전화 02)820-0841</p>
                                                </div>
                                        </div>
                                </div>
                        </div>
                </main>

                <footer class="tm-footer text-center">
                        <p>Copyright &copy; 2021 NETCC

            | Designed by KSK</p>
                </footer>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/parallax.min.js"></script>
        <script>
                $(document).ready(function(){
                        // Handle click on paging links
                        $('.tm-paging-link').click(function(e){
                                e.preventDefault();

                                var page = $(this).text().toLowerCase();
                                $('.tm-gallery-page').addClass('hidden');
                                $('#tm-gallery-page-' + page).removeClass('hidden');
                                $('.tm-paging-link').removeClass('active');
                                $(this).addClass("active");
                        });
                });
        </script>
</body>
</html>

<%
        rs.close();
        pstmt.close();
        conn.close();

%>
