<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	.userPanel{
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
	
	.title{
		display:flex; 
		justify-content: center;
		padding: 0 0 30px;
	}
	
	.logoTitle{
		margin-top: 30px; 
		font-size: 35px;
		font-weight: 800;
	}
	 
	#UserForm{
		width: 100%;
	}
	 
	.row{
		display: flex;
		align-items: center;
		gap: 12px;
		margin-bottom: 25px;
	}
	
	.row > label{
		width: 120px;
		font-weight: 700;
		font-size: 18px;
		color: #222;
	}
	
	label{
	  	display: inline-block;
	  	width: 120px;
	  	font-weight: bold;
		font-size: 18px;
	}	
	
	#UserForm input{
		width: 100%; 
		height: 54px;
		border-radius: 10px; 
		border: 1px solid #ddd;
		font-size: 15px;
		padding-left: 10px;  
	}
	
	#UserForm input:focus{
  		border-color:#ff6b81;
	}
	
	#userName,
	#userEmail,
	#userPassword,
	#userAge,
	#userRegion, 
	select{
		width: 100%;
		height: 54px;
		padding: 10px 12px;
	 	border: 1px solid #d9d9d9;
		border-radius: 10px;
	  	font-size: 15px;
	  	background: #fff;
	}
	
	#userName:focus, 
	#userEmail:focus,
	#userPassword:focus,
	#userAge:focus,
	#userRegion:focus,
	select:focus{
		outline: none;
		border-color: #111;
	}
	
	.row input[type="radio"] {
		margin-left: 8px;
		margin-right: 6px;
		margin-top: 3px;
		transform: scale(1.5);
	}
	
	.row:last-child{
		display: flex;
		justify-content: space-between; 
	  	margin-top: 10px;
	}
	
	#ok,
	#cancel{
		margin-top: 20px;
	  	width: 70px;                   
	  	height: 40px;
	  	border: none;
	  	border-radius: 6px;
	  	background-color: #bfbfbf;      
	  	color: white;
	  	font-size: 14px;
	  	cursor: pointer;
	}
	
	#ok:hover,
	#cancel:hover{
		background-color: #ff6b81;
	}
	
	#ok:hover,
	#cancel:active{
		background-color: #ff6b81;
	}
	
	
</style>
<title>Tour</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	
	function check(){
		
		const userForm = document.forms["userForm"];
		
		if (userForm.userName.value == ""){
			alert("이름 누락");
			userForm.userName.focus();
			return false;
		}
		
		if (userForm.userEmail.value == ""){
			alert("이메일 누락");
			userForm.userEmail.focus();
			return false;
		}
		
		if (userForm.userPassword.value == ""){
			alert("비밀번호 누락");
			userForm.userPassword.focus();
			return false;
		}
		
		// 비밀번호는 5 ~ 8글자 사이 // 숫자만 가능 
		if (userForm.userPassword.value.length < 5 || userForm.userPassword.value.length > 8){
			alert("비밀번호는 5 ~ 8 글자 사이");
			userForm.userPassword.select();
			return false;
		}
		
		if (isNaN(Number(userForm.userPassword.value))){
			alert("비밀번호는 숫자만 입력");
			userForm.userPassword.select();
			return false;
		}
		
		const gender_len = document.userForm.userGender.length;
		let flag = false;
	
		for (let i=0; i<gender_len; i++){
			if (userForm.userGender[i].checked){
				flag = true;
				break;
			}
		}
		
		if (flag == false){
			alert('성별 하나는 선택');
			return false;
		}
		
		const index = userForm.userAge.selectedIndex;
		
		if (index == 0){
			alert('나이 하나는 선택');
			return false;
		}
		
		const region = userForm.userRegion.selectedIndex;
		
		if (region == 0){
			alert('지역 하나는 선택');
			return false;
		}
		
		flag = false;
		
		frequency_len = userForm.frequency.length;
		
		for (let i=0; i<frequency_len; i++){
			if (userForm.frequency[i].checked){
				flag = true;
				break;
			}
		}
		
		if (flag == false){
			alert('여행 빈도 하나는 선택');
			return false;
		}
		
		
		return true;
		
		
	} 
</script>
</head>

<body>
	<main class="wrap">
		<div class="userPanel">
			<a href="Tour.jsp" class="backBtn">←</a>
			<section class="logo">
			  <h1 class="title">사용자 정보</h1>
			</section>
			
			<section class="card">
				<form name="userForm" id="userForm" action="register.jsp" method="post">
					<div class="row">
						<label>이름</label>
						<input type="text" name="userName" id="userName" >
					</div>
					
					<div class="row">
						<label>이메일</label>
						<input type="email" name="userEmail" id="userEmail">
					</div>
					
					<div class="row">
						<label>비밀번호</label>
						<input type="password" name="userPassword" id="userPassword">
					</div>
					
					<div class="row">
						<label>성별</label>
						<input type="radio" name="userGender" value="Male">남
						<input type="radio" name="userGender" value="Female">여
					</div>
					
					<div class="row">
						<label>나이</label>
						<select name="userAge" id="userAge">
							<option>선택</option>
							<option>10대</option>
							<option>20대</option>
							<option>30대</option>
							<option>40대</option>
							<option>50대</option>
							<option>60대</option>
							<option>70대+</option>
						</select>
					</div>
					
					<div class="row">
						<label>거주 지역</label>
						<select name="userRegion">
							<option>선택</option>
							<option>서울</option>
							<option>수도권</option>
							<option>지방</option>
							<option>해외</option>
						</select>
					</div>
					
					<div class="row">
						<label>여행 빈도</label>
						<input type="radio" name="frequency" value="거의 안 감"> 거의 안 감
						<input type="radio" name="frequency" value="1~2회"> 1 ~ 2회
						<input type="radio" name="frequency" value="3~4회"> 3 ~ 4회
						<input type="radio" name="frequency" value="자주"> 자주
					</div>
					
					<div class="row">
						<input type="submit" value="확인" id="ok" onClick="return check();">
						<input type="reset" value="취소" id="cancel">
					</div>
				</form>
			</section>
		</div>
	</main>
	
</body>
</html>
