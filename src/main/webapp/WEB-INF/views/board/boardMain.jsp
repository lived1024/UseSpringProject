<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <link rel="shortcut icon" href="/controller/resources/ico/favicon.png" />

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
      <%@ include file="../header.jsp" %>
    </header>
    <!-- end header -->
    
	
	<%@ include file="../board/boardList.jsp" %>
	

    <footer>
      <%@ include file="../footer.jsp" %>
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
		function writeForm(){
			window.open("writeForm","","width=700 height=700 top=100 left=500");
		}
		
		//검색, 페이지에 적용
		function showBoardList(pageNum){			
			$.ajax({
				url : "/controller/board/boardList",
				type : "get",
				data : {"pageNum" : pageNum,
						"where" : $("#where").val(),
						"field" : $("#field").val(),
						"kind" : ${list}},
				success : function(data){
					$("#resultDiv").html(data);
				},
				error : function(e){
					alert("error : " + e);
				}
			});
		}
		
		//글 내용 보기
		function boardView(b_num, pageNum, where, field){
// 			if(${empty pageNum}){
// 				pageNum=1;
// 			}
			$.ajax({
				url : "/controller/board/view",
				type : "get",
				data : {"b_num" : b_num,
						"where" : where,
						"field" : field,
						"pageNum" : pageNum},
				success : function(data){
					$("#resultDiv").html(data);
				},
				error : function(e){
					alert("error : "+e);
				}
			});
		}
		
		function deleteBoard(b_num){
			location.href="/controller/board/deleteBoard?b_num="+b_num+"&kind="+${list};
		}
		
		$(function(){
			//첫 화면 로드시 게시판 출력
			$.ajax({
				url : "/controller/board/boardList",
				type : "get",
				data : {"kind" : ${list}},
				success : function(data){
					$("#resultDiv").html(data);
				},
				error : function(e){
					alert("error : " + e);
				}
			});
		});
	</script>
</body>
</html>
