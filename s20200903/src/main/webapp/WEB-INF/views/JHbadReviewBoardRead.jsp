<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includeJSP.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>불량거래후기 :: 당근나라</title>
</head>
<body>
	<article class="article">
		<div class="article__bad-review-board-read">
		<!-- img  -->
			<div class="silder-container">
				<div class="slider">
					<c:if test="${jhBoard.pImg1 != null }">
					<div class="slide showing">
						<img src="${jhBoard.pImg1 }"
							 alt="이미지1"/>
					</div>
					</c:if>
					<c:if test="${jhBoard.pImg2 != null }">
					<div class="slide">
						<img src="${jhBoard.pImg2 }"
							 alt="이미지2"/>
					</div>
					</c:if>
					<c:if test="${jhBoard.pImg3 != null }">
					<div class="slide">
						<img src="${jhBoard.pImg3 }"
							 alt="이미지3"/>
					</div>
					</c:if>
					<c:if test="${jhBoard.pImg4 != null }">
					<div class="slide">
						<img src="${jhBoard.pImg4 }"
							 alt="이미지4"/>
					</div>
					</c:if>
					<c:if test="${jhBoard.pImg5 != null }">
					<div class="slide">
						<img src="${jhBoard.pImg5 }"
							 alt="이미지5"/>
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
			<div class="bad-review-board-read__info-container">
				<div class="bad-review-board-read__info">
					<a href="../member/userDetail.html">
						<div class="bad-review-board-read__name">${jhBoard.mNick }</div>
					</a>
					<p class="bad-review-board-read__address">
						${jhBoard.mAddr }
					</p>
				</div>
			</div>
			<div class="bad-review-board-read__content">
				<h1 class="bad-review-board-read__content--title">
					${jhBoard.pTitle }
				</h1>
				<div class="bad-review-board-read__content--hits">
					${jhBoard.pDate } · 조회수 ${jhBoard.pHit }
				</div>
				<div class="bad-review-board-read__content--article">
					${jhBoard.pContent }
				</div>
			</div>
			<div class="bad-review-board-read__btn-container">
				<a href="JHbadReviewBoard.do">
					<div class="bad-review-board-read__list list-btn">
						목록
					</div>
				</a>
				<c:if test="${jhBoard.mId == sessionScope.mId }">
                    <input  class="bad-review-board-read__delete"
							type="button"
							value="삭제"
							onclick="location.href='JHbadReviewBoardDelete.do?pNum=${jhBoard.pNum}'"/>
                    <input  class="bad-review-board-read__update"
							type="button"
							value="수정"
							onclick="location.href='JHbadReviewBoardUpdateForm.do?pNum=${jhBoard.pNum}'"/>
				</c:if>
			</div>
			<!-- 댓글 부분 -->
                <div class="bad-review-board-read__comment">
                    <strong class="comment__title"
                        >댓글 <span class="comment__count">10</span></strong
                    >
                    <textarea
                        id="comment__textarea"
                        placeholder="댓글을 작성해주세요"
                    ></textarea>
                    <input
                        class="comment__submit-btn"
                        type="submit"
                        value="댓글 남기기"
                    />
                    <ul class="comment__container">
                        <li id="comment__main">
                            <div class="comment__nick-name">닉네임</div>
                            <p class="comment__content">댓글 들어가는곳</p>
                            <div class="comment__info">
                                <span class="comment__info--date"
                                    >2020.10.05</span
                                >
                                <a class="comment__info--comment" href="#none"
                                    >답글쓰기</a
                                >
                                <a
                                    class="comment__info--update"
                                    href="#none"
                                    onclick="commentUpdate()"
                                    >수정</a
                                >
                                <a class="comment__info--delete" href="#none"
                                    >삭제</a
                                >
                            </div>

                            <!-- 댓글 수정누르면 나올 수 있게 -->
                            <!-- <div class="comment__update-container">
                                <span class="comment__update--nick-name">
                                    @댓글작성자닉네임</span
                                >
                                <textarea id="comment__update--textarea">
