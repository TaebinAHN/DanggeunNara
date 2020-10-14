<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="includeJSP.jsp" %>
<html lang="ko">
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
        <section class="section">
            <article class="user-detail">
                <div class="user-detail__container">
                    <div class="user-detail__info">
                        <div class="user-detail__text">
                            <strong class="user-detail__text--name"
                                >닉네임 (email@daum.net)</strong
                            >
                            <p class="user-detail__text--address">
                                서울특별시 송파구 석촌동
                            </p>
                        </div>
                        <div class="user-detail__sweet--container">
                            <div
                                class="user-detail__sweet--item sweet-cotainer"
                            ></div>
                            <p class="user-detail__sweet--title">당도</p>
                        </div>
                    </div>
                    <!-- 관리자가 볼경우에만 활성화 -->
                    <!-- <div class="user-detail__info-admin">
                        <strong>회원 상세내역</strong>
                        <table>
                            <tr>
                                <td>이름</td>
                                <td>이준호</td>
                            </tr>
                            <tr>
                                <td>전화번호</td>
                                <td>01048309376</td>
                            </tr>
                            <tr>
                                <td>상태</td>
                                <td>
                                    <select name="info-status" id="info-status">
                                        <option
                                            value="general
                                    "
                                        >
                                            일반
                                        </option>
                                        <option value="suspension">정지</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </div> -->
                    <!------------>
                    <div class="user-detail__status">
                        <p>회원등급 : 일반회원</p>
                        <div class="vertical"></div>
                        <p>총 거래내역 : 12건</p>
                        <div class="vertical"></div>
                        <p>총 판매내역 : 8건</p>
                        <div class="vertical"></div>
                        <p>총 나눔내역 : 1건</p>
                        <div class="vertical"></div>
                        <p>총 구매내역 : 3건</p>
                    </div>
                    <!-- 카테고리 불문 최신 순, 제목에 해당 게시글 링크-->
                    <div class="user-detail__summary">
                        <strong>활동내역</strong>
                        <table>
                            <tr>
                                <th>카테고리</th>
                                <th>제목</th>
                                <th>작성일</th>
                            </tr>
                            <tr>
                                <td>판매중</td>
                                <td>
                                    <a href="#">판매중게시판 제목입니다.</a>
                                </td>
                                <td>2020.09.23</td>
                            </tr>
                            <!-- 더미데이터 -->
                            <tr>
                                <td>나눔중</td>
                                <td>나눔중게시판 제목입니다.</td>
                                <td>2020.09.23</td>
                            </tr>
                            <tr>
                                <td>구매중</td>
                                <td>구매중게시판 제목입니다.</td>
                                <td>2020.09.23</td>
                            </tr>
                            <tr>
                                <td>불량거래후기</td>
                                <td>불량거래후기게시판 제목입니다.</td>
                                <td>2020.09.23</td>
                            </tr>
                            <tr>
                                <td>판매중</td>
                                <td>판매중게시판 제목입니다.</td>
                                <td>2020.09.23</td>
                            </tr>
                            <!-- 더미데이터 -->
                        </table>
                    </div>
                    <div class="user-detail__page-num-container">
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
                                <li
                                    class="page-num__right-btn page-num-container__btn"
                                >
                                    <i class="fas fa-chevron-right"></i>
                                </li>
                            </a>
                        </ul>
                    </div>
                </div>
            </article>
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
                                    <strong class="chat-container__nick"
                                        >닉네임</strong
                                    >
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
                                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAABmJLR0QA/wD/AP+gvaeTAAACnElEQVR4nO3dv27TUABG8dMIJoYWMTPwEjwBCwNigJYKCnRB8HRI7IzsMMLUFTGlCDFAKQwu0D/XECfXvZ/q85O8VIl95RO7SnzjADwDvgI/J7bsA9uEWQO+AFdaD6SROXANOGw9kN/W6F4tU3aVLkyEWesB6KRLhb/doDu/XkTrwF7rQfxLKcicoEO4svjTs6esMAYJY5AwBgljkDAGCWOQMAYJY5AwBgljkDAGCWOQMAYJY5AwBglTukB1kc3p5hHE8ggJY5AwBgljkDAGCWOQMAYJY5DhrgOvgNfArTE2cHqa/sYYG7lAXvJ3X30HNmtvwCDDvOHk/qoexSDD3KaLcDrKVq0NGGS4e8A3Tu63A2CnxsoNspz7nD1SqkQxyPJGiWKQ1VSPYpDVbVKO8niZlRmkjmpRDFLPFuUoT4asxCB1rRzFIPU9oBzl6SJPNsg4SlF+sEAUg4xnm+7IGBTFIOPqi7Lb9wSDjG+XLsLx/XwIvCg92CDnY+EorYLsAJ8K25/acub01SLIZaZ507S+5YCjm6m1uqY+OxqIClocIQAPgY+F7U9tiThlTVHfP/Xnpx9okPGVYvS+FzHIuAa/WzfIePzoJMjSn/gapL6+GAtdEzFIXV6gCtIXY9B1dYPU4SSHIH0xlpqbZZDVOFEuiFNJgzjZOkjf1xEe1Vi5QYa5i1/YifKBszH8SltD7xgxBhhkqJvAW+A9cGeMDRgkiDcOCGOQMAYJY5AwBgljkDAGCTO1IBuEv++aWpB4BgljkDAGCWOQMAYJY5AwBgljkDAGCWOQMAYJY5AwBgljkDAGCVP6YckNwn98cQXrrQfwP6Uge+c+Cv3hKSvMDNhvPYiG5sDn1oM4bkZ3z78pRpnT3RrpsPVAjvsFW3N9LhOsh0kAAAAASUVORK5CYII="
                                />
                            </div>
                            <div class="chat-container__new">N</div>
                        </li>
                    </ul>
                </div>
                <!-- 채팅방 -->
                <div class="chat-container__chat-room">
                    <div class="chat-container__chat-room--header">
                        <a class="chat-container__chat-room--back" href="#none"
                            ><i class="fas fa-arrow-left"></i></a
                        >상대방 닉네임
                    </div>
                    <ul class="chat-container__chat-room__list">
                        <li class="chat-container__chat-room__received">
                            <div class="message__img">
                                <i class="fas fa-carrot"></i>
                            </div>
                            <div class="message__container">
                                <div class="message__author">
                                    <a href="../member/userDetail.html"
                                        >상대방아이디</a
                                    ><span class="message__container--date"
                                        >2020.10.06 16:04</span
                                    >
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
                                    <span class="message__container--date"
                                        >2020.10.06 16:08</span
                                    >
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
                                    <a href="../member/userDetail.html"
                                        >상대방아이디</a
                                    ><span class="message__container--date"
                                        >2020.10.06 16:04</span
                                    >
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
                                    <span class="message__container--date"
                                        >2020.10.06 16:08</span
                                    >
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
                                    <span class="message__container--date"
                                        >2020.10.06 16:08</span
                                    >
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
                                    <span class="message__container--date"
                                        >2020.10.06 16:08</span
                                    >
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
                                    <span class="message__container--date"
                                        >2020.10.06 16:08</span
                                    >
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
                                    <span class="message__container--date"
                                        >2020.10.06 16:08</span
                                    >
                                </div>
                                <div class="message__content-sent">
                                    Congrats XD <br />
                                    Congrats XD <br />
                                </div>
                            </div>
                        </li>
                    </ul>
                    <div class="chat-container__chat-room__footer">
                        <input
                            class="chat-container__chat-room__footer--input"
                            type="text"
                            placeholder="Send message"
                        />
                    </div>
                </div>
            </div>
        </div>
	<%@ include file="footer.jsp" %>
    </body>
</html>