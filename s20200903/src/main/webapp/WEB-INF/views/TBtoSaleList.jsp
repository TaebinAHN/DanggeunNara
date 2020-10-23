<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="includeJSP.jsp" %>
<head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>로그인 :: 당근나라</title>
        <script
            src="https://kit.fontawesome.com/797af710b1.js"
            crossorigin="anonymous"
            defer
        ></script>
        <script
            src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"
            defer
        ></script>
        <link
            rel="shortcut icon"
            type="image/x-icon"
            href="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fcz9VUi%2FbtqJt0b2VUe%2FiiBIEnDkufPInk4hKsunE1%2Fimg.png"
        />
        <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&display=swap"
            rel="stylesheet"
        />
</head>

<body>
    <!-- 섹션 시작 -->
    <!-- 각 input의 value값을 DB에서 가져올 값으로 수정해주세요 --> 
    <section class="section">
        <div class="to-sale-list">
            <h1 class="list-title">내 판매내역</h1>
            <div class="to-sale-list__container">
                <h2 class="to-sale-list__title">거래가능</h1>
                    <!-- 각 최신글 3개만 띄어주시면 됩니다 -->
                    <!-- 판매내역 없을때 띄우기 -->
                    <!-- <div class="to-sale-list__text">
                        <strong>판매 내역이 없어요 !</strong>
                        <a href="../board/toSaleBoard.html"
                            ><p>구경가기</p>
                        </a>
                    </div> -->
                    <!-- 판매내역 있을떄 -->
                    <!-- 각 최신글 3개만 띄어주시면 됩니다 -->
                    <c:if test="${sessionScope.mId != null }">
                    <div class="to-sale-list__content">
                        <!-- 태그 안에 있는 더미 데이터들은 틀을 보기 위함이며 실제 작업시엔 해당 데이터를 불러 올 수 있도록 변경 부탁드립니다. -->
                            <c:forEach var="sPost" items="${hblist }">
                        <article class="to-sale-list__article">
    						<c:if test="${sessionScope.mId == sPost.mid}">   
                            <a href="toSaleBoardRead.do">
                                <div class="to-sale-list__content--thumbnail">
                                    <img src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/3c06cb158997b8cd4061052c6b457887e4c60496704b6149d4197a6d791ad261.webp?q=82&s=300x300&t=crop"
                                        alt="thumbnail" />
                                </div>
                                <div class="to-sale-list__content--text">
                                    <h1 class="to-sale-list__content--text__title">
                                        ${sPost.ptitle}
                                    </h1>
                                    <p class="to-sale-list__content--text__address">
                                        ${sPost.maddr}
                                    </p>
                                    <div class="to-sale-list__content--text__date">
                                        <div class="to-sale-list__content--date">
                                            ${sPost.pdate} 
                                        </div>
                                        <div class="to-sale-list__content--hit">
                                            ${sPost.phit}
                                        </div>
                                    </div>
                                    <div class="to-sale-list__content--text__price">
                                        <div class="to-sale-list__content--price">
                                            ${sPost.pprice}
                                        </div>
                                        <div class="to-sale-list__content--picks">
                                            <img src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/like-8111aa74d4b1045d7d5943a901896992574dd94c090cef92c26ae53e8da58260.svg"
                                                alt="picks" />
                                            ${sPost.ppicks}
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </c:if>
                        </article>
                        </c:forEach>
                      	<c:set var="num" value="${num - 1}"></c:set>
                    </div> 
                        <c:if test="${sPost.mid == null }">
			            <div class="to-buy-list__text">
			            <strong>구매 내역이 없어요 !</strong>
				            <a href="toBuyBoard.do">
				            	<p>구경가기</p>
				            </a>
			            </div>                               
                        </c:if>                      
                    </c:if>
                     
                                     
                    <div class="to-sale-list__page-num-container">
                        <ul class="page-num-container">
                        	<c:if test="${pg.endPage > pg.totalPage }">
							<a href="TBtoSaleListUp.do?currentPage=${pg.startPage-pg.pageBlock}&mId=${sessionScope.mId}"><li class="page-num-container__left-btn page-num-container__btn">
                                   <i class="fas fa-chevron-left"></i></li></a>
                            </c:if>
							<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
								<a href="TBtoSaleListUp.do?currentPage=${i}&mId=${sessionScope.mId}"><li class="page-num-container__num">${i}</li></a>
							</c:forEach>
							<c:if test="${pg.endPage < pg.totalPage }">
							<a href="TBtoSaleListUp.do?currentPage=${pg.startPage+pg.pageBlock}&mId=${sessionScope.mId}"><li class="page-num-container__right-btn page-num-container__btn">
                                   <i class="fas fa-chevron-right"></i></li></a>
                            </c:if>
                        </ul>
                    </div>
                   
            </div>
            <div class="to-sale-list__container">
                <h2 class="to-sale-list__title">거래중</h1>
                    <!-- 각 최신글 3개만 띄어주시면 됩니다 -->
                    <!-- 판매내역 없을때 띄우기 -->
                    <div class="to-sale-list__text">
                        <strong>판매 내역이 없어요 !</strong>
                        <a href="../board/toSaleBoard.html">
                            <p>구경가기</p>
                        </a>
                    </div>
                    <!-- 판매내역 있을떄 -->
                    <!-- <div class="to-sale-list__content">
                        <article class="to-sale-list__article">
                            <a href="../board/toSharingBoardRead.html">
                                <div class="to-sale-list__content--thumbnail">
                                    <img
                                        src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/3c06cb158997b8cd4061052c6b457887e4c60496704b6149d4197a6d791ad261.webp?q=82&s=300x300&t=crop"
                                        alt="thumbnail"
                                    />
                                </div>
                                <div class="to-sale-list__content--text">
                                    <h1
                                        class="to-sale-list__content--text__title"
                                    >
                                        5단 서랍장 입니다
                                    </h1>
                                    <p
                                        class="to-sale-list__content--text__address"
                                    >
                                        서울 송파구 석촌동
                                    </p>
                                    <div
                                        class="to-sale-list__content--text__date"
                                    >
                                        <div class="to-sale-list__content--date">
                                            2020.09.26
                                        </div>
                                        <div class="to-sale-list__content--hit">
                                            조회수 30
                                        </div>
                                    </div>
                                    <div
                                        class="to-sale-list__content--text__price"
                                    >
                                        <div class="to-sale-list__content--price">
                                            무료나눔
                                        </div>
                                        <div class="to-sale-list__content--picks">
                                            <img
                                                src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/like-8111aa74d4b1045d7d5943a901896992574dd94c090cef92c26ae53e8da58260.svg"
                                                alt="picks"
                                            />
                                            4
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </article>
                        <article class="to-sale-list__article">
                            <a href="../board/toSharingBoardRead.html">
                                <div class="to-sale-list__content--thumbnail">
                                    <img
                                        src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/74ead2897bfdc979dfdc817ea9c966c5dfd876d7479410549c8ceefc29271ebf.webp?q=82&s=300x300&t=crop"
                                        alt="thumbnail"
                                    />
                                </div>
                                <div class="to-sale-list__content--text">
                                    <h1
                                        class="to-sale-list__content--text__title"
                                    >
                                        스위스크로스 캠핑체어 팝니다.
                                    </h1>
                                    <p
                                        class="to-sale-list__content--text__address"
                                    >
                                        서울 송파구 석촌동
                                    </p>
                                    <div
                                        class="to-sale-list__content--text__date"
                                    >
                                        <div class="to-sale-list__content--date">
                                            2020.09.25
                                        </div>
                                        <div class="to-sale-list__content--hit">
                                            조회수 30
                                        </div>
                                    </div>
                                    <div
                                        class="to-sale-list__content--text__price"
                                    >
                                        <div class="to-sale-list__content--price">
                                            무료나눔
                                        </div>
                                        <div class="to-sale-list__content--picks">
                                            <img
                                                src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/like-8111aa74d4b1045d7d5943a901896992574dd94c090cef92c26ae53e8da58260.svg"
                                                alt="picks"
                                            />
                                            1
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </article>
                        <article class="to-sale-list__article">
                             <a href="../board/toSharingBoardRead.html">
                                <div class="to-sale-list__content--thumbnail">
                                    <img
                                        src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/e109941c1a68f4bef813c0a46f20ab1060b67f92c7510a14c83cdb76ef77ba1d.webp?q=82&s=300x300&t=crop"
                                        alt="thumbnail"
                                    />
                                </div>
                                <div class="to-sale-list__content--text">
                                    <h1
                                        class="to-sale-list__content--text__title"
                                    >
                                        6단 미니벨로 자전거 짐받이, 싸게팔아요
                                    </h1>
                                    <p
                                        class="to-sale-list__content--text__address"
                                    >
                                        서울 송파구 석촌동
                                    </p>
                                    <div
                                        class="to-sale-list__content--text__date"
                                    >
                                        <div class="to-sale-list__content--date">
                                            2020.09.22
                                        </div>
                                        <div class="to-sale-list__content--hit">
                                            조회수 142
                                        </div>
                                    </div>
                                    <div
                                        class="to-sale-list__content--text__price"
                                    >
                                        <div class="to-sale-list__content--price">
                                            무료나눔
                                        </div>
                                        <div class="to-sale-list__content--picks">
                                            <img
                                                src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/like-8111aa74d4b1045d7d5943a901896992574dd94c090cef92c26ae53e8da58260.svg"
                                                alt="picks"
                                            />
                                            25
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </article>
                    </div>
                    <div class="to-sale-list__page-num-container">
                        <ul class="page-num-container">
                            <a href="#">
                                <li
                                    class="page-num-container__left-btn page-num-container__btn"
                                >
                                    <i class="fas fa-chevron-left"></i>
                                </li>
                            </a>
                            <a href="#">
                                <li class="page-num-container__num">1</li>
                            </a>
                            <a href="#">
                                <li class="page-num-container__num">2</li>
                            </a>
                            <a href="#">
                                <li class="page-num-container__num">3</li>
                            </a>
                            <a href="#">
                                <li class="page-num-container__num">4</li>
                            </a>
                            <a href="#">
                                <li class="page-num-container__num">5</li>
                            </a>
                            <a href="#">
                                <li
                                    class="page-num__right-btn page-num-container__btn"
                                >
                                    <i class="fas fa-chevron-right"></i>
                                </li>
                            </a>
                        </ul>
                    </div> -->
            </div>
            <div class="to-sale-list__container">
                <h2 class="to-sale-list__title">거래완료</h1>
                    <!-- 각 최신글 3개만 띄어주시면 됩니다 -->
                    <!-- 판매내역 없을때 띄우기 -->
                    <div class="to-sale-list__text">
                        <strong>판매 내역이 없어요 !</strong>
                        <a href="../board/toSaleBoard.html">
                            <p>구경가기</p>
                        </a>
                    </div>
                    <!-- 판매내역 있을떄 -->
                    <!-- <div class="to-sale-list__content">
                        <article class="to-sale-list__article">
                            <a href="../board/toSharingBoardRead.html">
                                <div class="to-sale-list__content--thumbnail">
                                    <img
                                        src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/3c06cb158997b8cd4061052c6b457887e4c60496704b6149d4197a6d791ad261.webp?q=82&s=300x300&t=crop"
                                        alt="thumbnail"
                                    />
                                </div>
                                <div class="to-sale-list__content--text">
                                    <h1
                                        class="to-sale-list__content--text__title"
                                    >
                                        5단 서랍장 입니다
                                    </h1>
                                    <p
                                        class="to-sale-list__content--text__address"
                                    >
                                        서울 송파구 석촌동
                                    </p>
                                    <div
                                        class="to-sale-list__content--text__date"
                                    >
                                        <div class="to-sale-list__content--date">
                                            2020.09.26
                                        </div>
                                        <div class="to-sale-list__content--hit">
                                            조회수 30
                                        </div>
                                    </div>
                                    <div
                                        class="to-sale-list__content--text__price"
                                    >
                                        <div class="to-sale-list__content--price">
                                            무료나눔
                                        </div>
                                        <div class="to-sale-list__content--picks">
                                            <img
                                                src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/like-8111aa74d4b1045d7d5943a901896992574dd94c090cef92c26ae53e8da58260.svg"
                                                alt="picks"
                                            />
                                            4
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </article>
                        <article class="to-sale-list__article">
                            <a href="../board/toSharingBoardRead.html">
                                <div class="to-sale-list__content--thumbnail">
                                    <img
                                        src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/74ead2897bfdc979dfdc817ea9c966c5dfd876d7479410549c8ceefc29271ebf.webp?q=82&s=300x300&t=crop"
                                        alt="thumbnail"
                                    />
                                </div>
                                <div class="to-sale-list__content--text">
                                    <h1
                                        class="to-sale-list__content--text__title"
                                    >
                                        스위스크로스 캠핑체어 팝니다.
                                    </h1>
                                    <p
                                        class="to-sale-list__content--text__address"
                                    >
                                        서울 송파구 석촌동
                                    </p>
                                    <div
                                        class="to-sale-list__content--text__date"
                                    >
                                        <div class="to-sale-list__content--date">
                                            2020.09.25
                                        </div>
                                        <div class="to-sale-list__content--hit">
                                            조회수 30
                                        </div>
                                    </div>
                                    <div
                                        class="to-sale-list__content--text__price"
                                    >
                                        <div class="to-sale-list__content--price">
                                            무료나눔
                                        </div>
                                        <div class="to-sale-list__content--picks">
                                            <img
                                                src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/like-8111aa74d4b1045d7d5943a901896992574dd94c090cef92c26ae53e8da58260.svg"
                                                alt="picks"
                                            />
                                            1
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </article>
                        <article class="to-sale-list__article">
                             <a href="../board/toSharingBoardRead.html">
                                <div class="to-sale-list__content--thumbnail">
                                    <img
                                        src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/e109941c1a68f4bef813c0a46f20ab1060b67f92c7510a14c83cdb76ef77ba1d.webp?q=82&s=300x300&t=crop"
                                        alt="thumbnail"
                                    />
                                </div>
                                <div class="to-sale-list__content--text">
                                    <h1
                                        class="to-sale-list__content--text__title"
                                    >
                                        6단 미니벨로 자전거 짐받이, 싸게팔아요
                                    </h1>
                                    <p
                                        class="to-sale-list__content--text__address"
                                    >
                                        서울 송파구 석촌동
                                    </p>
                                    <div
                                        class="to-sale-list__content--text__date"
                                    >
                                        <div class="to-sale-list__content--date">
                                            2020.09.22
                                        </div>
                                        <div class="to-sale-list__content--hit">
                                            조회수 142
                                        </div>
                                    </div>
                                    <div
                                        class="to-sale-list__content--text__price"
                                    >
                                        <div class="to-sale-list__content--price">
                                            무료나눔
                                        </div>
                                        <div class="to-sale-list__content--picks">
                                            <img
                                                src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/like-8111aa74d4b1045d7d5943a901896992574dd94c090cef92c26ae53e8da58260.svg"
                                                alt="picks"
                                            />
                                            25
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </article>
                    </div>
                    <div class="to-sale-list__page-num-container">
                        <ul class="page-num-container">
                            <a href="#">
                                <li
                                    class="page-num-container__left-btn page-num-container__btn"
                                >
                                    <i class="fas fa-chevron-left"></i>
                                </li>
                            </a>
                            <a href="#">
                                <li class="page-num-container__num">1</li>
                            </a>
                            <a href="#">
                                <li class="page-num-container__num">2</li>
                            </a>
                            <a href="#">
                                <li class="page-num-container__num">3</li>
                            </a>
                            <a href="#">
                                <li class="page-num-container__num">4</li>
                            </a>
                            <a href="#">
                                <li class="page-num-container__num">5</li>
                            </a>
                            <a href="#">
                                <li
                                    class="page-num__right-btn page-num-container__btn"
                                >
                                    <i class="fas fa-chevron-right"></i>
                                </li>
                            </a>
                        </ul>
                    </div> -->
            </div>
            <div class="to-sale-list__container">
                <h2 class="to-sale-list__title">당도측정</h1>
                    <!-- 각 최신글 3개만 띄어주시면 됩니다 -->
                    <!-- 측정내역 없을때 띄우기 -->
                    <!-- <div class="to-sale-list__text">
                            <strong>측정을 기다리고있는 내역이 없습니다 !</strong>
                        </div> -->
                    <!-- 피거래자 입장에서 거래가 완료됐을경우 띄우기 -->
                    <div class="to-sale-list__content">
                        <article class="to-sale-list__article">
                            <a href="../board/toSharingBoardRead.html">
                                <div class="to-sale-list__content--thumbnail">
                                    <img src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/3c06cb158997b8cd4061052c6b457887e4c60496704b6149d4197a6d791ad261.webp?q=82&s=300x300&t=crop"
                                        alt="thumbnail" />
                                </div>
                                <div class="to-sale-list__content--text">
                                    <h1 class="to-sale-list__content--text__title">
                                        5단 서랍장 입니다
                                    </h1>
                                    <p class="to-sale-list__content--text__address">
                                        서울 송파구 석촌동
                                    </p>
                                    <div class="to-sale-list__content--text__date">
                                        <div class="to-sale-list__content--date">
                                            2020.09.26
                                        </div>
                                        <div class="to-sale-list__content--hit">
                                            조회수 30
                                        </div>
                                    </div>

                                </div>
                            </a>
                            <div class="sweet-rating__container">
                                <p class="sweet-rating-link">당도측정</p>
                                <!-- 측정 완료후 해당 게시글 리스트 x -->
                                <input class="sweet-rating-btn" type="button" value="완료">
                                <div class="sweet-rating">
                                    <a href="#" class="on"><i class="fas fa-carrot"></i></a>
                                    <a href="#" class="on"><i class="fas fa-carrot"></i></a>
                                    <a href="#" class="on"><i class="fas fa-carrot"></i></a>
                                    <a href="#"><i class="fas fa-carrot"></i></a>
                                    <a href="#"><i class="fas fa-carrot"></i></a>
                                </div>
                            </div>
                        </article>
                        <article class="to-sale-list__article">
                            <a href="../board/toSharingBoardRead.html">
                                <div class="to-sale-list__content--thumbnail">
                                    <img src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/74ead2897bfdc979dfdc817ea9c966c5dfd876d7479410549c8ceefc29271ebf.webp?q=82&s=300x300&t=crop"
                                        alt="thumbnail" />
                                </div>
                                <div class="to-sale-list__content--text">
                                    <h1 class="to-sale-list__content--text__title">
                                        스위스크로스 캠핑체어 팝니다.
                                    </h1>
                                    <p class="to-sale-list__content--text__address">
                                        서울 송파구 석촌동
                                    </p>
                                    <div class="to-sale-list__content--text__date">
                                        <div class="to-sale-list__content--date">
                                            2020.09.25
                                        </div>
                                        <div class="to-sale-list__content--hit">
                                            조회수 30
                                        </div>
                                    </div>

                                </div>
                            </a>
                            <div class="sweet-rating__container">
                                <p class="sweet-rating-link">당도측정</p>
                                <input class="sweet-rating-btn" type="button" value="완료">
                                <div class="sweet-rating">
                                    <a href="#" class="on"><i class="fas fa-carrot"></i></a>
                                    <a href="#" class="on"><i class="fas fa-carrot"></i></a>
                                    <a href="#" class="on"><i class="fas fa-carrot"></i></a>
                                    <a href="#"><i class="fas fa-carrot"></i></a>
                                    <a href="#"><i class="fas fa-carrot"></i></a>
                                </div>
                            </div>
                        </article>
                        <article class="to-sale-list__article">
                            <a href="../board/toSharingBoardRead.html">
                                <div class="to-sale-list__content--thumbnail">
                                    <img src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/e109941c1a68f4bef813c0a46f20ab1060b67f92c7510a14c83cdb76ef77ba1d.webp?q=82&s=300x300&t=crop"
                                        alt="thumbnail" />
                                </div>
                                <div class="to-sale-list__content--text">
                                    <h1 class="to-sale-list__content--text__title">
                                        6단 미니벨로 자전거 짐받이, 싸게팔아요
                                    </h1>
                                    <p class="to-sale-list__content--text__address">
                                        서울 송파구 석촌동
                                    </p>
                                    <div class="to-sale-list__content--text__date">
                                        <div class="to-sale-list__content--date">
                                            2020.09.22
                                        </div>
                                        <div class="to-sale-list__content--hit">
                                            조회수 142
                                        </div>
                                    </div>

                                </div>
                            </a>
                            <div class="sweet-rating__container">
                                <p class="sweet-rating-link">당도측정</p>
                                <input class="sweet-rating-btn" type="button" value="완료">
                                <div class="sweet-rating">
                                    <a href="#" class="on"><i class="fas fa-carrot"></i></a>
                                    <a href="#" class="on"><i class="fas fa-carrot"></i></a>
                                    <a href="#" class="on"><i class="fas fa-carrot"></i></a>
                                    <a href="#"><i class="fas fa-carrot"></i></a>
                                    <a href="#"><i class="fas fa-carrot"></i></a>
                                </div>
                            </div>
                        </article>
                    </div>
                    <div class="to-sale-list__page-num-container">
                        <ul class="page-num-container">
                            <a href="#">
                                <li class="page-num-container__left-btn page-num-container__btn">
                                    <i class="fas fa-chevron-left"></i>
                                </li>
                            </a>
                            <a href="#">
                                <li class="page-num-container__num">1</li>
                            </a>
                            <a href="#">
                                <li class="page-num-container__num">2</li>
                            </a>
                            <a href="#">
                                <li class="page-num-container__num">3</li>
                            </a>
                            <a href="#">
                                <li class="page-num-container__num">4</li>
                            </a>
                            <a href="#">
                                <li class="page-num-container__num">5</li>
                            </a>
                            <a href="#">
                                <li class="page-num__right-btn page-num-container__btn">
                                    <i class="fas fa-chevron-right"></i>
                                </li>
                            </a>
                        </ul>
                    </div>
               
            </div>
        </div>
    </section>
    <!-- 실시간 채팅 아이콘 -->
    <div class="chat-container">
        <div class="chat-container__relative">
            <div class="chat-container__icon">
                <!-- 새로운 메세지 있을때만 -->
                <div class="chat-container__icon--new">N</div>
            </div>
            <div class="chat-container__items">
                <div class="chat-container__header">chat</div>
                <ul class="chat-container__list">
                    <li class="chat-container__item">
                        <a class="chat-container__link" href="#none">
                            <div class="chat-container__text">
                                <strong class="chat-container__nick">닉네임</strong>
                                <p class="chat-container__summary">
                                    채팅창 메세지채팅창 메세지채팅창
                                    메세지채팅창 메세지채팅창 메세지채팅창
                                    메세지채팅창 메세지채팅창 메세지채팅창
                                    메세지
                                </p>
                            </div>
                            <div class="chat-container__info">
                                <p class="chat-container__date">
                                    2020.10.06
                                </p>
                            </div>
                        </a>
                        <div class="chat-container__delete">
                            나가기
                            <img
                                src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAABmJLR0QA/wD/AP+gvaeTAAACnElEQVR4nO3dv27TUABG8dMIJoYWMTPwEjwBCwNigJYKCnRB8HRI7IzsMMLUFTGlCDFAKQwu0D/XECfXvZ/q85O8VIl95RO7SnzjADwDvgI/J7bsA9uEWQO+AFdaD6SROXANOGw9kN/W6F4tU3aVLkyEWesB6KRLhb/doDu/XkTrwF7rQfxLKcicoEO4svjTs6esMAYJY5AwBgljkDAGCWOQMAYJY5AwBgljkDAGCWOQMAYJY5AwBglTukB1kc3p5hHE8ggJY5AwBgljkDAGCWOQMAYJY5DhrgOvgNfArTE2cHqa/sYYG7lAXvJ3X30HNmtvwCDDvOHk/qoexSDD3KaLcDrKVq0NGGS4e8A3Tu63A2CnxsoNspz7nD1SqkQxyPJGiWKQ1VSPYpDVbVKO8niZlRmkjmpRDFLPFuUoT4asxCB1rRzFIPU9oBzl6SJPNsg4SlF+sEAUg4xnm+7IGBTFIOPqi7Lb9wSDjG+XLsLx/XwIvCg92CDnY+EorYLsAJ8K25/acub01SLIZaZ507S+5YCjm6m1uqY+OxqIClocIQAPgY+F7U9tiThlTVHfP/Xnpx9okPGVYvS+FzHIuAa/WzfIePzoJMjSn/gapL6+GAtdEzFIXV6gCtIXY9B1dYPU4SSHIH0xlpqbZZDVOFEuiFNJgzjZOkjf1xEe1Vi5QYa5i1/YifKBszH8SltD7xgxBhhkqJvAW+A9cGeMDRgkiDcOCGOQMAYJY5AwBgljkDAGCTO1IBuEv++aWpB4BgljkDAGCWOQMAYJY5AwBgljkDAGCWOQMAYJY5AwBgljkDAGCVP6YckNwn98cQXrrQfwP6Uge+c+Cv3hKSvMDNhvPYiG5sDn1oM4bkZ3z78pRpnT3RrpsPVAjvsFW3N9LhOsh0kAAAAASUVORK5CYII=" />
                        </div>
                        <div class="chat-container__new">N</div>
                    </li>
                </ul>
            </div>
            <!-- 채팅방 -->
            <div class="chat-container__chat-room">
                <div class="chat-container__chat-room--header">
                    <a class="chat-container__chat-room--back" href="#none"><i class="fas fa-arrow-left"></i></a>상대방 닉네임
                </div>
                <ul class="chat-container__chat-room__list">
                    <li class="chat-container__chat-room__received">
                        <div class="message__img">
                            <i class="fas fa-carrot"></i>
                        </div>
                        <div class="message__container">
                            <div class="message__author">
                                <a href="../member/userDetail.html">상대방아이디</a><span
                                    class="message__container--date">2020.10.06 16:04</span>
                            </div>
                            <div class="message__content-received">
                                Congrats XD <br />
                                Congrats XD <br />
                            </div>
                        </div>
                    </li>
                    <li class="chat-container__chat-room__sent">
                        <div class="message__container-sent">
                            <div class="message__author">
                                <span class="message__container--date">2020.10.06 16:08</span>
                            </div>
                            <div class="message__content-sent">
                                Congrats XD <br />
                                Congrats XD <br />
                            </div>
                        </div>
                    </li>
                    <li class="chat-container__chat-room__received">
                        <div class="message__img">
                            <i class="fas fa-carrot"></i>
                        </div>
                        <div class="message__container">
                            <div class="message__author">
                                <a href="../member/userDetail.html">상대방아이디</a><span
                                    class="message__container--date">2020.10.06 16:04</span>
                            </div>
                            <div class="message__content-received">
                                Congrats XD <br />
                                Congrats XD <br />
                            </div>
                        </div>
                    </li>
                    <li class="chat-container__chat-room__sent">
                        <div class="message__container-sent">
                            <div class="message__author">
                                <span class="message__container--date">2020.10.06 16:08</span>
                            </div>
                            <div class="message__content-sent">
                                Congrats XD <br />
                                Congrats XD <br />
                            </div>
                        </div>
                    </li>
                    <li class="chat-container__chat-room__sent">
                        <div class="message__container-sent">
                            <div class="message__author">
                                <span class="message__container--date">2020.10.06 16:08</span>
                            </div>
                            <div class="message__content-sent">
                                Congrats XD <br />
                                Congrats XD <br />
                            </div>
                        </div>
                    </li>
                    <li class="chat-container__chat-room__sent">
                        <div class="message__container-sent">
                            <div class="message__author">
                                <span class="message__container--date">2020.10.06 16:08</span>
                            </div>
                            <div class="message__content-sent">
                                Congrats XD <br />
                                Congrats XD <br />
                            </div>
                        </div>
                    </li>
                    <li class="chat-container__chat-room__sent">
                        <div class="message__container-sent">
                            <div class="message__author">
                                <span class="message__container--date">2020.10.06 16:08</span>
                            </div>
                            <div class="message__content-sent">
                                Congrats XD <br />
                                Congrats XD <br />
                            </div>
                        </div>
                    </li>
                    <li class="chat-container__chat-room__sent">
                        <div class="message__container-sent">
                            <div class="message__author">
                                <span class="message__container--date">2020.10.06 16:08</span>
                            </div>
                            <div class="message__content-sent">
                                Congrats XD <br />
                                Congrats XD <br />
                            </div>
                        </div>
                    </li>
                </ul>
                <div class="chat-container__chat-room__footer">
                    <input class="chat-container__chat-room__footer--input" type="text" placeholder="Send message" />
                </div>
            </div>
        </div>
    </div>
<%@ include file="footer.jsp" %>
</body>

</html>