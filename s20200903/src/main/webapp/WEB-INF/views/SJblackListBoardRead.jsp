<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>검거완료! :: 당근나라</title>
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
<%@ include file="header.jsp"%>
<%@ include file="aside.jsp"%>
<body>
	<!-- 섹션 시작 -->
	<article class="article">
		<div class="article__bad-review-board-read">
			<div class="silder-container">
				<div class="slider">
					<div class="slide showing">
						<img 
							src="/s20200903/resources/image/${sjb.pImg1 }" 
							alt="이미지1" />
					</div>					
 				<c:if test="${sjb.pImg2 != null }">
                <div class="slide">
                    <img src="/s20200903/resources/image/${sjb.pImg2 }" alt="이미지2"/></div>
                </c:if>
                
                <c:if test="${sjb.pImg3 != null }">
                <div class="slide">
                	<img src="/s20200903/resources/image/${sjb.pImg3 }" alt="이미지3"/></div>
                </c:if>
                
                 <c:if test="${sjb.pImg4 != null }">
                 <div class="slide">
                 	<img src="/s20200903/resources/image/${sjb.pImg4 }" alt="이미지4"/></div>
                 </c:if>
                 
                 <c:if test="${sjb.pImg5 != null }">
                 <div class="slide">
                 	<img src="/s20200903/resources/image/${sjb.pImg5 }" alt="이미지5"/></div>
                 </c:if>
					<div class="left btns" onclick="left_move();">
						<i class="fas fa-chevron-left"></i>
					</div>
					<div class="right btns" onclick="right_move();">
						<i class="fas fa-chevron-right"></i>
					</div>
				</div>
			</div>
			<div class="bad-review-board-read__info-container">
				<div class="bad-review-board-read__info">
					<a href="/userDetail.do?mId=${sjb.mId }">
					<div class="bad-review-board-read__name">${sjb.mId }</div>
					</a>
				</div>
			</div>
			<div class="bad-review-board-read__content">
				<h1 class="bad-review-board-read__content--title">${sjb.pTitle }</h1>
				<div class="bad-review-board-read__content--hits">${sjb.pDate } ·
					${sjb.pHit }</div>
				<div class="bad-review-board-read__content--article">
					${sjb.pContent }
				</div>
			</div>
			<div class="bad-review-board-read__btn-container">
				<a href="SJblackListBoard.do"><div class="bad-review-board-read__list list-btn">목록</div></a>
				<a href="SJblackListBoardDelete.do?pNum=${sjb.pNum }">
					<input class="bad-review-board-read__delete" type="button" value="삭제" />
				</a>
				<a href="SJblackListBoardUpdateForm.do?pNum=${sjb.pNum }">
					<input class="bad-review-board-read__update" type="button" value="수정" />
				</a>
			</div>
		</div>
	</article>
<%@ include file="chat.jsp"%>
<%@ include file="footer.jsp"%>
</body>
</html>
