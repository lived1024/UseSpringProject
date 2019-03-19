<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<table id="lap">
		<tr>
			<td id="fir">
				이미지
			</td>
			<td>
				<table id="laptop">
					<c:forEach items="list" var="arr">
						<tr>
							<th colspan="4">모델명 : ${arr.lname }</th>
						</tr>
						<tr>
							<td colspan="4"></td>
						</tr>
						<tr>
							<th>CPU</th>
							<th>${arr.cpu }</th>
							<th>화면</th>
							<th>${arr.display }</th>
						</tr>
						<tr>
							<th>RAM</th>
							<th>${arr.ram }</th>
							<th>무게</th>
							<th>${arr.weight }</th>
						</tr>
						<tr>
							<th>배터리</th>
							<th>${arr.battery }</th>
							<th>가격</th>
							<th>${arr.price }</th>
						</tr>
						<tr>
							<th colspan="4">재고 : ${arr.stock }</th>			
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>