<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includeJSP.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>불량거래후기 :: 당근나라</title>
</head>
<body>
	<!-- 섹션 시작 -->
	<section class="section">
		<div class="bad-review">
			<div class="bad-review__head-container">
				<!-- <div class="bad-review__sort">
					<select class="bad-review__category" name="bad-review__category">
						<option value="all" selected>전체</option> 글이 원래 최신순이라 의미 없음
						<option value="date">최근 30일</option> 글이 원래 최신순이라 의미 없음
						<option value="hit">조회순</option> 은 구현해볼만 하지만 여유 있으면 해볼생각
					</select>
				</div> -->
				<div class="bad-review__head">
					<h1 class="bad-review__title">불량거래후기</h1>
					<p class="bad-review__sub">
						<strong class="bad-review__total-head">전체 글</strong>
						<!-- 불러오는 게시글 갯수불러오기 -->
						<span class="bad-review__count">${total }</span>
					</p>
					<a href="JHbadReviewBoardWriteForm.do">
						<div class="bad-review__write">글작성</div>
					</a>
				</div>
			</div>
			<!-- 게시글 내용 -->
			<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
			<ul class="bad-review__content">
				<c:forEach var="jhBoard" items="${jhBoard }">
				<a href="JHbadReviewBoardRead.do?pNum=${jhBoard.pNum}">
					<li>
						<article class="board__content">
							<div class="board__content--text">
								<!-- 게시글 제목불러오기 -->
								<h1>${jhBoard.pTitle }</h1>
								<!-- 게시글 내용 불러오기 -->
								<div class="summary">${jhBoard.pContent }</div>
								<div class="board__content--detail">
									<!-- 실제 게시글에 등록된 날짜, 조회수, 댓글로 변경 -->
									<span>${jhBoard.pDate}
										<div class="vertical"></div> 조회수 ${jhBoard.pHit }
										<div class="vertical"></div> 댓글
										<div class="board__cotent--reply-count">${jhBoard.cCount }</div>
									</span>
								</div>
							</div>
							<div class="board__content--thumbnail">
								<img
									class="thumbnail"
									src="${jhBoard.pImg1 }"
									alt="img-thumbnail"
                                    />
                                    <!-- src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbSBcPc%2FbtqJvTqa9Gk%2FlYM6PkM92vMitI0fQUIhQ1%2Fimg.jpg" -->
                                </div>
						</article>
					</li>
				</a>
				<c:set var="num" value="${num - 1 }"></c:set>
				</c:forEach>
			</ul>
			<!-- 페이징 처리 -->
			<div class="bad-review__page-num-container">
				<ul class="page-num-container">
					<c:if test="${pg.startPage > pg.pageBlock }">
						<a href="JHbadReviewBoard.do?currentPage=${pg.startPage-pg.pageBlock}">
							<li class="page-num-container__left-btn page-num-container__btn">
								<i class="fas fa-chevron-left"></i>
							</li>
						</a>
					</c:if>
					<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">		
						<a href="JHbadReviewBoard.do?currentPage=${i}">
							<li class="page-num-container__num">${i}</li>
						</a>
					</c:forEach>
					<c:if test="${pg.endPage < pg.totalPage }">
						<a href="JHbadReviewBoard.do?currentPage=${pg.startPage + pg.pageBlock}">
							<li class="page-num__right-btn page-num-container__btn">
								<i class="fas fa-chevron-right"></i>
							</li>
						</a>
					</c:if>
				</ul>
			</div>
		</div>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>