<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>관리자 페이지</title>
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
	<table id="rentalProcess" class="table">
		<thead>
	        <tr>
	        	<th>모델명</th>
				<th>개수</th>
				<th>대여 시작일</th>
				<th>반납일</th>
				<th>총 가격</th>
				<th>현재 상태</th>
				<th></th>
	        </tr>
		</thead>
		<tbody id="rentalResult">

		</tbody>
	</table>
	<script src="/controller/resources/js/jquery.js"></script>
	<script>
		$(function(){
			if(${empty sessionScope.admin}){
				alert("관리자로 접속하지 않으셨습니다");
				location.href="/controller/user/login";
			}
			
			$.ajax({
				url : "/controller/admin/rentalList",
				type : "post",
				success : function(data){
					$("#rentalResult").html(data);
				},
				error : function(e){
					alert("error : "+e);
				}
			});
		});
		
		function conCancel(rno){
			if(confirm("취소 처리를 완료하시겠습니까?")){
				$.ajax({
					url : "/controller/admin/confirmCancel",
					type : "post",
					data : {"rno" : rno},
					success : function(data){
						location.reload();
					},
					error : function(e){
						alert("error : "+e);
					}
				});
			}
		}
		
		function Raccept(rno){
			if(confirm("제품이 준비 되었나요?")){
				$.ajax({
					url : "/controller/admin/accept",
					type : "post",
					data : {"rno" : rno},
					success : function(data){
						location.reload();
					},
					error : function(e){
						alert("error : "+e);
					}
				});
			}
		}
		
		function Rconfirm(rno){
			if(confirm("고객님께서 제품을 수령했습니까?")){
				$.ajax({
					url : "/controller/admin/rconfirm",
					type : "post",
					data : {"rno" : rno},
					success : function(data){
						location.reload();
					},
					error : function(e){
						alert("error : "+e);
					}
				});
			}
		}
	</script>
</body>
</html>
