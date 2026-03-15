<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String user = (String)session.getAttribute("loginUser");

if (user == null){
    response.sendRedirect("login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
	* {box-sizing: border-box;}

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
	
	.choicePanel{
		max-width: 720px;
		margin: 0 auto;
		padding: 28px 0 0 0;
		position: relative;
	}
	
	.header{
		display: flex;
		align-items: center;
		justify-content: center;
		position: relative;
		height: 48px;
		margin-bottom: 18px;
	}
	
	.backBtn{
		position: absolute;  
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
	
	.title{
		margin: 0;
		font-size: 30px;
		font-weight: 800; 
	}
	 
	.topicRow{
      	display:flex;
      	justify-content:flex-end;
      	gap:10px;
      	margin: 10px 0 18px;
    }
	
	.topicBtn{
      	border:1px solid #ddd;
      	background-color:#fff;
      	padding:10px 16px;
      	border-radius:30px;
      	cursor:pointer;
    }
	
	.topicBtn.active{
      	border-color:#ff6b81;
      	font-weight:600;
    }
	
	.tab-content { 
		padding: 10px 0; 
	}
	
	.grid{
		display: flex;
		gap: 12px;
		flex-wrap: wrap;
		margin-top: 12px;
	}
	
	.placeItem{
	  	width: 200px;
	}
	
	.photoBox{
  		border-radius: 12px;
  		overflow: hidden;   
  		border: 1px solid #eee;
  		background-color: #fff;
  		width: 200px;
	}
	
	.photoBox img{
  		width: 100%;
  		height: 120px;
  		object-fit: cover;
  		display: block;
  		background-color: #f2f2f2;
	}

	.placeName{
  		margin-top: 8px;
  		text-align: center;
  		font-weight: 700;
	}
	
</style>
</head>
<body>
	<main class="wrap">
		<div class="choicePanel">
			<div class="header">
				<a href="Tour.jsp" class="backBtn">←</a>
				<h1 class="title">추천 여행지</h1>
			</div>
			
			<div class="topicRow" id="topicRow">
				<button type="button" class="topicBtn" onclick="setTopic('sports', this)">스포츠</button>
			    <button type="button" class="topicBtn" onclick="setTopic('food', this)">음식</button>
			    <button type="button" class="topicBtn" onclick="setTopic('festival', this)">축제</button>
			</div>
			
			<ul class="nav nav-tabs">
			  	<li class="active"><a href="#tab1" data-toggle="tab" id="t1">탭1</a></li>
			  	<li><a href="#tab2" data-toggle="tab" id="t2">탭2</a></li>
			  	<li><a href="#tab3" data-toggle="tab" id="t3">탭3</a></li>
			</ul>
			
			<div class="tab-content">
			  	<div class="tab-pane active fade in" id="tab1"></div>
			  	<div class="tab-pane fade" id="tab2"></div>
			  	<div class="tab-pane fade" id="tab3"></div>
			</div>
		</div>
	</main>	
</body>
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> <!-- 에러 -> 가져온 코드 -->
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	const RECOMMEND = {
		sports: {
			"야구": [
				{ place: "광주", img: "image/gwangju.jpeg" },
				{ place: "대구", img: "image/daegu.jpeg" },
				{ place: "부산", img: "image/busan.jpeg" },
				{ place: "도쿄", img: "image/tokyod.jpeg" }
			],
			"축구": [
				{ place: "수원", img: "image/suwon.jpeg" },
				{ place: "전북 전주", img: "image/jeonju.jpeg" },
				{ place: "바르셀로나", img: "image/FC.png" }
			],
			"미식축구": [
				{ place: "캔자스시티", img: "image/kansasCity.jpg" },
				{ place: "댈러스", img: "image/dallas.jpeg" }
			]
		},	
		food: {
			"한식": [
				{ place: "전주", img: "image/jeonjuF.jpeg" },
				{ place: "안동", img: "image/andong.jpg" }
			],
			"양식": [
				{ place: "이태원", img: "image/Itaewon.jpeg" },
				{ place: "로마", img: "image/rome.jpg" }
			],
			"일식": [
				{ place: "오사카", img: "image/osaka.jpg" },
				{ place: "도쿄", img: "image/tokyoF.jpeg" }
			]
		},	
		festival: {
			"여름": [
				{ place: "보령", img: "image/boryeong.jpg" },
				{ place: "부산", img: "image/busanF.jpeg" }
			],
			"겨울": [
				{ place: "화천", img: "image/hwacheon.jpg" },
				{ place: "평창", img: "image/PyeongChang.png" },
				{ place: "삿포로", img: "image/Sapporo.jpeg" }
			],
			"전통": [
				{ place: "진주", img: "image/jinju.jpg" },
				{ place: "제주", img: "image/jeju.jpeg" }
			]
		}	
			
	};
	
	let currentTopic = "sports";
	
	function makeHTML(list, title){
		let html = "<h3>" + title + " 추천 여행지</h3>";
		html += "<div class='grid'>";
		
		for (let i=0; i<list.length; i++){
			html += "<div class='placeItem'>";
			html += "  <div class='photoBox'>";
			html += "    <img src='" + list[i].img + "' alt=''>";
			html += "  </div>";
			html += "  <div class='placeName'>" + list[i].place + "</div>";
			html += "</div>";
		}
		
		html += "</div>";
		return html;
	}
	
	function setTopic(topic, btn){
		currentTopic = topic;
		
		const btns = document.getElementsByClassName("topicBtn");
		for(let i=0; i<btns.length; i++){
			btns[i].classList.remove("active");
		}
		btn.classList.add("active");
		
		const names = Object.keys(RECOMMEND[topic]);
		
		document.getElementById("t1").innerText = names[0];
		document.getElementById("t2").innerText = names[1];
		document.getElementById("t3").innerText = names[2];
	
		document.getElementById("tab1").innerHTML = makeHTML(RECOMMEND[topic][names[0]], names[0]);
		document.getElementById("tab2").innerHTML = makeHTML(RECOMMEND[topic][names[1]], names[1]);
		document.getElementById("tab3").innerHTML = makeHTML(RECOMMEND[topic][names[2]], names[2]);
		
		$('#t1').tab('show');
	}
	
	$(function(){
		setTopic("sports", document.getElementsByClassName("topicBtn")[0]);	
	})
	
</script>

</html>
