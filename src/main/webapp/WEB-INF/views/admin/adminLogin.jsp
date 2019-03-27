<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<style>
			body{
				margin : 50px auto;
			}
		</style>
	</head>
	<body>
		<div align="center">
			관리자 ID : <input type="password" id="pwd"><input type="button" value="확인" onclick="confirm()">
		</div>
		<script src="/controller/resources/js/jquery.js"></script>
		<script>
			function confirm(){
				$.ajax({
					url : "/controller/admin/pwcheck",
					type : "post",
					data : {"pwd" : $("#pwd").val()},
					success : function(data){
						if(data==1){
							alert("관리자 페이지로 접속합니다.");
							opener.window.open("adminMain","","height="+screen.height+" width="+screen.width+" fullscreen=yes");
							window.close();
						}else{
							alert("비밀번호가 틀렸습니다.");
						}
					},
					error : function(e){
						alert("error : "+e);
					}
				});
			}
		</script>
	</body>
</html>