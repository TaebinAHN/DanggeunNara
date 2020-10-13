<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includeJSP.jsp" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>비밀번호찾기 :: 당근나라</title>
        <!-- <link rel="stylesheet" href="/css/common.css" />
        <script src="/javascript/common.js" defer></script> -->
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
