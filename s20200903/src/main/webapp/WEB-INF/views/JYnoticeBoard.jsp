<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includeJSP.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>공지사항 :: 당근나라</title>
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
	<!-- 섹션 시작 -->
	<section class="section">
		<div class="notice">
			<div class="notice__head-container">
				<div class="notice__sort">
					<select class="notice__category" name="notice__category">
						<option value="all" selected>전체</option>
						<option value="date">최근 30일</option>
						<option value="hit">조회순</option>
					</select>
				</div>
				<div class="notice__head">
					<h1 class="notice__title">공지사항</h1>
					<p class="notice__sub">
						<strong class="notice__total-head">전체 글</strong>
						<!-- 불러오는 게시글 갯수불러오기 -->
						<span class="notice__count">${pg.total}</span>
					</p>
					<a href="JYnoticeBoardWrite.do"> 
						<div class="notice__write">글작성</div>
					</a>
				</div>
			</div>

			<ul class="notice__content">
				<c:forEach var="jyPost" items="${jyPost_list }">
					<!-- 링크수정하기 -->
					<a href="JYnoticeBoardRead.do?bId=${jyPost.bId}&pNum=${jyPost.pNum}">
					 <!-- 공지사항 상세보기  -->
						<li>
						
							<article class="board__content">
								<div class="board__content--text">
									<!-- 게시글 제목불러오기 -->
									<h1>${jyPost.pTitle }</h1>
									<!-- 게시글 내용 불러오기 -->
									<div class="summary">${jyPost.pContent }</div>
									<div class="board__content--detail">
										 <!-- DB에 들어있는 이 패턴의 날짜를 -->
										<span><fmt:parseDate var="pDate" value="${jyPost.pDate}" pattern="yyyy-MM-dd HH:mm:ss" />
										<!-- 이 패턴으로 바꿔서 뷰에 출력해줌 -->
											<fmt:formatDate value="${pDate}" pattern="yyyy-MM-dd" />
																				
											<div class="vertical"></div> 조회수 ${jyPost.pHit }
										</span>
									</div>
								</div>
								<div class="board__content--thumbnail">
									<!-- 해당 게시글의 썸네일을 불러올 수 있도록 하기 -->
									<img class="thumbnail" src="/s20200903/resources/image/${jyPost.pImg1}" alt="img-thumbnail"/>
									
								</div>
							</article>
					
					</li>
					
					</a>
				</c:forEach>

			</ul>
			<div class="notice__page-num-container">
				<ul class="page-num-container">
					<a href="#">
						<li class="page-num-container__left-btn page-num-container__btn">
							<i class="fas fa-chevron-left"></i>
					</li>
					</a>
					<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
						<a href="JYnoticeBoard.do?currentPage=${i}">
							<li class="page-num-container__num">${i}</li>
						</a>

					</c:forEach>
					<a href="#">
						<li class="page-num__right-btn page-num-container__btn"><i
							class="fas fa-chevron-right"></i></li>
					</a>
				</ul>
			</div>
		</div>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>
