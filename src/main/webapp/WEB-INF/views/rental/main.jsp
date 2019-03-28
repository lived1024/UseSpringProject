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
      <%@ include file="../header.jsp" %>
    </header>
    <!-- end header -->
	
	
	<c:if test="${param.list == 1 }">
		
	</c:if>
	<c:if test="${param.list == 2 }">
		
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
  
  <!-- My script -->
	<script>
		//상품 리스트
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
		
		//가격표
		function priceWin(){
			window.open("price","","width=500 height=650 menubar=no status=no toolbar=no left=600 top=150 location=no");
		}
		
		//대여신청
		function rental(lno, price, lname){
			var total=parseInt($("#addPrice").text())+price;
			
			$.ajax({
				url : "/controller/rental/apply",
				data : {"lno" : lno,
						"totalprice" : total,
						"lname" : lname,
						"r_count" : $("#r_count").val(),
						"r_start" : $("#startDate").val(),
						"r_end" : $("#endDate").val()},
				success : function(data){
					if(confirm("신청이 완료되었습니다.\r\n대여 현황을 확인하겠습니까?")){
						location.href="/controller/support/supportMain?list=2";
					}
				},
				error : function(e){
					alert("error : "+e);
				},
				beforeSend:beforeRental
			});
		}
		
		//대여신청 유효성 검사
		function beforeRental(){
			if($("#startDate").val()==""){
				alert("대여 시작일을 선택해주세요");
				return false;
			}
			//재고초과
			if($("#r_count").val() > $("#r_count").attr("max")){
				alert("재고를 다시 확인해주세요");
				return false;
			}
			//0개 이하 신청 불가
			if($("#r_count").val() <= 0){
				alert("최소 대여 수량은 1개입니다.");
				return false;
			}
			
			//주소, 전화번호 미등록시
			if(${sessionScope.uv.tel == "--"} || ${sessionScope.uv.addr == " / "}
				|| ${empty sessionScope.uv.tel } || ${empty sessionScope.uv.addr }){
				if(confirm("주소 또는 전화번호가 등록되어 있지 않습니다.\r\n정보확인 페이지로 이동합니다")){
					location.href="/controller/support/supportMain?list=1";
				}
				return false;
			}
			
			//주소, 전화번호 미기재시 기재 페이지로 이동
		}
		
		$(function(){
			//노트북 재고가 0일때 버튼 비활성화
			if(${lv.stock == 0}){
				$("#btnRental").attr("disabled",true);
			}
			
			$("#startDate").click(function(){
				//시작날짜 제한
				var today=new Date();
				var dd=today.getDate();
				var mm=today.getMonth()+1;
				var yy=today.getFullYear();
				
				if(dd<10){	dd='0'+dd	};
				if(mm<10){	mm='0'+mm	};
				
				today=yy+"-"+mm+"-"+dd;
				
				$("#startDate").attr("min",today);
			});
			
			$("#startDate").change(function(){
				//종료날짜 설정 - 기간 : 15일
				var sel=$("#startDate").val();
				var selDate=sel.split("-");
				var selYear=parseInt(selDate[0]);
				var selMon=parseInt(selDate[1]);
				var selDay=parseInt(selDate[2])+15;
				
				if(selMon%12==4 || selMon%12==6 || selMon%12==9 || selMon%12==11){	//한 달이 30일
					if(selDay>30){
						selDay=selDay-30;
						selMon=selMon+1;
					}
				}else if(selMon%12==2){	//2월
					if(selDay>28){
						selDay=selDay-28;
						selMon=selMon+1;
					}
				}else{
					if(selDay>31){
						selDay=selDay-31;
						selMon=selMon+1;
					}
				}
				
				if(selMon>12){
					selMon=selMon-12;
					selYear=selYear+1;
				}
				
				if(selDay<10){	selDay='0'+selDay	};
				if(selMon<10){	selMon='0'+selMon	};
				
				var endDate=selYear+"-"+selMon+"-"+selDay;
				
				$("#endDate").val(endDate);
			});
			
			//추가요금 계산, 출력
			$("#selRam").change(function(){
				var ram=parseInt($("#selRam option:selected").val());
				var ssd=parseInt($("#selSsd option:selected").val());
				$("#addPrice").text(ram+ssd);
			});
			$("#selSsd").change(function(){
				var ram=parseInt($("#selRam option:selected").val());
				var ssd=parseInt($("#selSsd option:selected").val())
				$("#addPrice").text(ram+ssd);
			})
		});
	</script>
</body>
</html>
