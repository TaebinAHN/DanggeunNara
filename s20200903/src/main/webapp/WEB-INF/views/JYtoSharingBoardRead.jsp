<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includeJSP.jsp"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>!!!!!!!!!!!!!!!!!!제목 불러오는 기능 찾아보기 ::당근나라!!!!!!!!!!!!!!!</title>
<link rel="stylesheet" href="css/common.css" />
<script src="javascript/common.js" defer></script>
<script src="https://kit.fontawesome.com/797af710b1.js"
	crossorigin="anonymous" defer></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"
	defer></script>
<link rel="shortcut icon" type="image/x-icon"
	href="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fcz9VUi%2FbtqJt0b2VUe%2FiiBIEnDkufPInk4hKsunE1%2Fimg.png" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&display=swap"
	rel="stylesheet" />
</head>

<body>
	<!-- 게시글 보기는 위 head에 title도 글제목으로 불러와주세요 -->
	<!-- 메뉴 고정바 -->
	<header class="header">
	<div class="header__fixed-bar">
		<section class="header__fixed-bar-logo section-logo"> <a
			href="../main/main.html"> <img
			src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FSQxEt%2FbtqJs5kkQnP%2FhvX1kh8aeqli9J93tF5qV1%2Ftfile.svg"
			alt="당근나라" />
		</a> </section>
		<section class="header__fixed-bar-search section-search">
		<div class="header__fixed-bar-search-container" tabindex="4">
			<input class="search-input" type="text"
				placeholder="동네 이름, 물품명 등을 검색해보세요!" /> <input
				type="image" class="search-icon"
				src="https://img.icons8.com/ios-glyphs/30/000000/search.png" />
		</div>
		<!-- 검색시 검색창 밑에 뜨는 키워드 추천란 입니다 -->
		<div class="search-keyword">
			<span class="keyword-title">추천</span> <span class="keyword-contnet">
				<a href="#none">분당 유모차</a> <a href="#none">키즈카페</a> <a href="#none">화분</a>
				<a href="#none">강남 명품가방</a> <a href="#none">잠실 냉장고</a> <a
				href="#none">인천 마우스</a>
			</span>
		</div>
		<!-- 5~6개 정도 표시해주면 될듯합니다 --> </section>
		<section class="header__fixed-bar-nav section-nav"> <nav
			class="header__fixed-bar-nav-container">
		<ul class="header__fixed-bar-nav-list nav-list">
			<li class="nav-list-content"><a href="../member/join.html">회원가입</a>
			</li>
			<li class="nav-list-content"><a href="../member/login.html">로그인</a>
			</li>
			<li class="nav-list-content"><a href="#">지도로 보기</a></li>
		</ul>
		</nav> </section>
	</div>
	</header>
	<!-- 메뉴 목록 리스트 -->
	<aside class="fixed__list">
	<ul>
		<li><a href="JYnoticeBoard.do">공지사항</a></li>
		<li><a href="blackListBoard.html">검거완료 !</a></li>
		<li><a href="badReviewBoard.html">불량거래 후기</a></li>
		<li><a href="toSaleBoard.html">판매중 이에요.</a></li>
		<li><a href="JYtoSharingBoard.do">나눔중 이에요.</a></li>
		<li><a href="toBuyBoard.html">구매합니다 ~!</a></li>
	</ul>
	</aside>
	
	
	<!-- 섹션 시작 -->
	<article class="article">
	<div class="article__sharing-board-read">
		<div class="silder-container">
			<div class="slider">
				<div class="slide showing">
					<img src="/image/${jyPost.pImg1 }" alt="img-thumbnail1"/>
				</div>
				
 				<c:if test="${jyPost.pImg2 != null }">
                <div class="slide">
                    <img src="/image/${jyPost.pImg2 }" alt="img-thumbnail2"/></div>
                </c:if>
                
                <c:if test="${jyPost.pImg3 != null }">
                <div class="slide">
                	<img src="/image/${jyPost.pImg3 }" alt="img-thumbnail3"/></div>
                </c:if>
                
                 <c:if test="${jyPost.pImg4 != null }">
                 <div class="slide">
                 	<img src="/image/${jyPost.pImg4 }" alt="img-thumbnail4"/></div>
                 </c:if>
                 
                 <c:if test="${jyPost.pImg5 != null }">
                 <div class="slide">
                 	<img src="/image/${jyPost.pImg5 }" alt="img-thumbnail5"/></div>
                 </c:if>
                 
                 
				<div class="left btns" onclick="left_move();">
					<i class="fas fa-chevron-left"></i>
				</div>
				<div class="right btns" onclick="right_move();">
					<i class="fas fa-chevron-right"></i>
				</div>
			</div>
		</div>
		<div class="sharing-board-read__info-container">
			<div class="sharing-board-read__info">
				<a href="#none">
				<div class="sharing-board-read__name">${jyPost.mNick }</div></a> <!-- 닉네임  -->
				<p class="sharing-board-read__address">${jyPost.mAddr }</p> 		<!-- 주소  -->
			</div>
			<div class="sharing-board-read__sweet-cotainer">
				<div class="sharing-board-read__sweet sweet-cotainer"></div>
				<div class="sharing-board-read__text">당도</div>	<!-- 당도 -->
			</div>
		</div>
		<div class="sharing-board-read__content">
			<h1 class="sharing-board-read__content--title">${jyPost.pTitle }</h1>
			<div class="sharing-board-read__content--detail">
				<!-- 실제 게시글에 등록된 주소, 카테고리 -->
				<span>${jyPost.mAddr }
					<div class="vertical"></div> ${jyPost.ctKinds } <!-- 카테고리종류 -->
					<div class="vertical" name ="pStatus"></div> ${jyPost.pStatus }
				</span>
			</div>
			<div class="sharing-board-read__content--price"></div>
			<div class="sharing-board-read__content--article">
				${jyPost.pContent }<!-- 게시글 내용  -->
			</div>
		  	<div class="sharing-board-read__content--hits">
                        <fmt:parseDate var="pDate" value="${jyPost.pDate}" pattern="yyyy-MM-dd HH:mm:ss" />
						<fmt:formatDate value="${pDate}" pattern="yyyy-MM-dd" /> · 조회수 ${jyPost.pHit }
            </div>
			<div class="sharing-board-read__content--counts picks-container">
				<img class="picks-ico"
					src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHg9IjBweCIgeT0iMHB4Igp3aWR0aD0iMjYiIGhlaWdodD0iMjYiCnZpZXdCb3g9IjAgMCAxNzIgMTcyIgpzdHlsZT0iIGZpbGw6IzAwMDAwMDsiPjxnIHRyYW5zZm9ybT0iIj48ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9Im5vbnplcm8iIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBzdHJva2UtbGluZWNhcD0iYnV0dCIgc3Ryb2tlLWxpbmVqb2luPSJtaXRlciIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBzdHJva2UtZGFzaGFycmF5PSIiIHN0cm9rZS1kYXNob2Zmc2V0PSIwIiBmb250LWZhbWlseT0ibm9uZSIgZm9udC13ZWlnaHQ9Im5vbmUiIGZvbnQtc2l6ZT0ibm9uZSIgdGV4dC1hbmNob3I9Im5vbmUiIHN0eWxlPSJtaXgtYmxlbmQtbW9kZTogbm9ybWFsIj48cGF0aCBkPSJNMCwxNzJ2LTE3MmgxNzJ2MTcyeiIgZmlsbD0ibm9uZSI+PC9wYXRoPjxnIGZpbGw9IiMwMDAwMDAiPjxwYXRoIGQ9Ik01MS4wNjI1LDI2Ljg3NWMtMjIuMjM0ODYsMCAtNDAuMzEyNSwxOC4yODc2IC00MC4zMTI1LDQwLjMxMjVjMCw3LjY4NDU3IDMuNDg1MzUsMTQuMzQwMzMgNi43MTg3NSwxOS4xNDg0NGMzLjIzMzQsNC44MDgxIDYuNTUwNzgsNy44OTQ1MyA2LjU1MDc4LDcuODk0NTNsNTguMTE3MTksNTguMjg1MTZsMy44NjMyOCwzLjg2MzI4bDMuODYzMjgsLTMuODYzMjhsNTguMTE3MTksLTU4LjI4NTE2YzAsMCAxMy4yNjk1MywtMTEuNjk0ODIgMTMuMjY5NTMsLTI3LjA0Mjk3YzAsLTIyLjAyNDkgLTE4LjA3NzY0LC00MC4zMTI1IC00MC4zMTI1LC00MC4zMTI1Yy0xOC40NTU1NywwIC0zMC4zMzkzNSwxMS4xMDY5MyAtMzQuOTM3NSwxNS43ODkwNmMtNC41OTgxNSwtNC42ODIxMyAtMTYuNDgxOTMsLTE1Ljc4OTA2IC0zNC45Mzc1LC0xNS43ODkwNnpNNTEuMDYyNSwzNy42MjVjMTYuMDYyMDEsMCAzMC45MDYyNSwxNS42MjEwOSAzMC45MDYyNSwxNS42MjEwOWw0LjAzMTI1LDQuNTM1MTZsNC4wMzEyNSwtNC41MzUxNmMwLDAgMTQuODQ0MjQsLTE1LjYyMTA5IDMwLjkwNjI1LC0xNS42MjEwOWMxNi4zNTU5NiwwIDI5LjU2MjUsMTMuNDE2NTEgMjkuNTYyNSwyOS41NjI1YzAsOC4yOTM0NiAtMTAuMDc4MTIsMTkuNDg0MzggLTEwLjA3ODEyLDE5LjQ4NDM4bC01NC40MjE4Nyw1NC40MjE4OGwtNTQuNDIxODcsLTU0LjQyMTg3YzAsMCAtMi42MDM1MiwtMi40OTg1NCAtNS4yMDcwMywtNi4zODI4MWMtMi42MDM1MiwtMy44ODQyOCAtNC44NzEwOSwtOC45NDQzMyAtNC44NzEwOSwtMTMuMTAxNTZjMCwtMTYuMTQ1OTkgMTMuMjA2NTQsLTI5LjU2MjUgMjkuNTYyNSwtMjkuNTYyNXoiPjwvcGF0aD48L2c+PC9nPjwvZz48L3N2Zz4="
					alt="picks" />
			</div>
		</div>
		<div class="sharing-board-read__btn-container">
			<a href="JYtoSharingBoard.do">
			<div class="sharing-board-read__list list-btn">목록</div></a> 
			
			<a href="deleteSharing.do?bId=${jyPost.bId}&pNum=${jyPost.pNum}">
			<input class="sharing-board-read__delete" type="button" value="삭제" /></a>
			
			<a href="JYtoSharingBoardUpdate.do?bId=${jyPost.bId}&pNum=${jyPost.pNum}">
			<input class="sharing-board-read__update" type="button" value="수정" /></a>
			
		</div>
	</div>
	</article>
	
	
	
	<!-- 하단 카피라이트 -->
	<footer class="footer">
	<div class="footer-container">
		<div class="footer-top">
			<div class="footer-top-logo"></div>
			<ul class="footer-top-list">
				<li class="footer-top-list-content"><a
					href="https://www.daangn.com/trust">믿을
						수 있는 중고거래</a></li>
				<li class="footer-top-list-content"><a
					href="https://www.daangn.com/wv/faqs"> 자주 묻는 질문</a></li>
			</ul>
			<ul class="footer-top-list">
				<li class="footer-top-list-content"><a
					href="https://www.notion.so/3d0197c137ec43d18ff739b5b254a3c8/">
						회사 소개 </a></li>
				<li class="footer-top-list-content"><a
					href="https://ad.daangn.com/"> 광고주센터 </a></li>
				<li class="footer-top-list-content"><a
					href="https://town.daangn.com/"> 동네가게 </a></li>
			</ul>
			<ul class="footer-top-list">
				<li class="footer-top-list-content"><a
					href="https://www.daangn.com/policy/terms"> 이용약관 </a></li>
				<li class="footer-top-list-content"><a
					href="https://www.daangn.com/policy/privacy"> 개인정보 취급방침 </a></li>
				<li class="footer-top-list-content"><a
					href="https://www.daangn.com/policy/location"> 위치기반서비스 이용약관 </a></li>
			</ul>
		</div>
		<div class="footer-bottom">
			<div class="footer-bottom-copyright">
				<ul class="footer-bottom-list-container">
					<li class="footer-bottom-list-conent">
						<address>고객문의 cs@daangnservice.com</address>
						<address>제휴문의 contact@daangn.com</address>
					</li>
					<li class="footer-bottom-list-conent">
						<address>사업자 등록번호 : 375-87-000-88</address>
						<address>서울특별시 구로구 디지털로 30길 28 609호</address>
					</li>
					<li class="footer-bottom-list-conent">©Danggeun Market Inc.</li>
				</ul>
			</div>
			<div class="footer-bottom-sns">
				<ul class="footer-bottom-sns-container">
					<li class="sns-icon"><a href="https://www.facebook.com/daangn">
							<img
							src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/footer/icon-facebook-0563f4a93852d073b41f13b8bcabb03d47af3bb3a6755cdfedd8a73686c7f18c.svg" />
					</a></li>
					<li class="sns-icon"><a
						href="https://www.instagram.com/daangnmarket/">
							<img
							src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/footer/icon-instagram-2f6c88a461597907c114b7ce28eab053fcae791ed26417915fefb6f7c9f95756.svg" />
					</a></li>
					<li class="sns-icon"><a href="https://blog.naver.com/daangn">
							<img
							src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/footer/icon-blog-e1b0d512d1766a6962ec5bbb5b0803d2a6a9c55ad97db5ba9eebb76013caceba.svg" />
					</a></li>
				</ul>
			</div>
		</div>
	</div>
	</footer>
</body>
</html>