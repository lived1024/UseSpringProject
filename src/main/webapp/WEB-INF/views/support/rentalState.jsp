<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="callAjax" align="center">
	<section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h2>대여 현황</h2>
            </div>
          </div>
          <div class="span8">
            <ul class="breadcrumb">
              <li><a href="/controller/home">Home</a> <i class="icon-angle-right"></i></li>
              <li><a href="#">고객지원</a> <i class="icon-angle-right"></i></li>
              <li class="active">대여 현황</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
	<section id="firCon">
	      <div class="container">
	        <div align="center" id="rentalDetail">
	        	<table class="table table-striped rentalViewTable">
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
	        		<tbody id="rentalList">

	        		</tbody>
	        	</table>
	        </div>
	
	      </div>
    </section>
    <section id="secCon"></section>
</div>