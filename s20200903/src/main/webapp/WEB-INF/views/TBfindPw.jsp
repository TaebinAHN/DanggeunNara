<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>당근나라</title>
    <link rel="stylesheet" href="css/common.css" />
    <script src="javascript/common.js" defer></script>
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
            href="https://d1unjqcospf8gs.cloudfront.net/favicon.ico"
        />
        <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&display=swap"
            rel="stylesheet"
        />
</head>
<body>
        <!-- 메뉴 고정바 -->
        <header class="header">
            <div class="header__fixed-bar">
                <section class="header__fixed-bar-logo section-logo">
                    <a href="main.do">
                        <img
                            src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FSQxEt%2FbtqJs5kkQnP%2FhvX1kh8aeqli9J93tF5qV1%2Ftfile.svg"
                            alt="당근마켓"
                        />
                    </a>
                </section>
                <section class="header__fixed-bar-search section-search">
                    <div class="header__fixed-bar-search-container">
                    <form action="loginMember.do" method="post">
                        <input
                            class="search-input"
                            type="text"
                            name="sword"
                            placeholder="동네 이름, 물품명 등을 검색해보세요!"
                        />
                        <input
                            type="image"
                            class="search-icon"
                            src="https://img.icons8.com/ios-glyphs/30/000000/search.png"
                        />
                    </form>
                    </div>
                </section>
                <section class="header__fixed-bar-nav section-nav">
                    <nav class="header__fixed-bar-nav-container">
		                <ul class="header__fixed-bar-nav-list nav-list">
			                <li class="nav-list-content">
			                	<a href="TBjoinForm.do">회원가입</a>
			                </li>
			                <li class="nav-list-content">
			                	<a href="TBlogin.do">로그인</a>
			                </li>
			                <li class="nav-list-content">
			                	<a href="#">지도로 보기</a>
			                </li>
		                </ul>                    		
                    </nav>
                </section>
            </div>
        </header>
        <!-- 섹션 시작 -->
        <section class="section"> 
        <form action="TBfindPwgo.do" method="post" name="pwrReset">
            <div class="find-pw">
                <h1 class="find-pw__title">비밀번호찾기</h1>
                <div class="find-pw__container">
                    <p class="find-pw__info--label">이름</p>
                    <input
                    	id="mName"
                    	name="mName"
                        class="find-pw__info"
                        type="text"
                        placeholder="이름을 입력해주세요"
                        required="required"
                    />
                    <p class="find-pw__info--label">이메일</p>
                    <input
                    	id="mId"
                    	name="mId"
                        class="find-pw__info"
                        type="email"
                        placeholder="이메일을 입력해주세요"
                        required="required"
                    />
                    <div class="find-pw__btn">
                        <input
                            class="find-pw__submit"
                            type="submit"
                            value="찾기"
                        />
                    </div>
                </div>
            </div>
            </form>
        </section>
        <%@ include file="footer.jsp" %>
    </body>
</html>
