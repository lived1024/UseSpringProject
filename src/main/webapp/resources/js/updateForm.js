	function checkPw(){		//비밀번호 일치여부 출력
		if($("#cpw").val() != $("#pw").val()){
			$("#pwd_text").css("color","red");
			$("#pwd_text").text("비밀번호 불일치");
		}else{
			$("#pwd_text").css("color","blue");
			$("#pwd_text").text("비밀번호 일치!");
		}
	}

         $(function() {
    		
    		$("#pw").keyup(function(){	//비밀번호 입력시 검사창 활성화
    			$("#cpw").attr("disabled",false);
    			checkPw();
    		});
    		
    		$("#cpw").keyup(function(){	//실시간 일치여부 출력
    			checkPw();
    		});
        
        	//회원가입 유효성검사
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