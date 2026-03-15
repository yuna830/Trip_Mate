<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String error = request.getParameter("error");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	* {
	  box-sizing: border-box;
	} 

	html, body{
		height: 100%;
	}
	
	body {
		margin: 0; 
		background-color: #f6f6f6; 
		font-family: Arial, sans-serif;
		color: #111; 
	}
	
	main.wrap{
		max-width: 750px;
		margin: 0 auto;
		padding: 0 18px;
		background-color: #fff;
		min-height: 100%;
	}
	
	.registerPanel{
		max-width: 720px;
		margin: 0 auto;
		padding: 36px 34px 28px; 
		position: relative; 
	}
	
	.backBtn{
		position: absolute;  
		top: 10px;
		left: 0; 
		text-decoration: none;
		color: #111;
		font-size: 30px;
		line-height: 1;   
		padding: 6px 8px;
		border-radius: 10px;
	} 
	
	.backBtn:hover {
      	background-color: #f3f3f3;
      	text-decoration: none;
    }
	
	.logo{
		display:flex;
		justify-content:center;
		padding:0 0 30px;
	}
	
	.title{
		margin-top:30px;
		font-size:35px;
		font-weight:800;
		font-weight:800;
	}
	
	.formTop{
		display:flex;
		justify-content:flex-end;
		align-items:center;
		margin-bottom:12px;
		font-size:13px;
		color:#666;
	}
	
	.requiredMark{
		color:#ff6b81;
		font-weight:600;
		margin-left:2px;
	}
	
	#registerForm{
		width:100%;
	}
	
	.row{
		display:flex;
		align-items:flex-start;
		gap:12px;
		margin-bottom:25px;
	}
	
	.row > label{
		width:120px;
		height:54px;
		line-height:54px;
		font-weight:700;
		font-size:16px;
		color:#222;
		flex-shrink:0;
	}
	
	.inputWrap{
		flex:1;
	}
	
	#registerForm input{
		width:100%;
		height:54px;
		border-radius:10px;
		border:1px solid #ddd;
		font-size:14px;
		padding-left:10px;
	}
	
	#registerForm input:focus{
		border-color:#ff6b81;
	}
	
	#userName,
	#userEmail,
	#userPassword,
	#reUserPassword{
		width:100%;
		height:54px;
		padding:10px 12px;
		border:1px solid #d9d9d9;
		border-radius:10px;
		font-size:15px;
		background:#fff;
	}
	
	#userName:focus,
	#userEmail:focus,
	#userPassword:focus,
	#reUserPassword:focus{
		outline:none;
		border-color:#111;
	}
	
	.helpText{
		margin:8px 0 0;
		font-size:13px;
		color:#777;
	}
	
	.errorText{
		margin:8px 0 0;
		font-size:13px;
		color:#e53935;
	}
	
	.registerBtn{
		width:100%;
		height:54px;
		border:none;
		border-radius:20px;
		background-color:#f2f2f2;
		font-size:15px;
		font-weight:600;
		margin-top:10px;
	}
	
	.registerBtn:hover{
		background-color:#ff6b81;
	}
	
	.registerBtn:active{
		background-color:#ff6b81;
	}
	
	.bottomArea{
		margin-top:20px;
		text-align:center;
		font-size:14px;
		color:#666;
	}
	
	.bottomArea a{
		text-decoration:none;
		color:#ff6b81;
		font-weight:700;
		margin-left:6px;
	}
	
	.bottomArea a:hover{
		text-decoration:underline;
	}
	
</style>
<title>Tour</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	
	function check(){
		
		const registerForm = document.forms["registerForm"];
		
		// 이름
		if (registerForm.userName.value == ""){
			alert("이름 누락");
			registerForm.userName.focus();
			return false;
		}
		
		// 이메일 
		if (registerForm.userEmail.value == ""){
			alert("이메일 누락");
			registerForm.userEmail.focus();
			return false;
		}
		
		// 비밀번호  
		if (registerForm.userPassword.value == ""){
			alert("비밀번호 누락");
			registerForm.userPassword.focus();
			return false;
		}
		
		// 비밀번호는 5 ~ 8글자 사이 // 숫자만 가능 
		if (registerForm.userPassword.value.length < 5 || registerForm.userPassword.value.length > 8){
			alert("비밀번호는 5 ~ 8 글자 사이");
			registerForm.userPassword.select();
			return false;
		}
		
		if (isNaN(Number(registerForm.userPassword.value))){
			alert("비밀번호는 숫자만 입력");
			registerForm.userPassword.select();
			return false;
		}
		
		// 비밀번호 확인 
		if (registerForm.reUserPassword.value == ""){
			alert("비밀번호 누락");
			registerForm.reUserPassword.focus();
			return false;
		}
		
		if (registerForm.reUserPassword.value.length < 5 || registerForm.reUserPassword.value.length > 8){
			alert("비밀번호는 5 ~ 8 글자 사이");
			registerForm.reUserPassword.select();
			return false;
		}
		
		if (isNaN(Number(registerForm.reUserPassword.value))){
			alert("비밀번호는 숫자만 입력");
			registerForm.reUserPassword.select();
			return false;
		}
		
		return true;
	} 
</script>
</head>

<body>
	<main class="wrap">
		<div class="registerPanel">
			<a href="Tour.jsp" class="backBtn">←</a>
			<section class="logo">
			  <h1 class="title">회원가입</h1>
			</section>
			
			<div class="formTop">
				<span><span class="requireMark">*</span>필수입력사항</span>
			</div>
			
			<section class="card">
				<form name="registerForm" id="registerForm" action="RegisterProcess.jsp" method="post" onsubmit="return check();">
					<div class="row">
						<label for="userName"><span class="requiredMark">*</span>이름</label>
						<div class="inputWrap">
							<input type="text" name="userName" id="userName" >
						</div>
					</div>
					
					<div class="row">
						<label for="userEmail"><span class="requiredMark">*</span>이메일</label>
						<div class="inputWrap">
							<input type="email" name="userEmail" id="userEmail">
							<p class="helpText">로그인에 사용할 이메일을 입력해주세요</p>
						</div>
					</div>
					
					<div class="row">
						<label for="userPassword"><span class="requiredMark">*</span>비밀번호</label>
						<div class="inputWrap">
							<input type="password" name="userPassword" id="userPassword">
							<p class="helpText">숫자 5 ~ 8자리로 입력해주세요</p>
						</div>
					</div>
					
					<div class="row">
						<label>비밀번호 확인</label>
						<div class="inputWrap">
							<input type="password" name="reUserPassword" id="reUserPassword">
							<% 
								if (error != null){
							%>
									<p class="errorText">입력값이 올바르지 않습니다</p>
							<%
								}
							%>
						</div>
					</div>
					
					<button type="submit" class="registerBtn">회원가입</button>
				</form>
			</section>
			
			<div class="bottomArea">
				이미 계정이 있으신가요?
				<a href="Login.jsp">로그인</a>
			</div>
		</div>
	</main>
	
</body>
</html>
