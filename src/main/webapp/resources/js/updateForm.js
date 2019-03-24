	function checkPw(){		//비밀번호 일치여부 출력
		if($("#cpw").val() != $("#pw").val()){
			$("#pwd_text").css("color","red");
			$("#pwd_text").text("비밀번호 불일치");
		}else{
			$("#pwd_text").css("color","blue");
			$("#pwd_text").text("비밀번호 일치!");
		}
	}
	
	//회원 탈퇴
	function deleteUser(){
		if(!confirm("회원 탈퇴를 진행할까요?")){
			return false;
		}
		
		$.ajax({
			url : "/controller/support/deleteUser",
			type : "post",
			success : function(data){
				if(data==1){
					alert("상품 반납 후 탈퇴할 수 있습니다.\r\n" +
							"대여 현황으로 이동합니다");
					opener.location.href="/controller/support/supportMain?list=2";
					window.close();
				}if(data==2){
					alert("탈퇴가 완료되었습니다.\r\n로그인 페이지로 이동합니다.");
					opener.location.href="/controller/user/login";
					window.close();
				}
			},
			error : function(e){
				alert(e);
			}
		})
	}

         $(function() {
    		
    		$("#pw").keyup(function(){	//비밀번호 입력시 검사창 활성화
    			$("#cpw").attr("disabled",false);
    			checkPw();
    		});
    		
    		$("#cpw").keyup(function(){	//실시간 일치여부 출력
    			checkPw();
    		});
        
        	//정보수정
        	//validate plugin은 버튼이 submit이어야 한다!
        	  $("form[name='updateMyInfo']").validate({
        	    rules: {
	        	      wid: "required",
	        	      email: {
	        	        required: true,
	        	        email: true
	        	      },
	        	      pw: {
	        	        required: true,
	        	        minlength: 5
	        	      },
	        	      name : {
	        	    	required : true
	        	      }
        	    },
        	    
        	    messages: {
	        	      id: "ID를 입력해주세요",
	        	      pw: {
	        	        required: "비밀번호를 입력해주세요",
	        	        minlength: "비밀번호는 5글자 이상입니다!"
	        	      },
	        	      email: "Email 주소를 다시 확인해주세요",
	        	      name: "이름을 입력해주세요"
        	    },
        	  
        	    submitHandler: function(form) {
        	    	//serialize를 이용하여 form의 내용을 자동변환할 수 있다!
        	    	var formData=$("#cr").serialize();
        	    	
        	    	if($("#pw").val()==$("#cpw").val()){
        	    		$.ajax({
        	    			type : "post",
        	    			url : "/controller/support/update",
        	    			data : formData,
        	    			success : function(data){
        	    				opener.location.reload();
        	    				window.close();
        	    			},
        	    			error : function(e){
        	    				alert("error : "+e);
        	    			}
        	    		});
        	    	}else{
        	    		alert("비밀번호 일치여부를 확인해주세요");
        	    		return;
        	    	}
        	    }
        	  });	
         });         