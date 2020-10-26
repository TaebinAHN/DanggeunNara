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
        <div class="to-buy-list">
            <h1 class="list-title">내 구매내역</h1>
            <div class="to-buy-list__container">
                <h2 class="to-buy-list__title">거래가능</h2>
                    <div class="to-buy-list__content">
                    <input type="hidden" name="mId" id="mId" value="${sessionScope.mId}">
	                <c:forEach var="bPostA" items="${blistA}">
	                	<article class="to-buy-list__article">
	                	<c:set var="num" value="${num - 1}" />                
						<c:if test="${sessionScope.mId == bPostA.mId}">
	                        	<a href="toBuyBoardRead.do">
	                                <div class="to-buy-list__content--thumbnail">
	                                    <img src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/3c06cb158997b8cd4061052c6b457887e4c60496704b6149d4197a6d791ad261.webp?q=82&s=300x300&t=crop"
	                                        alt="thumbnail" />
	                                </div>
	                                <div class="to-buy-list__content--text">
	                                    <h1 class="to-buy-list__content--text__title">
	                                        ${bPostA.ptitle}
	                                    </h1>
	                                    <p class="to-buy-list__content--text__address">
	                                        ${bPostA.maddr}
	                                    </p>
	                                    <div class="to-buy-list__content--text__date">
	                                        <div class="to-buy-list__content--date">
	                                         ${bPostA.pdate} 
	                                        </div>
	                                        <div class="to-buy-list__content--hit">
	                                         ${bPostA.phit}
	                                        </div>
	                                    </div>
	                                </div>
	                            </a>
                        	</c:if>
							</article>
                        </c:forEach>                          	
						</div>
	                    	<c:if test="${sessionScope.mId != bPostA.mId}">
	                    		<c:if test="${BuytotalA == 0 }">                   		
									<div class="to-buy-list__text">
										<strong>구매 내역이 없어요 !</strong>
										<a href="toBuyBoard.do">
										<p>구경가기</p>
										</a>
									</div>								
								</c:if>                   
	                        </c:if>
                    <div class="to-buy-list__page-num-container">
                        <ul class="page-num-container">
                       		<c:if test="${pgA.endPage > pgA.totalPage }">
							<a href="TBtoBuyListUp.do?mId=${sessionScope.mId}&currentPage=${pgA.startPage-pgA.pageBlock}"><li class="page-num-container__left-btn page-num-container__btn">
                                   <i class="fas fa-chevron-left"></i></li></a>
                            </c:if>
							<c:forEach var="i" begin="${pgA.startPage }" end="${pgA.endPage }">
								<a href="TBtoBuyListUp.do?mId=${sessionScope.mId}&currentPage=${i}"><li class="page-num-container__num">${i}</li></a>
							</c:forEach>
							<c:if test="${pgA.endPage < pgA.totalPage }">
							<a href="TBtoBuyListUp.do?mId=${sessionScope.mId}&currentPage=${pgA.startPage+pgA.pageBlock}"><li class="page-num-container__right-btn page-num-container__btn">
                                   <i class="fas fa-chevron-right"></i></li></a>
                            </c:if>
                        </ul>
                    </div>
            </div>
            <div class="to-buy-list__container">
                <h2 class="to-buy-list__title">거래중</h2>
                	<div class="to-buy-list__content">
	                <c:forEach var="bPostB" items="${blistB }">
	                        <article class="to-buy-list__article">
	                <c:set var="num" value="${num - 1}"></c:set>                
						<c:if test="${sessionScope.mId == bPostB.mId}">
	                        	<a href="toBuyBoardRead.do">
	                                <div class="to-buy-list__content--thumbnail">
	                                    <img src="https://dnvefa72aowie.cloudfront.net/origin/article/202009/3c06cb158997b8cd4061052c6b457887e4c60496704b6149d4197a6d791ad261.webp?q=82&s=300x300&t=crop"
	                                        alt="thumbnail" />
	                                </div>
	                                <div class="to-buy-list__content--text">
	                                    <h1 class="to-buy-list__content--text__title">
	                                        ${bPostB.ptitle}
	                                    </h1>
	                                    <p class="to-buy-list__content--text__address">
	                                        ${bPostB.maddr}
	                                    </p>
	                                    <div class="to-buy-list__content--text__date">
	                                        <div class="to-buy-list__content--date">
	                                         ${bPostB.pdate} 
	                                        </div>
	                                        <div class="to-buy-list__content--hit">
	                                         ${bPobPostBst.phit}
	                                        </div>
	                                    </div>
	                                </div>
	                            </a>
                        	</c:if>
						</article>
                        </c:forEach>                          	
	                    	<c:if test="${sessionScope.mId != bPostB.mId}">
	                    		<c:if test="${BuytotalB == 0 }">                   		
									<div class="to-buy-list__text">
										<strong>구매 내역이 없어요 !</strong>
										<a href="toBuyBoard.do">
										<p>구경가기</p>
										</a>
									</div>								
								</c:if>                   
	                        </c:if>
                </div>
                    <div class="to-buy-list__page-num-container">
                        <ul class="page-num-container">
                       		<c:if test="${pgB.endPage > pgB.totalPage }">
							<a href="TBtoBuyListUp.do?mId=${sessionScope.mId}&currentPage=${pgB.startPage-pgB.pageBlock}"><li class="page-num-container__left-btn page-num-container__btn">
                                   <i class="fas fa-chevron-left"></i></li></a>
                            </c:if>
							<c:forEach var="i" begin="${pgB.startPage }" end="${pgB.endPage }">
								<a href="TBtoBuyListUp.do?mId=${sessionScope.mId}&currentPage=${i}"><li class="page-num-container__num">${i}</li></a>
							</c:forEach>
							<c:if test="${pgB.endPage < pgB.totalPage }">
							<a href="TBtoBuyListUp.do?mId=${sessionScope.mId}&currentPage=${pgB.startPage+pgB.pageBlock}"><li class="page-num-container__right-btn page-num-container__btn">
                                   <i class="fas fa-chevron-right"></i></li></a>
                            </c:if>
                        </ul>
                    </div>	                        
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
            </div>
            <div class="to-buy-list__container">
                <h2 class="to-buy-list__title">당도측정</h1>
                    <!-- 각 최신글 3개만 띄어주시면 됩니다 -->
                    <!-- 측정내역 없을때 띄우기 -->
                    <!-- <div class="to-buy-list__text">
                        <strong>측정을 기다리고있는 내역이 없습니다 !</strong>
                    </div> -->
                    <!-- 피거래자 입장에서 거래가 완료됐을경우 띄우기 -->
                
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