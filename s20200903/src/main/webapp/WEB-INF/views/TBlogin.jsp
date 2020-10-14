<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includeJSP.jsp" %>
<!DOCTYPE html>
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
	            <form action="loginMember.do" method="post" name="login">
	            <div class="login">
	                <h1 class="login__title">로그인</h1>
	                <div class="login__container">
	                    <input
	                    	id="mId"
	                        class="login__info"
	                        type="email"
	                        name="mId"
	                        placeholder="이메일을 입력해주세요"
	                        required="required"
	                    />
	                    <input
	                    	id="mPw"
	                        class="login__info"
	                        name="mPw"
	                        type="password"
	                        placeholder="비밀번호를 입력해주세요"
	                        required="required"
	                    />
	                    <div class="login__text">
	                        <a class="login__text--forgot" href="TBfindPw.do"
	                            ><p>비밀번호를 찾으시겠어요 ?</p></a
	                        >
	                    </div>
	                    <div class="login__btn">
	                        <input
	                            class="login__submit"
	                            type="submit"
	                            value="로그인"
	                        />
	
	                        <input
	                            class="login__join"
	                            type="button"
	                            onclick="location.href='TBjoinForm.do'"
	                            value="회원가입"
	                        />
	                    </div>
	                </div>
	            </div>
	            </form>
	        </section>
		<%@ include file="footer.jsp" %>
    </body>
</html>
