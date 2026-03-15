<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style type="text/css">
	* {
	  box-sizing: border-box;
	} /* border, padding을 width 안에 포함 -> 로그인 버튼과 입력창 크기 = */

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
	
	.loginPanel{
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
		line-height: 1;   /* 폰트사이즈만큼 높이 */
		padding: 6px 8px;
		border-radius: 10px;
	} 
	
	.backBtn:hover {
      	background-color: #f3f3f3;
      	text-decoration: none;
    }
	
	.logo{
		display:flex; 
		justify-content: center;
		padding: 0 0 30px;
	}
	
	.logoTitle{
		margin-top: 30px; 
		font-size: 35px;
		font-weight: 800;
	}
	 
	#loginForm{
		width: 100%;
	}
	 
	.row{
		margin-bottom: 12px;
	}
	
	#loginForm input{
		width: 100%; 
		height: 54px;
		border-radius: 10px; 
		border: 1px solid #ddd;
		font-size: 15px;
		padding-left: 10px;  
	}
	
	#loginForm input:focus{
  		border-color:#ff6b81;
	}
	
	.loginBtn{
		width: 100%;
		height: 54px;
		border: none;
		border-radius: 20px;
		background-color: #f2f2f2;
		font-size: 15px;
		font-weight: 600;
		margin-top: 10px; 
	}
	
	.loginBtn:hover{
		background-color: #ff6b81;
	}
	
	.loginBtn:active{
		background-color: #ff6b81;
	}
	
	.remem{
		margin-top: 14px;
		display: flex;
		justify-content: space-between;
		align-items: center;
		font-size: 14px; 
	}
	
	.btnID{
		display: flex;
		align-items: center;
		gap: 8px;	
	}
	
	.idRem{
		width: 18px;
		height: 18px;
		border: 1px solid #f2f2f2;
		background-color: #fff;
		border-radius: 4px;
		padding: 0; 
	}
	
	.idRem:focus{
		border: 1px solid #ff6b81;
	}
	
	findLinks{
		display: flex;
		align-items: center;
		gap: 10px;
	}
	
	.findLinks a{
		text-decoration: none;
		color: #555;
		font-size: 14px;
	}
	
	.findLinks a:hover, a:active{
		text-decoration: none;
		color: #ff6b81; 
	}
	
	.divider{ 
	  color: #bdbdbd;
	}
	
</style>
</head>
<body>
	<main class="wrap">
		<div class="loginPanel">
		
			<a href="Tour.jsp" class="backBtn">←</a>
			
			<section class="logo">
			  <h1 class="logoTitle">meta Tour</h1>
			</section>
				
			<section class="card">
				<form name="loginForm" id="loginForm" action="<%=request.getContextPath()%>/LoginServlet" method="post">
					<div class="row">
						<input type="email" name="userEmail" placeholder="이메일 입력">
					</div>
					
					<div class="row">
						<input type="password" name="userPw" placeholder="비밀번호 입력">
					</div>
					
					<button type="submit" class="loginBtn">로그인</button>
				</form>
			</section>
			
			<section class="remem">
				<div class="idRemember">
					<div class="btnID">
						<button type="button" class="idRem"></button>
						<p>아이디 저장</p>
					</div>
				</div>
				<div class="findLinks">
					<a href="#" class="idFind">아이디 찾기</a>
					<span class="divider">|</span>
					<a href="#" class="pwFind">비밀번호 찾기</a>
				</div>
			</section>
		</div>
	</main>	
</body>
</html>
