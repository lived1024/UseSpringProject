<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="top">
        <div class="container">
          <div class="row">
            <div class="span6">
              <ul class="topmenu">
                <li><a href="/controller/home">Home</a> &#47;</li>
                <li><a href="#">약관</a> &#47;</li>
                <li><a href="#">정책</a></li>
              </ul>
            </div>
            <div class="span6">
			  
              <ul class="social-network">
                <li><a href="#" data-placement="bottom" title="Facebook"><i class="icon-circled icon-bglight icon-facebook"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Twitter"><i class="icon-circled icon-bglight icon-twitter"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Linkedin"><i class="icon-circled icon-linkedin icon-bglight"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Pinterest"><i class="icon-circled icon-pinterest  icon-bglight"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Google +"><i class="icon-circled icon-google-plus icon-bglight"></i></a></li>
                <li><a href="#" data-placement="bottom" title="로그아웃"><i class="icon-bglight" id="logout">로그아웃</i></a></li>
              </ul>

            </div>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row nomargin">
          <div class="span4">
            <div class="logo">
              <h1><a href="/controller/home"><img src="/controller/resources/ico/logo.png"></a></h1>
            </div>
          </div>
          <div class="span8">
            <div class="navbar navbar-static-top">
              <div class="navigation">
                <nav>
                  <ul class="nav topnav">
                    <li class="active">
                      <a href="/controller/home">Home</a>
                    </li>
                    <li class="dropdown">
                      <a href="#">소개 <i class="icon-angle-down"></i></a>
                      <ul class="dropdown-menu">
                        <li><a href="#">운영 목적</a></li>
                        <li><a href="#">운영진</a></li>
                      </ul>
                    </li>
                    <li class="dropdown">
                      <a href="#">리뷰 및 후기 <i class="icon-angle-down"></i></a>
                      <ul class="dropdown-menu">
                        <li><a href="#">노트북 리뷰</a></li>
                        <li><a href="#">AS 후기</a></li>
                        <li><a href="#">대여 후기</a></li>
                      </ul>
                    </li>
                    <li class="dropdown">
                      <a href="#">대여 <i class="icon-angle-down"></i></a>
                      <ul class="dropdown-menu">
                        <li><a href="#">시스템 소개</a></li>
                        <li><a href="#">대여 방법</a></li>
                        <li><a href="/controller/rental/main?list=3">대여 신청</a></li>
                      </ul>
                    </li>
                    <li class="dropdown">
                      <a href="#">커뮤니티 <i class="icon-angle-down"></i></a>
                      <ul class="dropdown-menu">
                        <li><a href="/controller/board/boardMain?list=1">공지사항</a></li>
                        <li><a href="/controller/board/boardMain?list=2">관련 뉴스</a></li> <!-- 크롤링 뉴스 이용 예정 -->
                        <li><a href="/controller/board/boardMain?list=3">자유 게시판</a></li>
                      </ul>
                    </li>
                    <li class="dropdown">
                      <a href="#">고객지원<i class="icon-angle-down"></i></a>
                      <ul class="dropdown-menu">
                        <li><a href="/controller/support/supportMain?list=1">내 정보</a></li>
                        <li><a href="/controller/support/supportMain?list=2">대여 현황</a></li>
                      </ul>
                    </li>
                  </ul>
                </nav>
              </div>
              <!-- end navigation -->
            </div>
          </div>
        </div>
      </div>
      <script src = "https://code.jquery.com/jquery-3.3.1.min.js"></script>
      <script>
      	$(function(){
      		$("#logout").click(function(){      			 
      			if(${sessionScope.uv.nid != null && sessionScope.uv.nid != ""}){
      				alert("네이버 로그인은 네이버 홈페이지에서 로그아웃이 가능합니다.\r\n"
    					 +"네이버 메인페이지로 이동합니다.");
      			}
      			location.href="/controller/user/logout";
      		});
      		
      		// 로그인 하지 않고 강제로 url 입력한다면,,
     		if(${empty sessionScope.uv }){
     			location.href="/controller/user/login";
     		}
      	});
      </script>