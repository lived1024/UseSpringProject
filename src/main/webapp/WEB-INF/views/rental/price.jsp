<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link href="/controller/resources/css/bootstrap.css" rel="stylesheet" />
	<style>
		#ramPrice,#ssdPrice{
			
			border-collapse: collapse;
			width : 400px;
			height : 250px;
		}
		#ramPrice th,#ssdPrice th{
			border : 1px solid black;
		}
	</style>
</head>
<body>
	<div align="center">
		<table id="ramPrice">
			<tr>
				<th colspan=2><h2>RAM 가격</h2></th>
			</tr>
			<tr>
				<th class="tdFir">4GB</th>
				<th>15000</th>
			</tr>
			<tr>
				<th class="tdFir">8GB</th>
				<th>25000</th>
			</tr>
			<tr>
				<th class="tdFir">12GB(i3 전용)</th>
				<th>35000</th>
			</tr>
			<tr>
				<th class="tdFir">16GB</th>
				<th>45000</th>
			</tr>
		</table>
		<br>
		<p>
			<input type="button" onclick="window.close()" value="닫기" class="btn btn-danger">
		</p>
		<table id="ssdPrice">
			<tr>
				<th colspan=2><h2>SSD 가격</h2></th>
			</tr>
			<tr>
				<th class="tdFir">256GB</th>
				<th>20000</th>
			</tr>
			<tr>
				<th class="tdFir">512GB</th>
				<th>30000</th>
			</tr>
			<tr>
				<th class="tdFir">1TB</th>
				<th>50000</th>
			</tr>
		</table>
	</div>
</body>
</html>