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
	
	
	<c:if test="${param.list == 1 }">
		<%@ include file="../rental/selectList.jsp" %>
	</c:if>
	<c:if test="${param.list == 2 }">
		<%@ include file="../rental/selectList.jsp" %>
	</c:if>
	<c:if test="${param.list == 3 }">
		<%@ include file="../rental/selectList.jsp" %>
	</c:if>
	<c:if test="${view == 1 }">
		<%@ include file="../rental/viewDetail.jsp" %>
	</c:if>
    


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
  <!-- 데이트피커 -->
  
  <!-- My script -->
	<script>
		function getDate(){
			var today=new Date();
			var dd=today.getDate();
			var mm=today.getMonth()+1;
			var yy=today.getFullYear();
			
			if(dd>10){	dd='0'+dd	};
			if(mm>10){	mm='0'+mm	};
			
			today=yy+"/"+mm+"/"+dd;
			alert(today);
			
		}	
	
		function getList(kind, field){
			$.ajax({
				url : "/controller/rental/getList",
				data : {"kind" : kind,
						"field" : field},
				success : function(data){
					$("#firCon").hide();
					$("#secCon").html(data);
				}
			});
		}
		
		function priceWin(){
			window.open("price","","width=500 height=650 menubar=no status=no toolbar=no left=600 top=150 location=no");
		}
		
		function rental(lno, surchange){			
			$.ajax({
				url : "/controller/rental/apply",
				data : {"lno" : lno,
						"surchange" : surchange},
				success : function(data){
					
				},
				error : function(e){
					alert("error : "+e);
				}
			});
		}
		
		$(function(){
			$("#startDate").change(function(){
				//시작날짜 제한
				var today=new Date();
				var dd=today.getDate();
				var mm=today.getMonth()+1;
				var yy=today.getFullYear();
				
				if(dd<10){	dd='0'+dd	};
				if(mm<10){	mm='0'+mm	};
				
				today=yy+"-"+mm+"-"+dd;
				
				$("#startDate").attr("min",today);
				//
				var endDay=new Date();
				var emm=endDay.getMonth()+2;
				
				if(emm<10){	emm='0'+emm	};
				
				if(emm>12){
					emm=emm-12;
					yy=yy+1;
				}
				
				if(emm%12==4 || emm%12==6 || emm%12==9 || emm%12==11){	//한 달이 30일
					if(dd>30){
						dd=dd-30;
						emm=emm+1;
					}
				}else if(emm%12==2){	//2월
					if(dd>28){
						dd=dd-28;
						emm=emm+1;
					}
				}
				
				if(dd<10){	dd='0'+dd	};
				
				var endDate=yy+"-"+emm+"-"+dd;
				
				$("#endDate").attr("max",endDate);
				$("#endDate").attr("min",$("#startDate").val());
				
			});
			
			
			
			
			$("#endDate").click(function(){
// 				alert("대여기간은 최대 1달입니다.");
			});
			
			$("#selRam").change(function(){
				var ram=parseInt($("#selRam option:selected").val());
				var ssd=parseInt($("#selSsd option:selected").val());
				$("#addPrice").text(ram+ssd);
			});
			$("#selSsd").change(function(){
				var ram=parseInt($("#selRam option:selected").val());
				var ssd=parseInt($("#selSsd option:selected").val());
				$("#addPrice").text(ram+ssd);
			})
		});
	</script>
</body>
</html>
