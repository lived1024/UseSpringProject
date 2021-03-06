<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->
	
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="/controller/resources/css/login.css?ver=1">
	<script src="/controller/resources/js/updateForm.js" type="text/javascript"></script>
	<script src="/controller/resources/js/login.js" type="text/javascript"></script>
	<title>정보수정</title>
<!-- 	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> -->
	<%
    String clientId = "";
    //아래는 콜백받을 주소!
    String redirectURI = URLEncoder.encode("http://localhost:8888/controller/user/callback", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 	%>
</head>

<body>
    <div class="container">
        <div class="row">
			<div class="col-md-5 mx-auto">
			  <div id="first">
					<div class="myform form ">
						 <div class="logo mb-3">
							 <div class="col-md-12 text-center">
								<h1>Confirm</h1>
							 </div>
						</div>
                           <div class="form-group">
                              <input type="password" name="pwd"  class="form-control" id="pwd" aria-describedby="emailHelp" placeholder="Enter Your Password">
                           </div>
                           
                           <div class="col-md-12 text-center ">
<!--                            	  <input type="button" class=" btn btn-block mybtn btn-primary tx-tfm" onclick="pwCon()" id="btnCon" value="확인"> -->
                              <button type="button" class=" btn btn-block mybtn btn-primary tx-tfm" onclick="pwCon()" id="btnCon">확인</button>
                           </div>
					</div>
				</div>
			  <div id="second">
			      <div class="myform form ">
                        <div class="logo mb-3">
                           <div class="col-md-12 text-center">
                              <h1 >Infomation</h1>
                           </div>
                        </div>
                        <form action="#" name="updateMyInfo" method="post" id="cr">
                          <c:if test="${empty sessionScope.uv.nid }">
                           <div class="form-group">
                              <label for="exampleInputEmail1">ID*</label>
                              <input type="text"  name="wid" class="form-control" id="cwid" aria-describedby="emailHelp" placeholder="Enter ID" value="${sessionScope.uv.wid }" readonly="readonly">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">비밀번호*</label>
                              <input type="password" name="pw" id="pw"  class="form-control" aria-describedby="emailHelp" placeholder="Enter Password">
                           </div>
                           <div>
                              <label for="exampleInputEmail1">비밀번호 입력</label>
                              <input type="password" id="cpw"  class="form-control" aria-describedby="emailHelp" placeholder="Enter Password Again" disabled="disabled">
                              <span id="pwd_text"></span>
                           </div>
                          </c:if>
                           <br>
                           <div class="form-group">
                              <label for="exampleInputEmail1">이름*</label>
                              <input type="text" name="name"  class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name" value="${sessionScope.uv.name }">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">연령대 : </label>
                              <select name="age" aria-describedby="emailHelp" id="age">
                              	<option value=""></option>
                              	<option value="1-19">미성년자</option>
                              	<option value="20-29">20대</option>
                              	<option value="30-39">30대</option>
                              	<option value="40-49">40대</option>
                              	<option value="50-59">50대</option>
                              	<option value="60-69">60대</option>
                              	<option value="70-79">70대</option>
                              	<option value="80-89">80대</option>
                              	<option value="90-99">90대</option>
                              	<option value="100-109">100대</option>
                              	<option value="110-119">110대</option>
                              	<option value="120-129">120대</option>
                              	<option value="130-139">130대</option>
                              	<option value="140-149">140대</option>
                              	<option value="150-159">150대</option>
                              </select>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <label for="exampleInputEmail1">성별 : </label>&nbsp;&nbsp;
                              <c:if test="${empty sessionScope.uv.nid }">
	                              <input type="radio" name="gender" value="남">남자&nbsp;&nbsp;&nbsp;&nbsp;
	                              <input type="radio" name="gender" value="여">여자
                              </c:if>
                              <c:if test="${!empty sessionScope.uv.nid }">
	                              <input type="radio" name="gender" value="M">남자&nbsp;&nbsp;&nbsp;&nbsp;
	                              <input type="radio" name="gender" value="F">여자
                              </c:if>
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">Email 주소*</label>
                              <input type="text" name="email"  class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Email" value="${sessionScope.uv.email }">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">생일</label>
                              <input type="text" name="birthday"  class="form-control" id="birthday" aria-describedby="emailHelp" placeholder="월-일   Ex) 01-30" value="${sessionScope.uv.birthday }">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">전화번호</label>
                              <input type="text" name="tel1" class="tel" id="tel1">-
                              <input type="text" name="tel2" class="tel" id="tel2">-
                              <input type="text" name="tel3" class="tel" id="tel3">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">주소</label>
                              <input type="text" name="addr1"  class="form-control" id="addr1" aria-describedby="emailHelp" id="addr1">
                              <input type="text" name="addr2"  class="form-control" id="addr2" aria-describedby="emailHelp" placeholder="상세주소를 적어주세요" id="addr2">
                           </div>
                           <div class="col-md-12 text-center mb-3">
                              <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm" id="create">수정하기</button>
                           </div>
                           <c:if test="${empty sessionScope.uv.nid }">
	                           <div class="col-md-12 text-center mb-3">
	                              <button type="button" class=" btn btn-block mybtn btn-primary tx-tfm" onclick="deleteUser()">회원탈퇴</button>
	                           </div>
                           </c:if>
                        </form>
                      </div>
                     </div>
			</div>
		</div>
      </div>
	<script>
	$(function(){
		if(${sessionScope.uv.wid == ""}){
    		$("#first").hide();
    		$("#second").show();
    		
    		$("#age").val("${sessionScope.uv.age }").prop("selected",true);
    		
    		//네이버 회원은 성별이 M 또는 F로 등록되어있다.
			if(${sessionScope.uv.gender == "M"}){
				$("input:radio[name='gender']:radio[value='M']").attr("checked",true);
			}else if(${sessionScope.uv.gender == "F"}){
				$("input:radio[name='gender']:radio[value='F']").attr("checked",true);
			}
			
			var a="${sessionScope.uv.tel}";
			var tel=a.split("-");
			var tel1=tel[0];
			var tel2=tel[1];
			var tel3=tel[2];
			
			var b="${sessionScope.uv.addr}";
			var addr=b.split(" / ");
			var addr1=addr[0];
			var addr2=addr[1];
			
			$("#tel1").val(tel1);
			$("#tel2").val(tel2);
			$("#tel3").val(tel3);
			$("#addr1").val(addr1);
			$("#addr2").val(addr2); 			
    	};
	});
	
	function pwCon(){	// DB 비밀번호 검사
		//else 쓰는 순간 에러  - pass 값이 null로 넘어간다
		$.ajax({
			type : "post",
			url : "/controller/support/updateForm",
			data : {"pass" : $("#pwd").val()},
			success : function(data){
				if(data==1){
					$("#first").fadeOut("fast", function() {
						alert("대여신청시 주소와 전화번호를 입력해주셔야 합니다");
	        			$("#second").fadeIn("fast");
	        			var a="${sessionScope.uv.tel}";
	        			var tel=a.split("-");
	        			var tel1=tel[0];
	        			var tel2=tel[1];
	        			var tel3=tel[2];
	        			
	        			var b="${sessionScope.uv.addr}";
	        			var addr=b.split(" / ");
	        			var addr1=addr[0];
	        			var addr2=addr[1];
	        			
	        			$("#tel1").val(tel1);
	        			$("#tel2").val(tel2);
	        			$("#tel3").val(tel3);
	        			$("#addr1").val(addr1);
	        			$("#addr2").val(addr2);
	        			
	        			$("#age").val("${sessionScope.uv.age}").prop("selected",true);
	        			
	        			$("input:radio[name='gender']:radio[value='${sessionScope.uv.gender}']").attr("checked",true);
	        		});
					
				}else{
					alert("비밀번호가 일치하지 않습니다.");
					return;
				}
			},
			error : function(e){
				alert("error : "+e);
			}
		});
	}
	</script>
</body>
</html>