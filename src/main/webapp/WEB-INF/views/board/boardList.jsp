<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="callAjax" align="center">
	<section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <c:choose>
              	<c:when test="${list == 1 }">
	              <h2>공지사항</h2>
              	</c:when>
              	<c:when test="${list == 2 }">
	              <h2>관련 뉴스</h2>
              	</c:when>
              	<c:when test="${list == 3 }">
	              <h2>자유게시판</h2>
              	</c:when>
              </c:choose>              	
            </div>
          </div>
          <div class="span8">
            <ul class="breadcrumb">
              <li><a href="/controller/home">Home</a> <i class="icon-angle-right"></i></li>
              <li><a href="#">커뮤니티</a> <i class="icon-angle-right"></i></li>
              <c:choose>
	              <c:when test="${list == 1 }">
	              	<li class="active">공지사항</li>
	              </c:when>
	              <c:when test="${list == 2 }">
	              	<li class="active">관련 뉴스</li>
	              </c:when>
	              <c:when test="${list == 3 }">
	              	<li class="active">자유게시판</li>
	              </c:when>
              </c:choose>
            </ul>
          </div>
        </div>
      </div>
    </section>
	<section id="firCon">
		<div class="container">
			<div id="boardListDiv">
		        <table class="table table-hover boardListTable">
		        	<thead>
	        			<c:if test="${list == 3 }">
			        		<tr>
			        			<th colspan="4">
			        				<input type="button" onclick="writeForm()" value="글쓰기">
			        			</th>
			        		</tr>
	        			</c:if>
			        	<tr>
			        		<th class="boardFirst">번호</th>
							<th class="boardSecond">제목</th>
							<th class="boardThird">작성자</th>
							<th class="boardFour">작성일</th>
							<th class="boardFive">조회수</th>
			        	</tr>
		        	</thead>
		        	<tbody id="boardTBody"></tbody>

		        </table>
	        </div>
		</div>
    </section>
</div>