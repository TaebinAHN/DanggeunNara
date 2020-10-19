<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includeJSP.jsp" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>글수정하기 :: 당근나라</title>
        <script
            src="https://kit.fontawesome.com/797af710b1.js"
            crossorigin="anonymous"
            defer
        ></script>
        <script
            src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"
            defer
        ></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
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
        <article class="article">
            <div class="article__sale-board-update">   
            <form method="post" action="HBSaleBoardUpdatePro.do" enctype="multipart/form-data">   
            	<input type="hidden" name="bid" value="${sb.bid }"/>   
            	<input type="hidden" name="pnum" value="${sb.pnum }"/>   
                <!-- 게시글에대한 카테고리 불러오기 -->
                <div class="sale-board-update__sort">
                    <select
                        class="sale-board-update__category"
                        name="ctcode"
                        required
                    >
                    	<option value="${sb.ctcode}" disabled selected hidden>${sb.ctkinds}</option>
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
                    <select
                        class="sale-board-update__category category-status"
                        name="pscode"
                        required
                    >
                    	<option value="${sb.pscode }" selected hidden>${sb.pstatus}</option>
                        <option value="1">거래가능</option>
                        <option value="2">거래중</option>
                        <option value="3">거래완료</option>
                    </select>
                    <%-- <input
                    class="sale-board-update__category--text category-input"
                    type="text"                    
                    name="mid"
                    value="${sb.mId }"
                    placeholder="아이디를 입력해주세요"
                    required>
                	</input> --%>
                <!-- <span class="sweet-rating">
                    <a href="#" class="on"><i class="fas fa-carrot"></i></a>
                    <a href="#" class="on"><i class="fas fa-carrot"></i></a>
                    <a href="#" class="on"><i class="fas fa-carrot"></i></a>
                    <a href="#"><i class="fas fa-carrot"></i></a>
                    <a href="#"><i class="fas fa-carrot"></i></a>
                </span> -->
                </div>
                <div class="sale-board-update__info">
                    <div class="sale-board-update__location">
                        <label
                            class="sale-board-update__location--label"
                            for="sale-board-update__location--input"
                            >활동 지역</label
                        >
                        <input
                            class="sale-board-update__location--input"
                            type="text"
                            readonly
                            value="회원 주소값 넣기"
                        />
                    </div>
                    <div class="sale-board-update__price">
                        <label
                            class="sale-board-update__price--label"
                            for="sale-board-update__price--input"
                            >거래 가격</label
                        >
                        <input
                            class="sale-board-update__price--input"
                            type="text"
                            placeholder="가격을 입력하세요"
                            value="${sb.pprice }"
                            name="pprice"
                            required
                        />
                    </div>
                </div>
                <div class="sale-board-update__image">
                    <div class="sale-board-update__image--title">사진 첨부</div>
                    <div class="sale-board-update__image--container">
                        <!-- 이미지경로 받아오기 -->
                        <div class="image--input-container">
                            <label class="image--input-label">
                                <div class="image--input-button button-1">
                                   <c:if test="${sb.pimg1 != null }">
                        			 <img
                               			 src="/s20200903/img/sale/${sb.pimg1}"
                                	     alt="img-thumbnail1"
                             		 />
                                    </c:if>
                                    <div class="del-btn"></div>
                                </div>
                                <input
                                    class="image--input image-1"
                                    type="file"
                                    value="${pimg1 }"
                                    name="file1"
                                    accept=".jpg, .jpeg, .png"
                                />
                            </label>
                        </div>
                        <div class="image--input-container">
                            <label class="image--input-label">
                                <div class="image--input-button button-2">
                                    <c:if test="${sb.pimg2 != null }">
                        			 <img
                               			 src="/s20200903/img/sale/${sb.pimg2}"
                                	     alt="img-thumbnail1"
                             		 />
                                    </c:if>
                                    <div class="del-btn"></div>
                                </div>
                                <input
                                    class="image--input image-2"
                                    type="file"
                                    value="${pimg3 }"
                                    name="file12"
                                    accept=".jpg, .jpeg, .png"
                                />
                            </label>
                        </div>
                        <div class="image--input-container">
                            <label class="image--input-label">
                                <div class="image--input-button button-3">
                                    <c:if test="${sb.pimg3 != null }">
                        			 <img
                               			 src="/s20200903/img/sale/${sb.pimg3}"
                                	     alt="img-thumbnail1"
                             		 />
                                    </c:if>
                                    <div class="del-btn"></div>
                                </div>
                                <input
                                    class="image--input image-3"
                                    type="file"
                                    value="${pimg3 }"
                                    name="file3"
                                    accept=".jpg, .jpeg, .png"
                                />
                            </label>
                        </div>
                        <div class="image--input-container">
                            <label class="image--input-label">
                                <div class="image--input-button button-4">
                                    <div class="image--input-button button-3">
                                        <c:if test="${sb.pimg4 != null }">
                        			 <img
                               			 src="/s20200903/img/sale/${sb.pimg4}"
                                	     alt="img-thumbnail1"
                             		 />
                                    </c:if>
                                        <div class="del-btn"></div>
                                    </div>
                                </div>
                                <input
                                    class="image--input image-4"
                                    type="file"
                                    value=""
                                    name="file4"
                                    accept=".jpg, .jpeg, .png"
                                />
                            </label>
                        </div>
                        <div class="image--input-container">
                            <label class="image--input-label">
                                <div class="image--input-button button-5">
                                    <c:if test="${sb.pimg5 != null }">
                        			 <img
                               			 src="/s20200903/img/sale/${sb.pimg5}"
                                	     alt="img-thumbnail1"
                             		 />
                                    </c:if>
                                    <div class="del-btn"></div>
                                </div>
                                <input
                                    class="image--input image-5"
                                    type="file"
                                    id="pimg5"
                                    name="file5"
                                    accept=".jpg, .jpeg, .png"
                                />
                            </label>
                        </div>
                    </div>
                </div>
                <div class="sale-board-update__title">
                    <textarea
                        class="sale-board-update__title--textarea"
                        placeholder="제목 가져오기"
                        id="ptitle"
                        name="ptitle"
                        required>${sb.ptitle }</textarea>
                </div>
                <div class="sale-board-update__content">
                    <textarea
                        class="sale-board-update__content--textarea"
                        placeholder="내용가져오기"
                        name="pcontent"
                        id="pcontent"
                        required>${sb.pcontent }</textarea>
                </div>
                
                <input type="hidden" name="bid" value="${sb.bid}"/>
				<input type="hidden" name="pnum" value="${sb.pnum}"/>
                
                <div class="sale-board-update__btn-container">
                    <a href="list.do"
                        ><div class="sale-board-update__list list--btn">
                            돌아가기
                        </div></a
                    >
                    <input
                        class="sale-board-update__submit"
                        type="submit"                        
                        value="수정하기"/>
                </div>
                </form>
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