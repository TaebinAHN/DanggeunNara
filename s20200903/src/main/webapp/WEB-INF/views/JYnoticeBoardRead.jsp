<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includeJSP.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>제목 불러오기:: 당근나라</title>
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
	
	<article class="article">
		<div class="article__notice-board-read">
			<div class="silder-container">
				<div class="slider">
				<div class="slide showing">
					<img src="/s20200903/resources/image/${jyPost.pImg1 }" alt="img-thumbnail1"/>
				</div>
				
				<c:if test='${jyPost.pImg2 != "null" }'>
                <div class="slide">
                    <img src="/s20200903/resources/image/${jyPost.pImg2 }" alt="img-thumbnail2"/></div>
                </c:if>
                
                <c:if test='${jyPost.pImg3 != "null" }'>
                <div class="slide">
                	<img src="/s20200903/resources/image/${jyPost.pImg3 }" alt="img-thumbnail3"/></div>
                </c:if>
                
                 <c:if test='${jyPost.pImg4 != "null" }'>
                 <div class="slide">
                 	<img src="/s20200903/resources/image/${jyPost.pImg4 }" alt="img-thumbnail4"/></div>
                 </c:if>
                 
                 <c:if test='${jyPost.pImg5 != "null" }'>
                 <div class="slide">
                 	<img src="/s20200903/resources/image/${jyPost.pImg5 }" alt="img-thumbnail5"/></div>
                 </c:if>
                 
					<div class="left btns" onclick="left_move();">
						<i class="fas fa-chevron-left"></i>
					</div>
					<div class="right btns" onclick="right_move();">
						<i class="fas fa-chevron-right"></i>
					</div>
				</div>
			</div>
			<div class="notice-board-read__info-container">
				<div class="notice-board-read__info">
					<a href="#none">
					<div class="notice-board-read__name">${jyPost.mId }</div></a>
				</div>
			</div>
			<div class="notice-board-read__content">
				<h1 class="notice-board-read__content--title">${jyPost.pTitle }</h1>
				
				<div class="notice-board-read__content--hits">
				 <!-- DB에 들어있는 이 패턴의 날짜를 -->
				<fmt:parseDate var="pDate" value="${jyPost.pDate}" pattern="yyyy-MM-dd HH:mm:ss" />
				<!-- 이 패턴으로 바꿔서 뷰에 출력해줌 -->
				<fmt:formatDate value="${pDate}" pattern="yyyy-MM-dd" /> · 조회수 ${jyPost.pHit }</div>
				<div class="notice-board-read__content--article">
					${jyPost.pContent }
				</div>
			</div>
			<div class="notice-board-read__btn-container">
				<a href="JYnoticeBoard.do"><!-- 목록이동 -->
				<div class="notice-board-read__list list-btn">목록</div></a> 
				
				<a href ="deleteNotice.do?bId=${jyPost.bId}&pNum=${jyPost.pNum}">
				<input class="notice-board-read__delete" type="button" value="삭제" /></a>
				
				<a href ="JYnoticeBoardUpdate.do?bId=${jyPost.bId}&pNum=${jyPost.pNum}">
				<input class="notice-board-read__update" type="button" value="수정" ></a>
					
			</div>
		</div>
	</article>
	<!-- 하단 카피라이트 -->
<%@ include file="footer.jsp" %>
</body>
</html>
