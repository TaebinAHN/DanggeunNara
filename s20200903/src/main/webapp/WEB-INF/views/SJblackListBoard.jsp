<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="includeJSP.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>검거완료 ! :: 당근나라</title>
<link rel="stylesheet" href="css/common.css" />
<script src="javascript/common.js" defer></script>
<script src="https://kit.fontawesome.com/797af710b1.js" crossorigin="anonymous" defer></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" defer></script>
<link rel="shortcut icon" type="image/x-icon" href="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fcz9VUi%2FbtqJt0b2VUe%2FiiBIEnDkufPInk4hKsunE1%2Fimg.png" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&display=swap" rel="stylesheet" />
</head>

<body>

	<!-- 섹션 시작 -->
	<section class="section">
	<div class="black-list">
		<div class="black-list__head-container">
			<div class="black-list__sort">
				<select class="black-list__category" name="black-list__category">
					<option value="all" selected>전체</option>
					<option value="date">최근 30일</option>
					<option value="hit">조회순</option>
				</select>
			</div>
			<div class="black-list__head">
				<h1 class="black-list__title">블랙리스트</h1>
				<p class="black-list__sub">
					<strong class="black-list__total-head">전체 글</strong>
					<!-- 불러오는 게시글 갯수불러오기 -->
					<span class="black-list__count">${pg.total }</span>
				</p>
				<c:if test="${sessionScope.mId == 'admin@dang.com' }">
				<a href="SJblackListBoardWrite.do">
					<div class="black-list__write">글작성</div>
				</a>
				</c:if>
			</div>
		</div>
		<c:forEach var="sjb" items="${SJblackListBoard }">
		<ul class="black-list__content">
			<!-- 링크수정하기 -->
			<a href="SJblackListBoardRead.do?pNum=${sjb.pNum }">
				<li><article class="board__content">
					<div class="board__content--text">
						<!-- 게시글 제목불러오기 -->
						<h1>${sjb.pTitle }</h1>
						<!-- 게시글 내용 불러오기 -->
						<div class="summary">${sjb.pTitle }</div>
						<div class="board__content--detail">
							<span>${sjb.pDate }
								<div class="vertical"></div> 조회수  ${sjb.pHit }
							</span>
						</div>
					</div>
					<div class="board__content--thumbnail">
						<!-- 해당 게시글의 썸네일을 불러올 수 있도록 하기 -->
						<img class="thumbnail"
							src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FQPxGf%2FbtqJsiRI2K7%2FS2jJKSqWue6ZJzPcfH1Gwk%2Fimg.jpg"
							alt="img-thumbnail" />
					</div>
					</article></li>
			</a>
		</ul>
		</c:forEach>
		<div class="user-manage-list__page-num-container">
			<ul class="page-num-container">
				<c:if test="${pg.startPage > pg.pageBlock }">
					<a href="blackListBoard.do?currentPage=${pg.startPage-pg.pageBlock}">
						<li class="page-num-container__left-btn page-num-container__btn">
							<i class="fas fa-chevron-left" />
					</li>
					</a>
				</c:if>
				<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
					<a href="blackListBoard.do?currentPage=${i}">
						<li class="page-num-container__num">${i}</li>
					</a>
				</c:forEach>
				<c:if test="${pg.endPage < pg.totalPage }">
					<a href="blackListBoard.do?currentPage=${pg.startPage+pg.pageBlock}">
						<li class="page-num__right-btn page-num-container__btn"><i
							class="fas fa-chevron-right" /></li>
					</a>
				</c:if>
			</ul>
		</div>
	</div>
	</section>
</body>
<%@ include file="chat.jsp" %>
<%@ include file="footer.jsp" %>

</html>