<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>자유 게시판</h2>
  <p>회원 탈퇴 이후에도 게시글은 삭제되지 않습니다.<br>바른말 고운말을 사용해주세요</p>
<!--   <form action="/controller/board/writeForm" method="post" enctype="multipart/form-data"> -->
  <form action="#" method="post"  id="wr" >
    <div class="form-group">
      <label for="inputdefault">제목</label>
      <input class="form-control" type="text" name="b_subject" id="b_subject">
    </div>
    <div class="form-group">
      <label for="inputlg">내용</label><br>
      <textarea rows="10" cols="90" name="b_content" id="b_content"></textarea>
    </div>
    <div class="form-group">
      <label for="inputlg">첨부이미지</label><br>
      <input type="file" name="b_file" id="b_file">
    </div>
    <div class="form-group" align="center">
<!--       <input type="submit" value="작성완료"> -->
      <input type="button" value="작성완료" id="write" class="btn btn-primary">
      <input type="reset" value="재작성" class="btn btn-primary">
    </div>
  </form>
</div>
<script>
	$(function(){
		
		$("#write").click(function(){
			//가상의 form 태그를 생성!
			var formData=new FormData();
			
			// input type="file"은 배열로 생성된다.
			// 따라서 아래처럼 배열에 대해 꼭 적어줘야 값을 찾아가니 주의할 것!!
			var b_file=$("input[name='b_file']")[0].files[0];
			
			//가상의 form 태그에 HashMap처럼 key값과 value값을 설정해준다
			formData.append("b_file",b_file);
			formData.append("b_subject",$("#b_subject").val());
			formData.append("b_content",$("#b_content").val());
			formData.append("b_kind",3);
			
			//ajax에서 data로 가상의 form 태그를 넘긴다
			//이때 processData 와 contentType을 false로 꼭 지정해줘야한다!
			$.ajax({ 
				url : "/controller/board/writeForm",
				processData : false,
				contentType : false,
				type : "post",
				data :  formData,
				success : function(data){
					alert("정상적으로 등록되었습니다");
					opener.location.reload();
					window.close();
				},
				error : function(e){
					alert("error : "+e);
				}
			});
		});
	});
</script>
</body>
</html>
