<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="callAjax" align="center">
	<section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h2>대여 신청</h2>
            </div>
          </div>
          <div class="span8">
            <ul class="breadcrumb">
              <li><a href="/controller/home">Home</a> <i class="icon-angle-right"></i></li>
              <li><a href="#">대여</a> <i class="icon-angle-right"></i></li>
              <li class="active">대여 신청</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
	<section id="firCon">
	    <section id="content">
	      <div class="container">
	        
	        <div align="center">
	<!--         	object 태그는 html5에 도입되었다!! iframe, embed가 막혀도 이용 가능! -->
	          <object type="text/html" width="80%" height="500" data="https://www.youtube.com/embed/6NtP3sxK5d4" allowfullscreen=""></object>
	        </div>
	        
	        <div class="selectBtnDiv" align="center">
	        	<input type="button" value="CPU별" class="btn btnNormal">
	            <input type="button" value="i3" class="btnSize btn-success" onclick="getList('cpu','i-8145U')">
	            <input type="button" value="i5" class="btnSize btn-success" onclick="getList('cpu','i-8265U')">
	            <input type="button" value="i7" class="btnSize btn-success" onclick="getList('cpu','i-8565U')">
	            <br><br>
	            <input type="button" value="화면크기별" class="btn btnNormal">
	            <input type="button" value="14" class="btnSize btn-primary" onclick="getList('display','14')">
	            <input type="button" value="15.6" class="btnSize btn-primary" onclick="getList('display','15.6')">
	            <input type="button" value="17" class="btnSize btn-primary" onclick="getList('display','17')">
	        </div>
	
	      </div>
	    </section>
    </section>
    <section id="secCon"></section>
</div>