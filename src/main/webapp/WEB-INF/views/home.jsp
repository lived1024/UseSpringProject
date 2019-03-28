<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Laptop Forum</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="Your page description here" />
  <meta name="author" content="" />

  <!-- css -->
  <link href="/controller/resources/css/bootstrap.css" rel="stylesheet" />
  <link href="/controller/resources/css/bootstrap-responsive.css" rel="stylesheet" />
  <link href="/controller/resources/css/prettyPhoto.css" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <link href="/controller/resources/css/style.css?ver=1" rel="stylesheet">

  <!-- Theme skin -->
  <link id="t-colors" href="/controller/resources/color/default.css" rel="stylesheet" />

  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/controller/resourcesico/apple-touch-icon-144-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/controller/resourcesico/apple-touch-icon-114-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/controller/resourcesico/apple-touch-icon-72-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" href="/controller/resourcesico/apple-touch-icon-57-precomposed.png" />
  <link rel="shortcut icon" href="/controller/resources/ico/logo.png" />

  <!-- =======================================================
    Theme Name: Remember
    Theme URL: https://bootstrapmade.com/remember-free-multipurpose-bootstrap-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>

<body>
  <div id="wrapper">
    <!-- start header -->
    <header>
      <%@ include file="header.jsp" %>
    </header>
    <!-- end header -->

    <!-- section intro -->
    <section id="intro">
      <div class="intro-content">
        <h2>Welcome to Laptop Forum!</h2>
        <h3>Laptop Forum에 오신 것을 환영합니다!</h3>
      </div>
    </section>
    <!-- /section intro -->

    <section id="content">
      <div class="container">
      

        <div class="row">
          <div class="span12">
            <div class="row">
              <div class="span3">
                <div class="box aligncenter">
                 <label>
                  <div class="icon">
                    <span class="badge badge-info badge-circled">1</span>
                    <i class="ico icon-dropbox icon-5x"></i>
                  </div>
                  <div class="text">
                    <h4><strong>사이트 소개</strong></h4>
                  </div>
                 </label>
                </div>
              </div>

              <div class="span3">
                <div class="box aligncenter">
                 <a href="/controller/board/boardMain?list=3">
                  <div class="icon">
                    <span class="badge badge-success badge-circled">2</span>
                    <i class="ico icon-edit icon-5x"></i>
                  </div>
                  <div class="text">
                    <h4><strong>자유 게시판</strong></h4>
                  </div>
                 </a>
                </div>
              </div>
              <div class="span3">
                <div class="box aligncenter">
                 <a href="/controller/rental/main?list=3">
                  <div class="icon">
                    <span class="badge badge-warning badge-circled">3</span>
                    <i class="ico icon-5x icon-check"></i>
                  </div>
                  <div class="text">
                    <h4><strong>대여 신청</strong></h4>
                  </div>
                 </a>
                </div>
              </div>
              <div class="span3">
                <div class="box aligncenter">
               	 <a href="/controller/support/supportMain?list=1">
                  <div class="icon">
                    <span class="badge badge-important badge-circled">4</span>
                    <i class="ico icon-user icon-5x"></i>
                  </div>
                  <div class="text">
                    <h4><strong>대여 현황</strong></h4>
                  </div>
                 </a>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        
      </div>
    </section>

    <section id="offer">
      <div class="container">
        <div class="row">
          <div class="span12">
            <div class="row">
              <div class="span12">
                <div class="aligncenter">
                  <h3>IT 최신 정보</h3>
                </div>
              </div>
            </div>

            <div class="row">

<!--               <div class="span3"> -->
<!--                 <h5>Choose package and start grow</h5> -->
<!--                 <p> -->
<!--                   Per an putent audiam adolescens, mel ceteros fierent democritum te. No ubique malorum euismod usu. -->
<!--                 </p> -->
<!--                 <p> -->
<!--                   Movet facilis democritum ea quo. Est ei illum consulatu accommodare, nam dicta expetenda suavitate ad. -->
<!--                 </p> -->
<!--               </div> -->

              <div class="span3  crawlingDiv">
                <div class="pricing-box-plain">
                  <div class="heading">
                    <a href="http://www.betanews.net/"><h4>베타뉴스</h4></a>
                    최신 뉴스
                  </div>
                  <div class="action" id="betanews">
                  </div>
                </div>
              </div>

              <div class="span3 crawlingDiv">
                <div class="pricing-box-plain">
                  <div class="heading">
                    <a href="http://www.itworld.co.kr/main/"><h4>IT WORLD</h4></a>
                    최신 뉴스
                  </div>
                  <div class="action" id="itworld">
                  </div>
                </div>
              </div>

              <div class="span3 crawlingDiv">
                <div class="pricing-box-plain">
                  <div class="heading">
                    <a href="https://www.notebookcheck.net/"><h4>NotebookCheck</h4></a>
                    최신 리뷰
                  </div>
                  <div class="action" id="notebookcheck">
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>

      </div>
    </section>
    

    <footer>
      <%@ include file="footer.jsp" %>
    </footer>
  </div>
  <a href="#" class="scrollup"><i class="icon-angle-up icon-rounded icon-bglight icon-2x"></i></a>

  <!-- javascript
    ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="/controller/resources/js/jquery.js"></script>
  <script src="/controller/resources/js/jquery.easing.1.3.js"></script>
  <script src="/controller/resources/js/bootstrap.js"></script>
  <script src="/controller/resources/js/modernizr.custom.js"></script>
  <script src="/controller/resources/js/toucheffects.js"></script>
  <script src="/controller/resources/js/google-code-prettify/prettify.js"></script>
  <script src="/controller/resources/js/jquery.prettyPhoto.js"></script>
  <script src="/controller/resources/js/portfolio/jquery.quicksand.js"></script>
  <script src="/controller/resources/js/portfolio/setting.js"></script>
  <script src="/controller/resources/js/animate.js"></script>
  <!-- Template Custom JavaScript File -->
  <script src="/controller/resources/js/custom.js"></script>
  
  <!-- My script -->
	<script>
		$(function(){
			if(${msg != null}){
				alert("${msg }");
			}
			//베타뉴스
			$.ajax({
				url : "/controller/main/betanewsCrawling",
				type : "post",
				success : function(data){
					$("#betanews").html(data);
				},
				error : function(e){
					alert("베타뉴스 에러 : "+e);
				}
			});
			
			$.ajax({
				url : "/controller/main/itWorldCrawling",
				type : "post",
				success : function(data){
					$("#itworld").html(data);
				},
				error : function(e){
					alert("IT WORLD 에러 : "+e);
				}
			});
			
			$.ajax({
				url : "/controller/main/notebookcheck",
				type : "post",
				success : function(data){
					$("#notebookcheck").html(data);
				},
				error : function(e){
					alert("노트포럼 에러 : "+e);
				}
			});
		});
	</script>
</body>
</html>
