<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 
String loginUser = (String)session.getAttribute("loginUser");
/* 세션에서 로그인 값을 꺼내라 */

if (loginUser == null){  /* 세션에 loginUser이 없다면  */
	response.sendRedirect("Login.jsp");   /* 로그인 페이지로 강제로 보냄 */
	return; 
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tour - Recommendation</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/kfonts2.css" rel="stylesheet">
<style type="text/css">
body {
	margin: 0;
	font-family: Arial, sans-serif;
	padding-top: 104px;
}

.topHeader {
	position: fixed;
	top: 24px;
	left: 0;
	right: 0;
	background-color: #fff;
	z-index: 9999;
}

.topBar {
	height: 56px;
	display: flex;
	align-items: center;
}

.inner {
	width: 100%;
	max-width: 1250px;
	margin: 0 auto;
	padding: 0 18px;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.brandText {
	text-decoration: none;
	color: #111;
	font-size: 22px;
	font-weight: 800;
}

.search {
	flex: 1;
	margin: 0 16px;
}

.searchInput {
	width: 100%;
	max-width: 500px;
	height: 36px;
	padding: 0 12px;
	border-radius: 20px;
	outline: none;
}

.menu {
	display: flex;
	gap: 10px;
}

.categoryBar {
	height: 48px;
	display: flex;
	align-items: center;
	border-bottom: 1px solid #f2f2f2;
}

.categoryBar .inner {
	justify-content: flex-start;
	padding-left: 24px;
	padding-right: 24px;
}

.categoryMenu {
	list-style: none;
	margin: 0;
	display: flex;
	align-items: center;
	gap: 20px;
}

.categoryMenu li a {
	text-decoration: none;
	color: #111;
	font-size: 15px;
	font-weight: 600;
	padding: 10px 12px;
	border-bottom: 3px solid transparent;
	padding-bottom: 6px;
}

.categoryMenu li a:hover {
	border-bottom: 3px solid pink;
}

.banner {
	margin: 0 auto;
	position: relative;
	width: 100%;
	max-width: 1250px;
	height: 200px;
	max-height: 400px;
	overflow: hidden;
}

.bannerImg {
	width: 100%;
	height: 100%;
	object-fit: cover;
	object-position: center;
	display: block;
}

.bannerText {
	position: absolute;
	left: 13px;
	top: 165px;
	color: #fff;
	font-size: 17px;
	font-weight: 600;
}

.pageWrap {
	max-width: 1250px;
	margin: 0 auto;
	padding: 0 14px;
}

.criteria {
	margin-top: 60px;
	margin-left: 0;
}

.criteria h3 {
	font-size: 25px;
	font-weight: 700;
}

.choice {
	padding: 8px 18px;
	margin: 10px 6px 6px 0;
	border-radius: 30px;
	border: 1px solid #e5e5e5;
	background-color: #ffff;
	font-size: 14px;
	cursor: pointer;
	transition: all 0.2s ease;
}

.choice:hover {
	border-color: #ff6b81;
	color: #ff6b81;
	background-color: #fff;
}

.choice.active {
	background-color: #ff6b81;
	color: #fff;
	border-color: #ff6b81;
}

#result {
	margin: 15px 16px 15px 16px;
	padding: 14px 16px;
	border: 1px solid #ddd;
	border-radius: 10px;
	background: #fff;
	box-shadow: 0 3px 5px rgba(0, 0, 0, 0.15);
}

#result h3 {
	margin: 0 0 10px 0;
	font-size: 18px;
	font-weight: 600;
}

.resultList {
	margin: 0 0 15px 0;
	padding-left: 18px;
}

.resultItem {
	padding: 8px 0;
	font-weight: 600;
}

.resultItem:hover {
	color: #ff6b81;
}

.hot {
	margin: 60px 0 0 0;
}

.hot h3 {
	margin: 0 0 16px 0;
	font-size: 25px;
	font-weight: 700;
}

