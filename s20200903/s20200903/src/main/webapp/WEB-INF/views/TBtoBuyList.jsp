<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>구매내역 :: 당근나라</title>
    <link rel="stylesheet" href="../../css/common.css" />
    <script src="../../javascript/common.js" defer></script>
    <script src="https://kit.fontawesome.com/797af710b1.js" crossorigin="anonymous" defer></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="shortcut icon" type="image/x-icon"
        href="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fcz9VUi%2FbtqJt0b2VUe%2FiiBIEnDkufPInk4hKsunE1%2Fimg.png" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&display=swap"
        rel="stylesheet" />
</head>

<body>
    <!-- 메뉴 고정바 -->
    <header class="header">
        <div class="header__fixed-bar">
            <section class="header__fixed-bar-logo section-logo">
                <a href="../main/main.html">
                    <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FSQxEt%2FbtqJs5kkQnP%2FhvX1kh8aeqli9J93tF5qV1%2Ftfile.svg"
                        alt="당근나라" />
                </a>
            </section>
            <section class="header__fixed-bar-search section-search">
                <div class="header__fixed-bar-search-container">
                    <input class="search-input" type="text" placeholder="동네 이름, 물품명 등을 검색해보세요!" />
                    <input type="image" class="search-icon"
                        src="https://img.icons8.com/ios-glyphs/30/000000/search.png" />
                </div>
            </section>
            <section class="header__fixed-bar-nav section-nav">
                <nav class="header__fixed-bar-nav-container">
                    <ul class="header__fixed-bar-nav-list nav-list">
                        <li class="nav-list-content drop">
                            <span class="nav-list-text">
                                Welcome ~!
                                <!-- 로그인 회원에 따라서 이름 바뀌게 작업 -->
                                <span class="name">이준호</span>님 </span><img
                                src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABmJLR0QA/wD/AP+gvaeTAAAA1ElEQVRIie2TsQ3CMBBF/zkLpMQLQO9zmV2IBBINJZQZgDAAVRAj0FBlhrRZwV1GwDQGhUhJnFQg+Xdn371nyzIQEvJfYeZMa50DEDPGBTOfmTn7Wuw0xdbaIzMXEyXCzRwAxO2NqF0YY0op5YKItlLKVZIk97qurQf8CiAFcKuqag/gMxN1u40xDydJm6ZZjkje8LWDbwA8e28wUTIK7xV4SLzgg4IBCfnCAYCGBK3TFnCP6NZSH7ivAABIKXUhop2rveBTI7TWuVLqhHkfMSTkV/MCeGNw/fvNnQwAAAAASUVORK5CYII=" />
                            <ul class="drop__container">
                                <a href="../member/myPage.html">
                                    <li>마이페이지</li>
                                </a>
                                <a href="../member/picksList.html">
                                    <li>관심목록</li>
                                </a>
                                <a href="../member/toSaleList.html">
                                    <li>판매내역</li>
                                </a>
                                <a href="../member/toBuyList.html">
                                    <li>구매내역</li>
                                </a>
                                <a href="../member/toSharingList.html">
                                    <li>나눔내역</li>
                                </a>
                                <a href="#">
                                    <li>로그아웃</li>
                                </a>
                            </ul>
                        </li>
                        <li class="nav-list-content">
                            <a href="#">지도로 보기</a>
                        </li>
                    </ul>
                </nav>
            </section>
        </div>
    </header>
    <!-- 메뉴 목록 리스트 -->
    <aside class="fixed__list">
        <ul>
            <li><a href="../board/noticeBoard.html">공지사항</a></li>
            <li><a href="../board/blackListBoard.html">검거완료 !</a></li>
            <li>
                <a href="../board/badReviewBoard.html">불량거래 후기</a>
            </li>
            <li><a href="../board/toSaleBoard.html">판매중 이에요.</a></li>
            <li>
                <a href="../board/toSharingBoard.html">나눔중 이에요.</a>
            </li>
            <li><a href="../board/toBuyBoard.html">구매합니다 ~!</a></li>
        </ul>
    </aside>
    <!-- 섹션 시작 -->
    <!-- 각 input의 value값을 DB에서 가져올 값으로 수정해주세요 -->
    <section class="section">
        <div class="to-buy-list">
            <h1 class="list-title">내 구매내역</h1>
            <div class="to-buy-list__container">
                <h2 class="to-buy-list__title">거래가능</h1>
                    <!-- 각 최신글 3개만 띄어주시면 됩니다 -->
                    <!-- 구매내역 없을때 띄우기 -->
                    <!-- <div class="to-buy-list__text">
                        <strong>구매 내역이 없어요 !</strong>
                        <a href="../board/toBuyBoard.html"
                            ><p>구경가기</p>
                        </a>
                    </div> -->
                    <!-- 구매내역 있을때 -->
                    <!-- 각 최신글 3개만 띄어주시면 됩니다 -->
                    <div class="to-buy-list__content">
                        <!-- 태그 안에 있는 더미 데이터들은 틀을 보기 위함이며 실제 작업시엔 해당 데이터를 불러 올 수 있도록 변경 부탁드립니다. -->
                        <article class="to-buy-list__article">
                            <a href="../board/toBuyBoardRead.html">
                                <div class="to-buy-list__content--thumbnail">
                                    <img src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/3c06cb158997b8cd4061052c6b457887e4c60496704b6149d4197a6d791ad261.webp?q=82&s=300x300&t=crop"
                                        alt="thumbnail" />
                                </div>
                                <div class="to-buy-list__content--text">
                                    <h1 class="to-buy-list__content--text__title">
                                        5단 서랍장 입니다
                                    </h1>
                                    <p class="to-buy-list__content--text__address">
                                        서울 송파구 석촌동
                                    </p>
                                    <div class="to-buy-list__content--text__date">
                                        <div class="to-buy-list__content--date">
                                            2020.09.26
                                        </div>
                                        <div class="to-buy-list__content--hit">
                                            조회수 30
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </article>
                        <!-- 이 아래부턴 삭제 부탁드립니다. -->
                        <article class="to-buy-list__article">
                            <a href="../board/toBuyBoardRead.html">
                                <div class="to-buy-list__content--thumbnail">
                                    <img src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/74ead2897bfdc979dfdc817ea9c966c5dfd876d7479410549c8ceefc29271ebf.webp?q=82&s=300x300&t=crop"
                                        alt="thumbnail" />
                                </div>
                                <div class="to-buy-list__content--text">
                                    <h1 class="to-buy-list__content--text__title">
                                        스위스크로스 캠핑체어 팝니다.
                                    </h1>
                                    <p class="to-buy-list__content--text__address">
                                        서울 송파구 석촌동
                                    </p>
                                    <div class="to-buy-list__content--text__date">
                                        <div class="to-buy-list__content--date">
                                            2020.09.25
                                        </div>
                                        <div class="to-buy-list__content--hit">
                                            조회수 30
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </article>
                        <article class="to-buy-list__article">
                            <a href="../board/toBuyBoardRead.html">
                                <div class="to-buy-list__content--thumbnail">
                                    <img src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/e109941c1a68f4bef813c0a46f20ab1060b67f92c7510a14c83cdb76ef77ba1d.webp?q=82&s=300x300&t=crop"
                                        alt="thumbnail" />
                                </div>
                                <div class="to-buy-list__content--text">
                                    <h1 class="to-buy-list__content--text__title">
                                        6단 미니벨로 자전거 짐받이, 싸게팔아요
                                    </h1>
                                    <p class="to-buy-list__content--text__address">
                                        서울 송파구 석촌동
                                    </p>
                                    <div class="to-buy-list__content--text__date">
                                        <div class="to-buy-list__content--date">
                                            2020.09.22
                                        </div>
                                        <div class="to-buy-list__content--hit">
                                            조회수 142
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </article>
                    </div>
                    <div class="to-buy-list__page-num-container">
                        <ul class="page-num-container">
                            <a href="#">
                                <li class="page-num-container__left-btn page-num-container__btn">
                                    <i class="fas fa-chevron-left"></i>
                                </li>
                            </a>
                            <a href="#">
                                <li class="page-num-container__num">1</li>
                            </a>
                            <!-- 더미데이터 -->
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
                            <!-- 더미데이터 -->
                            <a href="#">
                                <li class="page-num__right-btn page-num-container__btn">
                                    <i class="fas fa-chevron-right"></i>
                                </li>
                            </a>
                        </ul>
                    </div>
            </div>
            <div class="to-buy-list__container">
                <h2 class="to-buy-list__title">거래중</h1>
                    <!-- 각 최신글 3개만 띄어주시면 됩니다 -->
                    <!-- 구매내역 없을때 띄우기 -->
                    <div class="to-buy-list__text">
                        <strong>구매 내역이 없어요 !</strong>
                        <a href="../board/toBuyBoard.html">
                            <p>구경가기</p>
                        </a>
                    </div>
                    <!-- 구매내역 있을때 -->
                    <!-- <div class="to-buy-list__content">
                        <article class="to-buy-list__article">
                            <a href="../board/toSharingBoardRead.html">
                                <div class="to-buy-list__content--thumbnail">
                                    <img
                                        src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/3c06cb158997b8cd4061052c6b457887e4c60496704b6149d4197a6d791ad261.webp?q=82&s=300x300&t=crop"
                                        alt="thumbnail"
                                    />
                                </div>
                                <div class="to-buy-list__content--text">
                                    <h1
                                        class="to-buy-list__content--text__title"
                                    >
                                        5단 서랍장 입니다
                                    </h1>
                                    <p
                                        class="to-buy-list__content--text__address"
                                    >
                                        서울 송파구 석촌동
                                    </p>
                                    <div
                                        class="to-buy-list__content--text__date"
                                    >
                                        <div class="to-buy-list__content--date">
                                            2020.09.26
                                        </div>
                                        <div class="to-buy-list__content--hit">
                                            조회수 30
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </article>
                        <article class="to-buy-list__article">
                            <a href="../board/toSharingBoardRead.html">
                                <div class="to-buy-list__content--thumbnail">
                                    <img
                                        src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/74ead2897bfdc979dfdc817ea9c966c5dfd876d7479410549c8ceefc29271ebf.webp?q=82&s=300x300&t=crop"
                                        alt="thumbnail"
                                    />
                                </div>
                                <div class="to-buy-list__content--text">
                                    <h1
                                        class="to-buy-list__content--text__title"
                                    >
                                        스위스크로스 캠핑체어 팝니다.
                                    </h1>
                                    <p
                                        class="to-buy-list__content--text__address"
                                    >
                                        서울 송파구 석촌동
                                    </p>
                                    <div
                                        class="to-buy-list__content--text__date"
                                    >
                                        <div class="to-buy-list__content--date">
                                            2020.09.25
                                        </div>
                                        <div class="to-buy-list__content--hit">
                                            조회수 30
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </article>
                        <article class="to-buy-list__article">
                             <a href="../board/toSharingBoardRead.html">
                                <div class="to-buy-list__content--thumbnail">
                                    <img
                                        src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/e109941c1a68f4bef813c0a46f20ab1060b67f92c7510a14c83cdb76ef77ba1d.webp?q=82&s=300x300&t=crop"
                                        alt="thumbnail"
                                    />
                                </div>
                                <div class="to-buy-list__content--text">
                                    <h1
                                        class="to-buy-list__content--text__title"
                                    >
                                        6단 미니벨로 자전거 짐받이, 싸게팔아요
                                    </h1>
                                    <p
                                        class="to-buy-list__content--text__address"
                                    >
                                        서울 송파구 석촌동
                                    </p>
                                    <div
                                        class="to-buy-list__content--text__date"
                                    >
                                        <div class="to-buy-list__content--date">
                                            2020.09.22
                                        </div>
                                        <div class="to-buy-list__content--hit">
                                            조회수 142
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </article>
                    </div>
                    <div class="to-buy-list__page-num-container">
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
            <div class="to-buy-list__container">
                <h2 class="to-buy-list__title">거래완료</h1>
                    <!-- 각 최신글 3개만 띄어주시면 됩니다 -->
                    <!-- 구매내역 없을때 띄우기 -->
                    <div class="to-buy-list__text">
                        <strong>구매 내역이 없어요 !</strong>
                        <a href="../board/toBuyBoard.html">
                            <p>구경가기</p>
                        </a>
                    </div>
                    <!-- 구매내역 있을때 -->
                    <!-- <div class="to-buy-list__content">
                        <article class="to-buy-list__article">
                            <a href="../board/toSharingBoardRead.html">
                                <div class="to-buy-list__content--thumbnail">
                                    <img
                                        src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/3c06cb158997b8cd4061052c6b457887e4c60496704b6149d4197a6d791ad261.webp?q=82&s=300x300&t=crop"
                                        alt="thumbnail"
                                    />
                                </div>
                                <div class="to-buy-list__content--text">
                                    <h1
                                        class="to-buy-list__content--text__title"
                                    >
                                        5단 서랍장 입니다
                                    </h1>
                                    <p
                                        class="to-buy-list__content--text__address"
                                    >
                                        서울 송파구 석촌동
                                    </p>
                                    <div
                                        class="to-buy-list__content--text__date"
                                    >
                                        <div class="to-buy-list__content--date">
                                            2020.09.26
                                        </div>
                                        <div class="to-buy-list__content--hit">
                                            조회수 30
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </article>
                        <article class="to-buy-list__article">
                            <a href="../board/toSharingBoardRead.html">
                                <div class="to-buy-list__content--thumbnail">
                                    <img
                                        src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/74ead2897bfdc979dfdc817ea9c966c5dfd876d7479410549c8ceefc29271ebf.webp?q=82&s=300x300&t=crop"
                                        alt="thumbnail"
                                    />
                                </div>
                                <div class="to-buy-list__content--text">
                                    <h1
                                        class="to-buy-list__content--text__title"
                                    >
                                        스위스크로스 캠핑체어 팝니다.
                                    </h1>
                                    <p
                                        class="to-buy-list__content--text__address"
                                    >
                                        서울 송파구 석촌동
                                    </p>
                                    <div
                                        class="to-buy-list__content--text__date"
                                    >
                                        <div class="to-buy-list__content--date">
                                            2020.09.25
                                        </div>
                                        <div class="to-buy-list__content--hit">
                                            조회수 30
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </article>
                        <article class="to-buy-list__article">
                             <a href="../board/toSharingBoardRead.html">
                                <div class="to-buy-list__content--thumbnail">
                                    <img
                                        src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/e109941c1a68f4bef813c0a46f20ab1060b67f92c7510a14c83cdb76ef77ba1d.webp?q=82&s=300x300&t=crop"
                                        alt="thumbnail"
                                    />
                                </div>
                                <div class="to-buy-list__content--text">
                                    <h1
                                        class="to-buy-list__content--text__title"
                                    >
                                        6단 미니벨로 자전거 짐받이, 싸게팔아요
                                    </h1>
                                    <p
                                        class="to-buy-list__content--text__address"
                                    >
                                        서울 송파구 석촌동
                                    </p>
                                    <div
                                        class="to-buy-list__content--text__date"
                                    >
                                        <div class="to-buy-list__content--date">
                                            2020.09.22
                                        </div>
                                        <div class="to-buy-list__content--hit">
                                            조회수 142
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </article>
                    </div>
                    <div class="to-buy-list__page-num-container">
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
            <div class="to-buy-list__container">
                <h2 class="to-buy-list__title">당도측정</h1>
                    <!-- 각 최신글 3개만 띄어주시면 됩니다 -->
                    <!-- 측정내역 없을때 띄우기 -->
                    <!-- <div class="to-buy-list__text">
                        <strong>측정을 기다리고있는 내역이 없습니다 !</strong>
                    </div> -->
                    <!-- 피거래자 입장에서 거래가 완료됐을경우 띄우기 -->
                    <div class="to-buy-list__content">
                        <article class="to-buy-list__article">
                            <a href="../board/toSharingBoardRead.html">
                                <div class="to-buy-list__content--thumbnail">
                                    <img src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/3c06cb158997b8cd4061052c6b457887e4c60496704b6149d4197a6d791ad261.webp?q=82&s=300x300&t=crop"
                                        alt="thumbnail" />
                                </div>
                                <div class="to-buy-list__content--text">
                                    <h1 class="to-buy-list__content--text__title">
                                        5단 서랍장 입니다
                                    </h1>
                                    <p class="to-buy-list__content--text__address">
                                        서울 송파구 석촌동
                                    </p>
                                    <div class="to-buy-list__content--text__date">
                                        <div class="to-buy-list__content--date">
                                            2020.09.26
                                        </div>
                                        <div class="to-buy-list__content--hit">
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
                        <article class="to-buy-list__article">
                            <a href="../board/toSharingBoardRead.html">
                                <div class="to-buy-list__content--thumbnail">
                                    <img src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/74ead2897bfdc979dfdc817ea9c966c5dfd876d7479410549c8ceefc29271ebf.webp?q=82&s=300x300&t=crop"
                                        alt="thumbnail" />
                                </div>
                                <div class="to-buy-list__content--text">
                                    <h1 class="to-buy-list__content--text__title">
                                        스위스크로스 캠핑체어 팝니다.
                                    </h1>
                                    <p class="to-buy-list__content--text__address">
                                        서울 송파구 석촌동
                                    </p>
                                    <div class="to-buy-list__content--text__date">
                                        <div class="to-buy-list__content--date">
                                            2020.09.25
                                        </div>
                                        <div class="to-buy-list__content--hit">
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
                        <article class="to-buy-list__article">
                            <a href="../board/toSharingBoardRead.html">
                                <div class="to-buy-list__content--thumbnail">
                                    <img src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/e109941c1a68f4bef813c0a46f20ab1060b67f92c7510a14c83cdb76ef77ba1d.webp?q=82&s=300x300&t=crop"
                                        alt="thumbnail" />
                                </div>
                                <div class="to-buy-list__content--text">
                                    <h1 class="to-buy-list__content--text__title">
                                        6단 미니벨로 자전거 짐받이, 싸게팔아요
                                    </h1>
                                    <p class="to-buy-list__content--text__address">
                                        서울 송파구 석촌동
                                    </p>
                                    <div class="to-buy-list__content--text__date">
                                        <div class="to-buy-list__content--date">
                                            2020.09.22
                                        </div>
                                        <div class="to-buy-list__content--hit">
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
                    <div class="to-buy-list__page-num-container">
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
    <!-- 하단 카피라이트 -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-top">
                <div class="footer-top-logo"></div>
                <ul class="footer-top-list">
                    <li class="footer-top-list-content">
                        <a href="https://www.daangn.com/trust">믿을 수 있는 중고거래</a>
                    </li>
                    <li class="footer-top-list-content">
                        <a href="https://www.daangn.com/wv/faqs">
                            자주 묻는 질문</a>
                    </li>
                </ul>
                <ul class="footer-top-list">
                    <li class="footer-top-list-content">
                        <a href="https://www.notion.so/3d0197c137ec43d18ff739b5b254a3c8/">
                            회사 소개
                        </a>
                    </li>
                    <li class="footer-top-list-content">
                        <a href="https://ad.daangn.com/"> 광고주센터 </a>
                    </li>
                    <li class="footer-top-list-content">
                        <a href="https://town.daangn.com/"> 동네가게 </a>
                    </li>
                </ul>
                <ul class="footer-top-list">
                    <li class="footer-top-list-content">
                        <a href="https://www.daangn.com/policy/terms">
                            이용약관
                        </a>
                    </li>
                    <li class="footer-top-list-content">
                        <a href="https://www.daangn.com/policy/privacy">
                            개인정보 취급방침
                        </a>
                    </li>
                    <li class="footer-top-list-content">
                        <a href="https://www.daangn.com/policy/location">
                            위치기반서비스 이용약관
                        </a>
                    </li>
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
                            <address>
                                사업자 등록번호 : 375-87-000-88
                            </address>
                            <address>
                                서울특별시 구로구 디지털로 30길 28 609호
                            </address>
                        </li>
                        <li class="footer-bottom-list-conent">
                            ©Danggeun Market Inc.
                        </li>
                    </ul>
                </div>
                <div class="footer-bottom-sns">
                    <ul class="footer-bottom-sns-container">
                        <li class="sns-icon">
                            <a href="https://www.facebook.com/daangn">
                                <img
                                    src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/footer/icon-facebook-0563f4a93852d073b41f13b8bcabb03d47af3bb3a6755cdfedd8a73686c7f18c.svg" />
                            </a>
                        </li>
                        <li class="sns-icon">
                            <a href="https://www.instagram.com/daangnmarket/">
                                <img
                                    src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/footer/icon-instagram-2f6c88a461597907c114b7ce28eab053fcae791ed26417915fefb6f7c9f95756.svg" />
                            </a>
                        </li>
                        <li class="sns-icon">
                            <a href="https://blog.naver.com/daangn">
                                <img
                                    src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/footer/icon-blog-e1b0d512d1766a6962ec5bbb5b0803d2a6a9c55ad97db5ba9eebb76013caceba.svg" />
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</body>

</html>