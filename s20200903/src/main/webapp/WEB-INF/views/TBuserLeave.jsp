<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includeJSP.jsp" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>회원탈퇴 :: 당근나라</title>
        <link rel="stylesheet" href="../css/common.css" />
        <script src="../javascript/common.js" defer></script>
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
	        <form action="TBMemberLeave.do" method="post">
	        <input type="hidden" name="mId" id="mId" value="${sessionScope.mId}">
	            <div class="user-leave">
	                <div class="user-leave__head">
	                    <h1 class="user-leave__title">회원탈퇴</h1>
	                    <p class="user-leave__sub">
	                        <span class="user-leave__sub--color-pink">*</span>
	                        필수입력사항
	                    </p>
	                </div>
	                <div class="userleave--form">
	                    <table class="userleave--form__table">
	                        <tr>
	                            <th>회원탈퇴안내</th>
	                            <td>
	                                <p>이용에 불편을 드려 죄송합니다.</p>
	                                <p>
	                                    항상 발전하는 당근나라가 되도록
	                                    노력하겠습니다.
	                                </p>
	                                <p>그동안 이용해주셔서 감사합니다.</p>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>
	                                비밀번호확인<span
	                                    class="userleave--form__sub--color-pink"
	                                    >*</span
	                                >
	                            </th>
	                            <td>
	                                <input
	                                    class="userleave--form__input"
	                                    name="mPw"
	                                    type="text"
	                                    maxlength="16"
	                                    placeholder="비밀번호를 입력해주세요"
	                                    required
	                                />
	                            </td>
	                        </tr>
	                    </table>
	                    <div class="user-leave__btn">
	                        <input
	                            class="user-leave__cancle"
	                            type="button"
	                            value="돌아가기"
	                        />
	                        <input
	                            class="user-leave__submit"
	                            type="submit"
	                            value="탈퇴하기"
	                        />
	                    </div>
	                </div>
	            </div>
            </form>
        </section>
		<%@ include file="footer.jsp" %>
    </body>
</html>
