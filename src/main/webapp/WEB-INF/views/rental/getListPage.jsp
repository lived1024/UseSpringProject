<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <div class="container" align="center">
        <div class="row">

          <div class="span8">
			<table id="lap">
				<c:forEach items="${list}" var="arr">
					<tr>
						<td id="fir">
							이미지
						</td>
						<td>
							<table id="laptop">
									<tr>
										<th colspan="4" id="firstrow">
											<a onclick="">
												모델명 : ${arr.lname }
											</a>
										</th>
									</tr>
									<tr>
										<th>CPU</th>
										<th>${arr.cpu }</th>
										<th>화면</th>
										<th>${arr.display } inch</th>
									</tr>
									<tr>
										<th>배터리</th>
										<th>${arr.battery }</th>
										<th>무게</th>
										<th>${arr.weight }</th>
									</tr>
									<tr>
										<th colspan="4">재고 : ${arr.stock }</th>			
									</tr>
							</table>
						</td>
					</tr>
				</c:forEach>
			</table>
          </div>

          <div class="span4">

            <aside class="right-sidebar">

              <div class="widget">
                <form>
                  <div class="input-append">
                    <input class="span2" id="appendedInputButton" type="text" placeholder="Type here">
                    <button class="btn btn-color" type="submit">Search</button>
                  </div>
                </form>
              </div>

              <div class="widget">

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