.hotGrid {
	margin-top: 10px;
	display: flex;
	gap: 20px;
	flex-wrap: wrap;
}

.hotCard {
	background: #fff;
	border-radius: 10px;
	overflow: hidden;
	width: calc(25% - 15px);
}

.hotCard img {
	width: 100%;
	height: 200px;
	object-fit: cover;
	display: block;
}

.hotInfo {
	padding-top: 20px;
}

.hotTitle {
	font-size: 20px;
	font-weight: 600;
	margin-bottom: 8px;
}

.hotDesc {
	font-size: 15px;
	color: #888;
	margin: 6px 0 10px 0;
}

.hotPrice {
	font-size: 20px;
	font-weight: 600;
	color: #ff6b81;
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	
	const category = ["산", "바다", "힐링", "액티비티", "가족", "친구", "맛집", "관광"];
	
	const travelArr = [
		["설악산", "한라산", "지리산"], 
		["부산", "묵호", "강릉"], 
		["제주도", "담양", "경주"], 
		["광주", "대전", "대구", "양양"],
		["에버랜드", "롯데월드", "제주 아쿠아리움", "서울대공원"],
	    ["홍대", "강남", "부산 광안리", "전주 한옥마을"],
	    ["전주", "통영", "광주", "대구"],
	    ["경복궁", "불국사", "해인사", "수원화성"]
	];
	
	function closeResult(){
		$("#result").hide().empty();
		$(".choice").removeClass("active");
	}
	
	function showResult(index, btn){
		const buttons = document.getElementsByClassName("choice");
		for(let i=0; i<buttons.length; i++){
			buttons[i].classList.remove("active");
		}
		btn.classList.add("active");

		const resultDiv = document.getElementById("result");

		let str = "<h3>" + category[index] + " 추천 여행지</h3>";

		str += "<ul class='resultList'>";
		
		for(let i=0; i<travelArr[index].length; i++){
			str += "<li class='resultItem'>📍 " + travelArr[index][i] + "</li>";
		}
		
		str += "</ul>";
		
		resultDiv.innerHTML = str;
		$("#result").show();
	}
	
	$(function () {
		
		$("#result").hide();
		
		$(document).click(function (e) {
	
			if ($(e.target).closest(".choice").length > 0) return;
	
		    if ($(e.target).closest("#result h3, #result p").length > 0) return;
		    
		    closeResult();
		});
	});
	
</script>
</head>

<body>
	<header class="topHeader">
		<div class="topBar">
			<div class="inner">
				<div class="brand">
					<a class="brandText" href="Tour.jsp">Meta Tour</a>
				</div>

				<div class="search">
					<form class="searchForm">
						<input type="text" class="searchInput" placeholder="여행지를 입력하시오">
					</form>
				</div>

				<div class="menu">
    				<% if (loginUser == null) { %>
				        <a href="Login.jsp" class="btnLogin">로그인</a>
				        <a href="User.jsp" class="btnUser">사용자 정보</a>
				    <% } else { %>
				        <span style="font-size: 14px;"><%= loginUser.split("@")[0] %>님</span>
				        <a href="<%= request.getContextPath() %>/LogoutServlet" class="btnLogin">로그아웃</a>
				        <a href="User.jsp" class="btnUser">사용자 정보</a>
				    <% } %>
				</div>
			</div>
		</div>

		<div class="categoryBar">
			<div class="inner">
				<ul class="categoryMenu">
					<li><a href="Recommend.jsp" class="Recommend">추천 여행지</a></li>
					<li><a href="#">항공</a></li>
					<li><a href="#">해외 숙소</a></li>
					<li><a href="#">국내 숙소</a></li>
					<li><a href="#">투어 | 티켓</a></li>
					<li><a href="#">할인</a></li>
				</ul>
			</div>
		</div>
	</header>

	<div class="banner">
		<img src="image/air1.jpeg" class="bannerImg">
		<div class="bannerText">여행지를 추천해드립니다</div>
	</div>

	<div class="pageWrap">
		<section class="criteria">
			<h3>당신의 여행 취향은?</h3>
			<input type="button" class="choice" value="산"
				onclick="showResult(0, this)"> <input type="button"
				class="choice" value="바다" onclick="showResult(1, this)"> <input
				type="button" class="choice" value="힐링"
				onclick="showResult(2, this)"> <input type="button"
				class="choice" value="액티비티" onclick="showResult(3, this)"> <input
				type="button" class="choice" value="가족"
				onclick="showResult(4, this)"> <input type="button"
				class="choice" value="친구" onclick="showResult(5, this)"> <input
				type="button" class="choice" value="맛집"
				onclick="showResult(6, this)"> <input type="button"
				class="choice" value="관광" onclick="showResult(7, this)">
		</section>

		<div id="result"></div>

		<section class="hot">
			<h3>⏳ 요즘 뜨는 여행지</h3>
			<div class="hotGrid">
				<div class="hotCard">
					<img src="image/jeju1.jpg" alt="제주도">
					<div class="hotInfo">
						<div class="hotTitle">[Best] 제주 힐링 여행</div>
						<div class="hotDesc">#감성숙소 #바다뷰</div>
						<div class="hotPrice">289,000원~</div>
					</div>
				</div>

				<div class="hotCard">
					<img src="image/busan1.jpeg" alt="부산">
					<div class="hotInfo">
						<div class="hotTitle">부산 바다 감성 여행</div>
						<div class="hotDesc">#광안리 #야경</div>
						<div class="hotPrice">199,000원~</div>
					</div>
				</div>

				<div class="hotCard">
					<img src="image/mukho2.png" alt="묵호">
					<div class="hotInfo">
						<div class="hotTitle">묵호 카페 | 바다 코스</div>
						<div class="hotDesc">#카페투어 #동해여행</div>
						<div class="hotPrice">159,000원~</div>
					</div>
				</div>

				<div class="hotCard">
					<img src="image/ulleungdo.jpg" alt="묵호">
					<div class="hotInfo">
						<div class="hotTitle">천혜의 자연, 울릉도</div>
						<div class="hotDesc">#겨울시즌 #크루즈1박</div>
						<div class="hotPrice">454,000원~</div>
					</div>
				</div>
			</div>
		</section>

		<section class="hot">
			<h3>🎬 미디어 속 화제의 여행지</h3>
			<div class="hotGrid">
				<div class="hotCard">
					<img src="image/tokyo.jpeg" alt="도쿄">
					<div class="hotInfo">
						<div class="hotTitle">도쿄/가마쿠라/에노시마</div>
						<div class="hotDesc">#시내호털 #온천호텔</div>
						<div class="hotPrice">889,000원~</div>
					</div>
				</div>

				<div class="hotCard">
					<img src="image/europe.jpeg" alt="유럽">
					<div class="hotInfo">
						<div class="hotTitle">동유럽 3국</div>
						<div class="hotDesc">#베스트셀러 #시내호텔</div>
						<div class="hotPrice">2,999,000원~</div>
					</div>
				</div>

				<div class="hotCard">
					<img src="image/canada.jpeg" alt="캐나다">
					<div class="hotInfo">
						<div class="hotTitle">캐나다 7~8일</div>
						<div class="hotDesc">#직항 #시내호텔</div>
						<div class="hotPrice">2,359,000원~</div>
					</div>
				</div>

				<div class="hotCard">
					<img src="image/Italy.jpeg" alt="이탈리아">
					<div class="hotInfo">
						<div class="hotTitle">이탈리아 일주</div>
						<div class="hotDesc">#4성호텔 #9일</div>
						<div class="hotPrice">2,559,000원~</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<script src="js/bootstrap.min.js"></script>
</body>
</html>