댓글내용 가져오기</textarea
                                >
                                <input
                                    class="comment__update-btn"
                                    type="submit"
                                    value="댓글 수정"
                                />
                            </div>
                        </li> -->
                            <!-- 댓글 수정누르면 나올 수 있게 -->

                            <!-- 답글일경우에 -->
                        </li>

                        <li id="comment__sub">
                            <div class="comment__nick-name">닉네임</div>
                            <p class="comment__content">
                                <span class="comment__content--nick-name">
                                    @답글대상닉네임</span
                                >답글 들어가는곳
                            </p>
                            <div class="comment__info">
                                <span class="comment__info--date"
                                    >2020.10.05</span
                                >
                                <a class="comment__info--reply" href="#none"
                                    >답글쓰기</a
                                >
                                <a
                                    class="comment__info--update"
                                    href="#none"
                                    onclick="commentUpdate()"
                                    >수정</a
                                >
                                <a class="comment__info--delete" href="#none"
                                    >삭제</a
                                >
                            </div>
                        </li>
                        <!-- 답글일경우에 -->

                        <!-- 답글작성시 활성화 -->
                        <li id="comment__reply">
                            <div class="comment__reply-container">
                                <span class="comment__reply--nick-name">
                                    @답글대상닉네임</span
                                >
                                <textarea
                                    id="comment__reply--textarea"
                                    placeholder="답글을 남겨주세요"
                                ></textarea>
                                <input
                                    class="comment__reply-btn"
                                    type="submit"
                                    value="답글 남기기"
                                />
                            </div>
                        </li>
                        <!-- 답글작성시 활성화 -->

                        <li id="comment__main">
                            <div class="comment__nick-name">닉네임</div>
                            <p class="comment__content">댓글 들어가는곳</p>
                            <div class="comment__info">
                                <span class="comment__info--date"
                                    >2020.10.05</span
                                >
                                <a class="comment__info--comment" href="#none"
                                    >답글쓰기</a
                                >
                                <a
                                    class="comment__info--update"
                                    href="#none"
                                    onclick="commentUpdate()"
                                    >수정</a
                                >
                                <a class="comment__info--delete" href="#none"
                                    >삭제</a
                                >
                            </div>
                        </li>
                        <li id="comment__sub">
                            <div class="comment__nick-name">닉네임</div>
                            <p class="comment__content">
                                <span class="comment__content--nick-name">
                                    @답글대상닉네임</span
                                >답글 들어가는곳
                            </p>
                            <div class="comment__info">
                                <span class="comment__info--date"
                                    >2020.10.05</span
                                >
                                <a class="comment__info--comment" href="#none"
                                    >답글쓰기</a
                                >
                                <a
                                    class="comment__info--update"
                                    href="#none"
                                    onclick="commentUpdate()"
                                    >수정</a
                                >
                                <a class="comment__info--delete" href="#none"
                                    >삭제</a
                                >
                            </div>
                        </li>
                        <li id="comment__sub">
                            <div class="comment__nick-name">닉네임</div>
                            <p class="comment__content">
                                <span class="comment__content--nick-name">
                                    @답글대상닉네임</span
                                >답글 들어가는곳
                            </p>
                            <div class="comment__info">
                                <span class="comment__info--date"
                                    >2020.10.05</span
                                >
                                <a class="comment__info--comment" href="#none"
                                    >답글쓰기</a
                                >
                                <a
                                    class="comment__info--update"
                                    href="#none"
                                    onclick="commentUpdate()"
                                    >수정</a
                                >
                                <a class="comment__info--delete" href="#none"
                                    >삭제</a
                                >
                            </div>
                        </li>
                    </ul>
                    <div class="comment__page-num-container">
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
	</div>
</article>
<%@include file="footer.jsp"%>
</body>
</html>