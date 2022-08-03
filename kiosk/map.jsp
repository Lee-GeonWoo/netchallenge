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
        <link href="css/map.css" rel="stylesheet" />
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
                                <h2 class="col-12 text-center tm-section-title"><b>상품 위치</b></h2>
                        </header>

                        <div class="tm-container-inner-2 tm-contact-section">
                                <div class="row">

                <%
                String category = request.getParameter("category");
                String brand = request.getParameter("brand");
                String name = request.getParameter("name");

                if(category.equals("t-shirts")) {
                        if(brand.equals("NIKE")) {      %>
                                <img src="img/A_tshirts.png" class="map" />
                <%
                        }
                        else if(brand.equals("THISISNEVERTHAT")) {      %>
                                <img src="img/B_tshirts.png" class="map" />
                <%      }
                        else if(brand.equals("ROMANTIC CROWN")) {       %>
                                <img src="img/C_tshirts.png" class="map" />
                <%
                        }
                        else if(brand.equals("5252")) { %>
                                <img src="img/D_tshirts.png" class="map" />
                <%
                        }
                        else if(brand.equals("PLAC")) { %>
                                <img src="img/E_tshirts.png" class="map" />
                <%      }
                }
                else if(category.equals("jumper_hoodie")) {
                        if(brand.equals("NIKE")) {      %>
                                <img src="img/A_jumper.png" class="map" />
                <%
                        }
                        else if(brand.equals("THISISNEVERTHAT")) {      %>
                                <img src="img/B_jumper.png" class="map" />
                <%      }
                        else if(brand.equals("ROMANTIC CROWN")) {       %>
                                <img src="img/C_jumper.png" class="map" />
                <%
                        }
                        else if(brand.equals("5252")) { %>
                                <img src="img/D_jumper.png" class="map" />
                <%
                        }
                        else if(brand.equals("PLAC")) { %>
                                <img src="img/E_jumper.png" class="map" />
                <%      }
                }
                else if(category.equals("neat_sweater")) {
                        if(brand.equals("LAFUDGESTORE") || brand.equals("PLAC")) {      %>
                                <img src="img/A_neat.png" class="map" />
                <%
                        }
                        else if(brand.equals("THISISNEVERTHAT")) {      %>
                                <img src="img/B_neat.png" class="map" />
                <%      }
                        else if(brand.equals("ROMANTIC CROWN")) {       %>
                                <img src="img/C_neat.png" class="map" />
                <%
                        }
                        else if(brand.equals("5252")) { %>
                                <img src="img/E_neat.png" class="map" />
                <%
                        }
                }
                else if(category.equals("shirts")) {
                        if(brand.equals("NIKE")) {      %>
                                <img src="img/A_shirts.png" class="map" />
                <%
                        }
                        else if(brand.equals("THISISNEVERTHAT")) {      %>
                                <img src="img/B_shirts.png" class="map" />
                <%      }
                        else if(brand.equals("ROMANTIC CROWN")) {       %>
                                <img src="img/C_shirts.png" class="map" />
                <%
                        }
                        else if(brand.equals("5252")) { %>
                                <img src="img/D_shirts.png" class="map" />
                <%
                        }
                        else if(brand.equals("LAFUDGESTORE") | brand.equals("PLAC")) { %>
                                <img src="img/E_shirts.png" class="map" />
                <%      }
                }
                if(category.equals("pants")) {
                        if(brand.equals("NIKE")) {      %>
                                <img src="img/A_B_pants.png" class="map" />
                <%
                        }
                        else if(brand.equals("THISISNEVERTHAT")) {      %>
                                <img src="img/A_B_pants.png" class="map" />
                <%      }
                        else if(brand.equals("ROMANTIC CROWN")) {       %>
                                <img src="img/C_D_E_pants.png" class="map" />
                <%
                        }
                        else if(brand.equals("5252")) { %>
                                <img src="img/C_D_E_pants.png" class="map" />
                <%
                        }
                        else if(brand.equals("PLAC")) { %>
                                <img src="img/C_D_E_pants.png" class="map" />
                <%      }
                }
                %>
                <%
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/ksk";
                Connection conn = DriverManager.getConnection(url, "root", "ckddmlrhks401!");

                pstmt = conn.prepareStatement("update clothes set readcount=readcount+1 where name=?");
                pstmt.setString(1, name);
                pstmt.executeUpdate();
                %>
                                        
                <a href="#" onclick='history.go(-1); return false;' class="button">이전으로</a>
        <%      if(category.equals("t-shirts")) { %>
                        <a href="tshirts.jsp" class="button2">메인으로</a>
        <%      } else if(category.equals("jumper_hoodie")) {   %>
                        <a href="jumper_hoodie.jsp" class="button2">메인으로</a>
        <%      } else if(category.equals("neat_sweater")) {    %>
                        <a href="neat_sweater.jsp" class="button2">메인으로</a>
        <%      } else if(category.equals("shirts")) {  %>
                        <a href="shirts.jsp" class="button2">메인으로</a>
        <%      } else if(category.equals("pants_skirt")) {     %>
                        <a href="pants_skirt.jsp" class="button2">메인으로</a>
        <%      }       %>
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

                <footer class = "tm-footer text-center">
                        <p>Copyright &copy; 2021 NETCC | Designed by KSK</p>
                </footer>
        </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/parallax.min.js"></script>
</body>
</html>
