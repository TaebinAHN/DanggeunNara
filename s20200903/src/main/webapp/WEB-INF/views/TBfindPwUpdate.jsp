<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includeJSP.jsp" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
    </head>

    <body>
        <!-- 섹션 시작 -->
        <section class="section">
        	<form action="passwdUpdate.do" method="post" name="passwdUpdate">
        	<input type="hidden" id="mId" name="mId" value="${sessionScope.mId}">
            <div class="update-pw">
                <div class="find-pw-reset__content">
                    <h1 class="update-pw__title">비밀번호 재설정</h1>
                    <p class="update-article">
                        비밀번호를 초기화 하셨군요 ?
                        <br />비밀번호를 재설정 후 이용해주세요 !
                    </p>
                </div>
                <div class="update-pw__container">
<!--                     <p class="update-pw__info--label">현재 비밀번호</p>
                    <input
                        id="pw--reset"
                        class="update-pw__info"
                        type="text"
                        placeholder="초기화된 비밀번호를 입력해주세요"
                    /> -->
                    <p class="update-pw__info--label">새 비밀번호</p>
                    <input
                        id="pw__write"
                        class="update-pw__info"
                        type="password"
                        name="mPw"
                        placeholder="새 비밀번호를 입력해주세요"
                    />
                    <div class="check__message write__message"></div>
                    <div class="check__message write__message1"></div>
                    <div class="check__message write__message2"></div>
                    <p class="update-pw__info--label">새 비밀번호확인</p>
                    <input
                        id="pw__check"
                        class="update-pw__info"
                        type="password"
                        placeholder="새 비밀번호를 한번 더 입력해주세요"
                    />
                    <div class="check__message pw__confirm"></div>
                    <div class="update-pw__btn">
                        <input
                            class="update-pw__submit"
                            type="submit"
                            value="수정하기"
                        />
                    </div>
                </div>
            </div>
            </form>
        </section>
		<%@ include file="footer.jsp" %>
    </body>
</html>
