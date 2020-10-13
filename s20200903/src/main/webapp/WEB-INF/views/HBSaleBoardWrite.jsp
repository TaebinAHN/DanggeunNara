<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includeJSP.jsp" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>글작성하기 :: 당근나라</title>
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
        <!-- 메뉴 고정바 -->
        <header class="header">
            <div class="header__fixed-bar">
                <section class="header__fixed-bar-logo section-logo">
                    <a href="main.do">
                        <img
                            src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FSQxEt%2FbtqJs5kkQnP%2FhvX1kh8aeqli9J93tF5qV1%2Ftfile.svg"
                            alt="당근나라"
                        />
                    </a>
                </section>
                <section class="header__fixed-bar-search section-search">
                    <div
                        class="header__fixed-bar-search-container"
                        tabindex="4"
                    >
                        <input
                            class="search-input"
                            type="text"
                            placeholder="동네 이름, 물품명 등을 검색해보세요!"
                        />
                        <input
                            type="image"
                            class="search-icon"
                            src="https://img.icons8.com/ios-glyphs/30/000000/search.png"
                        />
                    </div>
                    <!-- 검색시 검색창 밑에 뜨는 키워드 추천란 입니다 -->
                    <div class="search-keyword">
                        <span class="keyword-title">추천</span>
                        <span class="keyword-contnet">
                            <a href="#none">분당 유모차</a>
                            <a href="#none">키즈카페</a>
                            <a href="#none">화분</a>
                            <a href="#none">강남 명품가방</a>
                            <a href="#none">잠실 냉장고</a>
                            <a href="#none">인천 마우스</a>
                        </span>
                    </div>
                    <!-- 5~6개 정도 표시해주면 될듯합니다 -->
                </section>
                <section class="header__fixed-bar-nav section-nav">
                    <nav class="header__fixed-bar-nav-container">
                        <ul class="header__fixed-bar-nav-list nav-list">
                            <li class="nav-list-content drop">
                                <span class="nav-list-text">
                                    Welcome ~!
                                    <!-- 로그인 회원에 따라서 이름 바뀌게 작업 -->
                                    <span class="name">이준호</span>님 </span
                                ><img
                                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABmJLR0QA/wD/AP+gvaeTAAAA1ElEQVRIie2TsQ3CMBBF/zkLpMQLQO9zmV2IBBINJZQZgDAAVRAj0FBlhrRZwV1GwDQGhUhJnFQg+Xdn371nyzIQEvJfYeZMa50DEDPGBTOfmTn7Wuw0xdbaIzMXEyXCzRwAxO2NqF0YY0op5YKItlLKVZIk97qurQf8CiAFcKuqag/gMxN1u40xDydJm6ZZjkje8LWDbwA8e28wUTIK7xV4SLzgg4IBCfnCAYCGBK3TFnCP6NZSH7ivAABIKXUhop2rveBTI7TWuVLqhHkfMSTkV/MCeGNw/fvNnQwAAAAASUVORK5CYII="
                                />
                                <ul class="drop__container">
                                    <a href="../member/myPage.html"
                                        ><li>마이페이지</li></a
                                    >
                                    <a href="../member/picksList.html"
                                        ><li>관심목록</li></a
                                    >
                                    <a href="../member/toSaleList.html"
                                        ><li>판매내역</li></a
                                    >
                                    <a href="../member/toBuyList.html"
                                        ><li>구매내역</li></a
                                    >
                                    <a href="../member/toSharingList.html"
                                        ><li>나눔내역</li></a
                                    >
                                    <a href="#"><li>로그아웃</li></a>
                                </ul>
                            </li>
                            <li class="nav-list-content">
                                <a href="#">지도로 보기</a>
                            </li>
                            <!-- 관리자 로그인시 활성화 될 수 있게
                                 <li class="nav-list-content drop">
                                <span class="nav-list-text">
                                    Welcome ~!
                                    <span class="name">관리자</span>님 </span
                                ><img
                                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABmJLR0QA/wD/AP+gvaeTAAAA1ElEQVRIie2TsQ3CMBBF/zkLpMQLQO9zmV2IBBINJZQZgDAAVRAj0FBlhrRZwV1GwDQGhUhJnFQg+Xdn371nyzIQEvJfYeZMa50DEDPGBTOfmTn7Wuw0xdbaIzMXEyXCzRwAxO2NqF0YY0op5YKItlLKVZIk97qurQf8CiAFcKuqag/gMxN1u40xDydJm6ZZjkje8LWDbwA8e28wUTIK7xV4SLzgg4IBCfnCAYCGBK3TFnCP6NZSH7ivAABIKXUhop2rveBTI7TWuVLqhHkfMSTkV/MCeGNw/fvNnQwAAAAASUVORK5CYII="
                                />
                                <ul class="drop__container">
                                    <a href="../admin/adminManageList.html"
                                        ><li>회원관리</li></a
                                    >
                                    <a href="#"><li>로그아웃</li></a>
                                </ul>
                            </li>
                            <li class="nav-list-content">
                                <a href="#">지도로 보기</a>
                            </li> -->
                        </ul>
                    </nav>
                </section>
            </div>
        </header>
        <!-- 메뉴 목록 리스트 -->
        <aside class="fixed__list">
            <ul>
                <li><a href="noticeBoard.html">공지사항</a></li>
                <li><a href="blackListBoard.html">검거완료 !</a></li>
                <li><a href="badReviewBoard.html">불량거래 후기</a></li>
                <li><a href="list.do">판매중 이에요.</a></li>
                <li><a href="toSharingBoard.html">나눔중 이에요.</a></li>
                <li><a href="toBuyBoard.html">구매합니다 ~!</a></li>
            </ul>
        </aside>
        <!-- 섹션 시작 -->
        <article class="article">
            <div class="article__sale-board-write">
             <form name="frm" method="post" action="HBSaleBoardWritePro.do" enctype="multipart/form-data">
             	<input type="hidden" name="bid" value="1"/>
                <div class="sale-board-write__sort">
                    <select
                        class="sale-board-write__category"
                        name="ctcode"
                        required
                    >
                        <option value="" disabled selected hidden>
                            카테고리
                        </option>
                        <option value="1">디지털/가전</option>
                        <option value="2">가구/인테리어</option>
                        <option value="3">유아동/유아도서</option>
                        <option value="4">생활/가공식품</option>
                        <option value="5">스포츠/레저</option>
                        <option value="6">여성잡화</option>
                        <option value="7">여성의류</option>
                        <option value="8">남성패션/잡화</option>
                        <option value="9">게임/취미</option>
                        <option value="10">뷰티/미용</option>
                        <option value="11">반려동물용품</option>
                        <option value="12">도서/티켓/음반</option>
                        <option value="13">기타중고물품</option>
                    </select>
                </div>      
                <div class="sale-board-write__info">
                     <div class="sale-board-write__location">
                        <label
                            class="sale-board-write__location--label"
                            for="sale-board-write__location--input"
                            >활동 지역</label
                        >
                        <input
                            class="sale-board-write__location--input"
                            type="text"
                            readonly
                            value="회원 주소값 넣기"
                        />
                    </div>
                    <div class="sale-board-write__price">
                        <label
                            class="sale-board-write__price--label"
                            for="sale-board-write__price--input"
                            >거래 가격</label
                        >
                        <input
                            class="sale-board-write__price--input"
                            type="text"
                            placeholder="가격을 입력해주세요"
                            name="pprice"
                            required
                        />
                    </div>
                </div>
			<div class="sale-board-write__image">
				<div class="sale-board-write__image--title">사진 첨부</div>
                    <div class="sale-board-write__image--container">
                        <div class="image--input-container">
                            <label class="image--input-label">
                                <div class="image--input-button button-1"></div>
                                <input
                                    class="image--input image-1"
                                    type="file"
                                    id="PImg1"
                                    name="PImg1"
                                    accept=".jpg, .jpeg, .png"
                                />
                            </label>
                        </div>
                        <div class="image--input-container">
                            <label class="image--input-label">
                                <div class="image--input-button button-2"></div>
                                <input
                                    class="image--input image-2"
                                    type="file"
                                    id="PImg2"
                                    name="PImg2"
                                    accept=".jpg, .jpeg, .png"
                                />
                            </label>
                        </div>
                        <div class="image--input-container">
                            <label class="image--input-label">
                                <div class="image--input-button button-3"></div>
                                <input
                                    class="image--input image-3"
                                    type="file"
                                    id="PImg3"
                                    name="PImg3"
                                    accept=".jpg, .jpeg, .png"
                                />
                            </label>
                        </div>
                        <div class="image--input-container">
                            <label class="image--input-label">
                                <div class="image--input-button button-4"></div>
                                <input
                                    class="image--input image-4"
                                    type="file"
                                    id="PImg4"
                                    name="PImg4"
                                    accept=".jpg, .jpeg, .png"
                                />
                            </label>
                        </div>
                        <div class="image--input-container">
                            <label class="image--input-label">
                                <div class="image--input-button button-5"></div>
                                <input
                                    class="image--input image-5"
                                    type="file"
                                    id="PImg5"
                                    name="PImg5"
                                    accept=".jpg, .jpeg, .png"
                                />
                            </label>
                        </div>
                    </div>
                </div>
                <div class="sale-board-write__title">
                    <textarea
                        class="sale-board-write__title--textarea"
                        placeholder="제목을 입력해주세요"
                        id="ptitle"
                        name="ptitle"
                        required
                    ></textarea>
                </div>
                <div class="sale-board-write__content">
                    <textarea
                        class="sale-board-write__content--textarea"
                        placeholder="내용을 입력해주세요"
                        name="pcontent"
                        id="pcontent"
                        required
                    ></textarea>
                </div>
                <div class="sale-board-write__btn-container">
                    <div class="sale-board-write__list list--btn">
                    	<a href="list.do">돌아가기</a>
                    </div>  
                    <!-- <a href="list.do"><input
                        class="sale-board-write__submit"
                        type="button"
                        value="작성하기"/></a> -->
                     <!-- <input type="submit" value="작성하기"/> -->
                     <input
                        class="sale-board-write__submit"
                        type="submit"
                        value="작성하기"/>
                                          
                </div>
                </form>
            </div>
        </article>

	<%@ include file="footer.jsp" %>
    </body>
</html>