<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includeJSP.jsp" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>제목 불러오기:: 당근나라</title>
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
        <!-- 게시글 보기는 위 head에 title도 글제목으로 불러와주세요 -->

        <!-- 섹션 시작 -->
        <article class="article">
            <div class="article__sale-board-read">
            <!-- <input type="hidden" name="bid" value="1"/> -->
                <div class="silder-container">
                    <div class="slider">
                        <div class="slide showing">
                            <img
                                src="/s20200903/img/sale/${sb.pImg1}"
                                alt="img-thumbnail1"
                            />
                        </div>
                        <c:if test="${sb.pImg2 != null }">
                        <div class="slide">
                            <img
                                src="/s20200903/img/sale/${sb.pImg2}"
                                alt="img-thumbnail2"
                            />
                        </div>
                        </c:if>
                        <c:if test="${sb.pImg3 != null }">
                        <div class="slide">
                            <img
                                src="/s20200903/img/sale/${sb.pImg3}"
                                alt="img-thumbnail3"
                            />
                        </div>
                        </c:if>
                        <c:if test="${sb.pImg4 != null }">
                        <div class="slide">
                            <img
                                src="/s20200903/img/sale/${sb.pImg4}"
                                alt="img-thumbnail14"
                            />
                        </div>
                        </c:if>
                        <c:if test="${sb.pImg5 != null }">
                        <div class="slide">
                            <img
                                src="/s20200903/img/sale/${sb.pImg5}"
                                alt="img-thumbnail5"
                            />
                        </div>
                        </c:if>
                        <div class="left btns" onclick="left_move();">
                            <i class="fas fa-chevron-left"></i>
                        </div>
                        <div class="right btns" onclick="right_move();">
                            <i class="fas fa-chevron-right"></i>
                        </div>
                    </div>
                </div>
                <div class="sale-board-read__info-container">
                    <div class="sale-board-read__info">
                        <a href="../member/userDetail.html"
                            ><div class="sale-board-read__name">${sb.mId }</div></a
                        >
                        <span class="board--chat">채팅하기<img
                            src="data:image/png;base64,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"
                            alt="board--chat-ico"></span>
                        <p class="sale-board-read__address">
                            서울특별시 송파구 석촌동
                        </p>
                    </div>
                    <div class="sale-board-read__sweet-cotainer">
                        <div
                            class="sale-board-read__sweet sweet-cotainer"
                        ></div>
                        <div class="sale-board-read__text">당도</div>
                    </div>
                </div>
                <div class="sale-board-read__content">
                    <h1 class="sale-board-read__content--title">
                        ${sb.pTitle}
                    </h1>
                    <div class="sale-board-read__content--detail">
                        <!-- 실제 게시글에 등록된 주소, 카테고리 -->
                        <span
                            >경기도 평택시 서정동
                            <div class="vertical"></div>
                            	${sb.ctKinds }
                            <div class="vertical"></div>
                            	${sb.pStatus }
                        </span>
                    </div>
                    <div class="sale-board-read__content--price"><fmt:formatNumber value="${sb.pPrice}" pattern="#,###" />원</div>
                    <div class="sale-board-read__content--article">
                       ${sb.pContent }
                    </div>
                    <div class="sale-board-read__content--hits">
                        <fmt:formatDate value="${sb.pDate}" pattern="yyyy-MM-dd"/> · 조회수 ${sb.pHit}
                    </div>
                    <div
                        class="sale-board-read__content--counts picks-container"                        
                    >
                    <input type="hidden" name="mId" id="mId" value="${sessionScope.mId}">
                    <input type="hidden" name="bId" id="bId" value="${sb.bId}">
                    <input type="hidden" name="pNum" id="pNum" value="${sb.pNum}">
                    <img class="picks-ico"
		     				 src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHg9IjBweCIgeT0iMHB4Igp3aWR0aD0iMjYiIGhlaWdodD0iMjYiCnZpZXdCb3g9IjAgMCAxNzIgMTcyIgpzdHlsZT0iIGZpbGw6IzAwMDAwMDsiPjxnIHRyYW5zZm9ybT0iIj48ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9Im5vbnplcm8iIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBzdHJva2UtbGluZWNhcD0iYnV0dCIgc3Ryb2tlLWxpbmVqb2luPSJtaXRlciIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBzdHJva2UtZGFzaGFycmF5PSIiIHN0cm9rZS1kYXNob2Zmc2V0PSIwIiBmb250LWZhbWlseT0ibm9uZSIgZm9udC13ZWlnaHQ9Im5vbmUiIGZvbnQtc2l6ZT0ibm9uZSIgdGV4dC1hbmNob3I9Im5vbmUiIHN0eWxlPSJtaXgtYmxlbmQtbW9kZTogbm9ybWFsIj48cGF0aCBkPSJNMCwxNzJ2LTE3MmgxNzJ2MTcyeiIgZmlsbD0ibm9uZSI+PC9wYXRoPjxnIGZpbGw9IiMwMDAwMDAiPjxwYXRoIGQ9Ik01MS4wNjI1LDI2Ljg3NWMtMjIuMjM0ODYsMCAtNDAuMzEyNSwxOC4yODc2IC00MC4zMTI1LDQwLjMxMjVjMCw3LjY4NDU3IDMuNDg1MzUsMTQuMzQwMzMgNi43MTg3NSwxOS4xNDg0NGMzLjIzMzQsNC44MDgxIDYuNTUwNzgsNy44OTQ1MyA2LjU1MDc4LDcuODk0NTNsNTguMTE3MTksNTguMjg1MTZsMy44NjMyOCwzLjg2MzI4bDMuODYzMjgsLTMuODYzMjhsNTguMTE3MTksLTU4LjI4NTE2YzAsMCAxMy4yNjk1MywtMTEuNjk0ODIgMTMuMjY5NTMsLTI3LjA0Mjk3YzAsLTIyLjAyNDkgLTE4LjA3NzY0LC00MC4zMTI1IC00MC4zMTI1LC00MC4zMTI1Yy0xOC40NTU1NywwIC0zMC4zMzkzNSwxMS4xMDY5MyAtMzQuOTM3NSwxNS43ODkwNmMtNC41OTgxNSwtNC42ODIxMyAtMTYuNDgxOTMsLTE1Ljc4OTA2IC0zNC45Mzc1LC0xNS43ODkwNnpNNTEuMDYyNSwzNy42MjVjMTYuMDYyMDEsMCAzMC45MDYyNSwxNS42MjEwOSAzMC45MDYyNSwxNS42MjEwOWw0LjAzMTI1LDQuNTM1MTZsNC4wMzEyNSwtNC41MzUxNmMwLDAgMTQuODQ0MjQsLTE1LjYyMTA5IDMwLjkwNjI1LC0xNS42MjEwOWMxNi4zNTU5NiwwIDI5LjU2MjUsMTMuNDE2NTEgMjkuNTYyNSwyOS41NjI1YzAsOC4yOTM0NiAtMTAuMDc4MTIsMTkuNDg0MzggLTEwLjA3ODEyLDE5LjQ4NDM4bC01NC40MjE4Nyw1NC40MjE4OGwtNTQuNDIxODcsLTU0LjQyMTg3YzAsMCAtMi42MDM1MiwtMi40OTg1NCAtNS4yMDcwMywtNi4zODI4MWMtMi42MDM1MiwtMy44ODQyOCAtNC44NzEwOSwtOC45NDQzMyAtNC44NzEwOSwtMTMuMTAxNTZjMCwtMTYuMTQ1OTkgMTMuMjA2NTQsLTI5LjU2MjUgMjkuNTYyNSwtMjkuNTYyNXoiPjwvcGF0aD48L2c+PC9nPjwvZz48L3N2Zz4=' 
		     			     alt="picks"
		     			     />   
                    </div>              
                </div>
                <div class="sale-board-read__btn-container">
                    <a href="list.do"
                        ><div class="sale-board-read__list list-btn">
                            목록
                        </div></a
                    >
                    <c:if test="${sessionScope.mId != null}">
                    <a href="delete.do?bId=${sb.bId }&pNum=${sb.pNum }&?mId=${sessionScope.mId}">
                    <input
                        class="sale-board-read__delete"
                        type="button"
                        value="삭제"
                        
                    /></a>
                    <a href="HBSaleBoardUpdate.do?bId=${sb.bId }&pNum=${sb.pNum }&?mId=${sessionScope.mId}">
                    <input
                        class="sale-board-read__update"
                        type="button"
                        value="수정"
                    /></a>
                    </c:if>
                </div>
            </div>
        </article>
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