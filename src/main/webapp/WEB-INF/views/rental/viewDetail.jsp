<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      <div class="container" align="center">
        <div class="row viewDetail">

          <div class="span8">
          
			<table id="laptop_view">
				<tr>
					<th></th>
					<th colspan="2" id="firImg">이미지 </th>
					<th></th>
				</tr>
				<tr>
					<th colspan="4" id="first">모델명 : ${lv.lname }</th>
				</tr>
				<tr>
					<th>CPU</th>
					<th>${lv.cpu }</th>
					<th>화면</th>
					<th>${lv.display } 인치</th>
				</tr>
				<tr>
					<th>RAM</th>
					<th>${lv.ram }</th>
					<th>무게</th>
					<th>${lv.weight }</th>
				</tr>
				<tr>
					<th>배터리</th>
					<th>${lv.battery }</th>
					<th>재고</th>
					<th>${lv.stock } 개</th>
				</tr>
				<tr>
					<th>대여일</th>
					<th><input type="date" id="startDate"></th>
					<th>반납일</th>
					<th><input type="date" id="endDate" readonly="readonly"></th>
				</tr>
				<tr>
					<th colspan=4><font size=4 color="blue">대여료 : ${lv.price }</font></th>
				</tr>
			</table>
			<br><br>
			<table id="demand">
				<tr>
					<th colspan="2" id="first"><font size=6>요청사항</font></th>
				</tr>
				<tr>
					<th colspan="2">SSD 기본 126GB</th>
				</tr>
				<tr>
					<th>RAM</th>
					<th>
						<select id="selRam">
							<option value="0">기본</option>
							<option value="15000">4GB 추가</option>
							<option value="25000">8GB 추가</option>
							<option value="30000">12GB 추가(i3 전용)</option>
							<option value="45000">16GB 추가</option>
						</select>
					</th>
				</tr>
				<tr>
					<th>SSD</th>
					<th>
						<select id="selSsd">
							<option value="0">기본</option>
							<option value="20000">256GB</option>
							<option value="30000">512GB</option>
							<option value="50000">1TB</option>
						</select>
					</th>
				</tr>
				<tr>
					<th>수량</th>
					<th>
						<c:if test="${lv.stock > 0 }">
							<input type="number" min=0 max="${lv.stock }" value="1" id="r_count">개
						</c:if>
						<c:if test="${lv.stock == 0 }">
							<span id="stockWarring">현재 재고가 없는 상품입니다.</span>
						</c:if>
					</th>
				</tr>
				<tr>
					<th><font size=4>추가요금</font></th>
					<th><span id="addPrice">0</span>(개당)</th>
				</tr>
				<tr>
					<th colspan="2">
						<input type="button" value="대여신청" class="btn btn-warning" onclick='rental(${lv.lno}, ${lv.price }, "${lv.lname }")' id="btnRental">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="이전" class="btn btn-warning" onclick="getList('${param.kind }', '${param.field }')">
					</th>
				</tr>
			</table>

          </div>

          <div class="span4">

            <aside class="right-sidebar">

              <div class="widget">
                <form>
                  <div class="input-append">
                    <input class="span2" id="appendedInputButton" type="text" placeholder="모델명">
                    <button class="btn btn-color" type="submit">검색</button>
                  </div>
                </form>
              </div>

              <div class="widget">
              
              	<h6 onclick="priceWin()" id="priceWin">가격표</h6>

                <h5 class="widgetheading">CPU</h5>
                <ul class="cat">
                  <li><i class="icon-angle-right"></i> <a onclick="getList('cpu','i-8145U')">i3</a></li>
                  <li><i class="icon-angle-right"></i> <a onclick="getList('cpu','i-8265U')">i5</a></li>
                  <li><i class="icon-angle-right"></i> <a onclick="getList('cpu','i-8565U')">i7</a></li>
                </ul>
				
                <h5 class="widgetheading">화면크기</h5>
                <ul class="cat">
                  <li><i class="icon-angle-right"></i> <a onclick="getList('display','14')">14 인치</a></li>
                  <li><i class="icon-angle-right"></i> <a onclick="getList('display','15.6')">15.6 인치</a></li>
                  <li><i class="icon-angle-right"></i> <a onclick="getList('display','17')">17 인치</a></li>
                </ul>

              </div>
			  
            </aside>
          </div>

        </div>
	  </div>
	</section>
	<section id="secCon"></section>
	<script>
	//대여신청
	function rental(lno, price, lname){
		var total=parseInt($("#addPrice").text())+price;
		
		$.ajax({
			url : "/controller/rental/apply",
			data : {"lno" : lno,
					"totalprice" : total,
					"lname" : lname,
					"r_count" : $("#r_count").val(),
					"r_start" : $("#startDate").val(),
					"r_end" : $("#endDate").val()},
			success : function(data){
				if(confirm("신청이 완료되었습니다.\r\n대여 현황을 확인하겠습니까?")){
					location.href="/controller/support/supportMain?list=2";
				}
			},
			error : function(e){
				alert("error : "+e);
			},
			beforeSend:beforeRental
		});
	}
	
	//대여신청 유효성 검사
	function beforeRental(){
		if($("#startDate").val()==""){
			alert("대여 시작일을 선택해주세요");
			return false;
		}
		//재고초과
		if($("#r_count").val() > $("#r_count").attr("max")){
			alert("재고를 다시 확인해주세요");
			return false;
		}
		//0개 이하 신청 불가
		if($("#r_count").val() <= 0){
			alert("최소 대여 수량은 1개입니다.");
			return false;
		}
		
		//주소, 전화번호 미등록시
		if(${sessionScope.uv.tel == "--"} || ${sessionScope.uv.addr == " / "}
			|| ${empty sessionScope.uv.tel } || ${empty sessionScope.uv.addr }){
			if(confirm("주소 또는 전화번호가 등록되어 있지 않습니다.\r\n정보확인 페이지로 이동합니다")){
				location.href="/controller/support/supportMain?list=1";
			}
			return false;
		}
		
		//주소, 전화번호 미기재시 기재 페이지로 이동
	}
	</script>
</div>



