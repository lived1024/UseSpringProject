<%@page import="com.myweb.service.UserService"%>
<%@page import="com.myweb.controller.UserController"%>
<%@page import="com.myweb.model.UserVO"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <%
  	String token="";	// 토큰값 다른 페이지로 넘길때 사용
    String clientId = "DuX2ugMM32hJZpdFllRL";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "kjZe5a6lbk";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8888/controller/user/callback", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
    System.out.println("state : " + state);
    System.out.println("apiURL="+apiURL);
    
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuffer res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if(responseCode==200) {
    	  // access token을 id 확인용 url로 넘겨준다! ( /checkInfo )
    	  // 여기서는 JSON -> 스트링버퍼 형태 : String형으로 변환하고 넘기기!
    	  String result=res.toString();
    	  JSONParser parser=new JSONParser();
    	  JSONObject obj=(JSONObject)parser.parse(result);
    	   token=(String)obj.get("access_token");
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  %>
</head>
<body>
<!-- 	아래 내용으로 Controller로 연결! -->
	<form action="/controller/user/checkNaverId" method="post" name="frm">
		<input type="hidden" value="<%=token %>" name="token">
	</form>
	<script>
		frm.submit();
	</script>
</body>
</html>