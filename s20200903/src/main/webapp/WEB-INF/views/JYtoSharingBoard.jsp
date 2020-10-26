<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includeJSP.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>나눔중이에요~! :: 당근나라</title>
<link rel="stylesheet" href="css/common.css" />
<script src="javascript/common.js" defer></script>
<script src="https://kit.fontawesome.com/797af710b1.js" crossorigin="anonymous" defer></script>
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
	<div class="to-sharing">
		<!-- 나눔게시판 시작 -->
		<div class="to-sharing__article-container">
			<div class="to-sharing__head-container">
				<div class="to-sharing__sort">
					<select class="to-sharing__category" name="to-sharing__category">
						<option value="all" selected>전체</option>
						<option value="date">최근 30일</option>
						<option value="picks">관심순</option>
						<option value="hit">조회순</option>
					</select> 
					<select class="to-sharing__category" name="to-sharing__category--code">
						<option value="all" selected>전체</option>
						<option value="digital">디지털/가전</option>
						<option value="furniture">가구/인테리어</option>
						<option value="children">유아동/유아도서</option>
						<option value="life">생활/가공식품</option>
						<option value="sports">스포츠/레저</option>
						<option value="women-acc">여성잡화</option>
						<option value="women-cloth">여성의류</option>
						<option value="men-acc">남성패션/잡화</option>
						<option value="game">게임/취미</option>
						<option value="beauty">뷰티/미용</option>
						<option value="pet">반려동물용품</option>
						<option value="culture">도서/티켓/음반</option>
						<option value="other">기타중고물품</option>
					</select>
				</div>
				<div class="to-sharing__head">
					<h1 class="to-sharing__title">나눔중</h1>
					<p class="to-sharing__sub">
						<strong class="to-sharing__total-head">전체 글</strong>
						<!-- 불러오는 게시글 갯수불러오기 -->
						<span class="to-sharing__count">${pg.total}</span>
					</p>
					<a href="JYtoSharingBoardWrite.do?bId=${jyPost.bId}">
					<div class="to-sharing__write">글작성</div></a>
				</div>
			</div>

			<!-- 각 최신글 9 ~ 12개만 띄어주시면 됩니다 -->
			<div class="to-sharing__content">
				<c:forEach var="jyPost" items="${jyPost_list }"> <!-- list 받아옴 -->
					<article class="to-sharing__article">
						<a
							href="JYtoSharingBoardRead.do?bId=${jyPost.bId}&pNum=${jyPost.pNum}">

							<div class="to-sharing__content--thumbnail">
								<img class="thumbnail" src="/s20200903/resources/image/${jyPost.pImg1}" alt="img-thumbnail"/>
							</div>

							<div class="to-sharing__content--text">
								<h1 class="to-sharing__content--text__title">${jyPost.pTitle }</h1>
								<p class="to-sharing__content--text__address">${jyPost.mAddr }</p>
								<!--주소  -->
								<div class="to-sharing__content--text__date">
									<div class="to-sharing__content--date">
										<fmt:parseDate var="pDate" value="${jyPost.pDate}" pattern="yyyy-MM-dd HH:mm:ss" />
										<fmt:formatDate value="${pDate}" pattern="yyyy-MM-dd" />
									</div>
									<div class="to-sharing__content--hit">조회수 ${jyPost.pHit }</div>
								</div>
								<div class="to-sharing__content--text__price">
								 <div class="to-sharing__content--price">
                                        ${jyPost.pStatus }
                                    </div>

									<div class="to-sharing__content--picks">
										<img
											src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/like-8111aa74d4b1045d7d5943a901896992574dd94c090cef92c26ae53e8da58260.svg"
											alt="picks" />${jyPost.pPicks }
									</div>
								</div>
							</div>
						</a>
					</article>

				</c:forEach>
			</div>
		</div>
		<div class="to-sharing__page-num-container">
			<ul class="page-num-container">
				<a href="#">
					<li class="page-num-container__left-btn page-num-container__btn">
						<i class="fas fa-chevron-left"></i>
				</li>
				</a>
				<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
					<a href="JYtoSharingBoard.do?currentPage=${i}">
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

<%@ include file="footer.jsp" %>
</body>
</html>
