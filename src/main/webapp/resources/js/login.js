
         $(function() {
        	//화면 전환
        	$("#signup").click(function() {
        		$("#first").fadeOut("fast", function() {
        			$("#second").fadeIn("fast");
        			alert("*이 있는 항목은 필수항목입니다.");
        		});
        	});
        	$("#signin").click(function() {
        		$("#second").fadeOut("fast", function() {
        			$("#first").fadeIn("fast");
        		});
        	});
        	
           //로그인 유효성검사
//           $("form[name='login']").validate({
//             rules: {
//	               email: {
//	            	   required: true,
//	            	   email: true
//	               },
//	               password: {
//	            	   required: true,
//	               }
//             },
//             messages: {
//            	   email: "Please enter a valid email address",
//            	   password: {
//            		   required: "Please enter password",
//            	   }
//             },
//             submitHandler: function(form) {
//            	    form.submit();
//             }
//           });
        	
        //무슨 이유인지 모르겠지만 바로 아래의 click 이벤트를 넣어야 적용이 된다.
        	$("#create").click(function(){
        		$("#cr").submit();
        	})
        	//회원가입 유효성검사
        	  $("form[name='registration']").validate({
        	    rules: {
	        	      id: "required",
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
        	    	  form.submit();
        	    }
        	  });
         });         