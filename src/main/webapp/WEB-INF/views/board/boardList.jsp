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
		  <div id="resultDiv">
			<div id="boardListDiv">
		        <table class="table table-hover boardListTable">
		        	<thead>
	        			<c:if test="${list == 3 }">
			        		<tr>
			        			<th colspan="4">
			        				<input type="button" onclick="writeForm()" value="글쓰기" class="btn btn-success">
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
	        <div align="center">
	        	<form>		<!-- 검색 -->
		        	<select name="where">
		        		<option value="b_subject">제목</option>
		        	</select>
		        	<input type="text" name="field">
		        	<input type="button" value="검색">
	        	</form>
	        	<br>
	        <!-- 페이지 설정 -->
	        	<c:if test="${cri.pageNum > 1 }">
	        		<input type="button" value="≪">
	        	</c:if>
	        	<c:forEach begin="${startPage }" end="${endPage }" var="i">
	        		<c:if test="${cri.pageNum == i }">
	        			${i }
	        		</c:if>
	        		<c:if test="${cri.pageNum != i }">
	        			<input type="button" value="${i }">
	        		</c:if>
	        	</c:forEach>
	        	<c:if test="${cri.pageNum < endPage }">
	        		<input type="button" value="≫">
	        	</c:if>
	        </div>
	      </div>
		</div>
    </section>
</div>