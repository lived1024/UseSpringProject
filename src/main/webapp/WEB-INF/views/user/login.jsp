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
	<script src="/controller/resources/js/login.js" type="text/javascript"></script>
	<%
    String clientId = "DuX2ugMM32hJZpdFllRL";
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
								<h1>Login</h1>
							 </div>
						</div>
        	            <form action="/controller/user/login" method="post" name="login">
                           <div class="form-group">
                              <label for="exampleInputEmail1">ID 입력</label>
                              <input type="text" name="wid"  class="form-control" id="wid" aria-describedby="emailHelp" placeholder="Enter Your ID">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">비밀번호 입력</label>
                              <input type="password" name="pwd" id="pwd"  class="form-control" aria-describedby="emailHelp" placeholder="Enter Password">
                           </div>
                           <div class="form-group">
                              <p class="text-center">가입하시면 <a href="#">이용 약관</a>에 동의하게 됩니다</p>
                           </div>
                           <div class="col-md-12 text-center ">
                              <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">Login</button>
                           </div>
                           <div class="col-md-12 ">
                              <div class="login-or">
                                 <hr class="hr-or">
                              </div>
                           </div>
                           <div class="col-md-12 mb-3">
                              <p class="text-center">
                                <a href="<%=apiURL%>">
                                	<img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/>
                                </a>
                              </p>
                           </div>
                           <div class="form-group">
                              <p class="text-center"><a href="#" id="signup">회원가입</a></p>
                           </div>
                        </form>
					</div>
				</div>
			  <div id="second">
			      <div class="myform form ">
                        <div class="logo mb-3">
                           <div class="col-md-12 text-center">
                              <h1 >Sign up</h1>
                           </div>
                        </div>
                        <form action="/controller/user/create" name="registration" method="post" id="cr">
                           <div class="form-group">
                              <label for="exampleInputEmail1">ID*</label>
                              <input type="text"  name="id" class="form-control" id="id" aria-describedby="emailHelp" placeholder="Enter ID">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">비밀번호*</label>
                              <input type="password" name="pw" id="pw"  class="form-control" aria-describedby="emailHelp" placeholder="Enter Password">
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
                              <input type="radio" name="gender" value="남" checked="checked">남자&nbsp;&nbsp;&nbsp;&nbsp;
                              <input type="radio" name="gender" value="여">여자
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">Email 주소*</label>
                              <input type="text" name="email"  class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Email">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">이름*</label>
                              <input type="text" name="name"  class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">생일</label>
                              <input type="text" name="birthday"  class="form-control" id="birthday" aria-describedby="emailHelp" placeholder="월-일   Ex) 01-30">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">전화번호</label>
                              <input type="text" name="tel1" class="tel" >-
                              <input type="text" name="tel2" class="tel" >-
                              <input type="text" name="tel3" class="tel" >
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">주소</label>
                              <input type="text" name="addr1"  class="form-control" id="addr1" aria-describedby="emailHelp">
                              <input type="text" name="addr2"  class="form-control" id="addr2" aria-describedby="emailHelp" placeholder="상세주소를 적어주세요">
                           </div>
                           <div class="col-md-12 text-center mb-3">
                              <button type="button" class=" btn btn-block mybtn btn-primary tx-tfm" id="create">시작하기</button>
                           </div>
                           <div class="col-md-12 ">
                              <div class="form-group">
                                 <p class="text-center"><a href="#" id="signin">로그인으로 돌아가기</a></p>
                              </div>
                           </div>
                        </form>
                      </div>
                     </div>
			</div>
		</div>
      </div>
</body>
</html>