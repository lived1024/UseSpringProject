<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="callAjax" align="center">
	<section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h2>내 정보</h2>
            </div>
          </div>
          <div class="span8">
            <ul class="breadcrumb">
              <li><a href="/controller/home">Home</a> <i class="icon-angle-right"></i></li>
              <li><a href="#">고객지원</a> <i class="icon-angle-right"></i></li>
              <li class="active">내 정보</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <c:if test="${sessionScope.uv.nid == '' }">	<!-- 웹 회원 -->
		<section id="firCon">
		      <div class="container">
		        <div align="center" id="rentalDetail">
		        	<h3>웹 회원</h3>
		        	<table class="table table-striped rentalViewTable">
		        		
		        	</table>
		        </div>
		
		      </div>
	    </section>
    </c:if>
    <c:if test="${sessionScope.uv.wid == '' }">	<!-- 네이버 회원 -->
	    <section id="secCon">
		      <div class="container">
		        <div align="center" id="rentalDetail">
		        	<h3>네이버 로그인</h3>
		        	<table class="table table-striped rentalViewTable">
		        		
		        	</table>
		        </div>
		      </div>
	    </section>
    </c:if>
</div>