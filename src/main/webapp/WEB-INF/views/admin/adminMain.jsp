<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head></head>
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
						alert(data);
					},
					error : function(e){
						alert("error : "+e);
					}
				});
			}
		</script>
	</body>
</html>