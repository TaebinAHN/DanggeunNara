<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includeJSP.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">﻿
$(function(){
	$('.comment__info--update').on('click',function(e){//댓글 수정창 추가
    	var div = $(this).closest('li').find('div');
    
    	var leng = div.length;

    	for(var i = 0; i < leng; i++){
    	console.log(div[i])
    	}

    	div[2].innerHTML= 	'<div class="comment__update-container">'+
						'	<textarea id="comment__update--textarea" name="cCmnt"></textarea>'+
						'	<input class="comment__update-btn" type="submit" value="댓글 수정"/>'+
						'</div>';
	})
	
	$('.comment__info--comment').on('click',function(e){//답글 작성란 추가
    	var div = $(this).closest('li').find('div');
    
    	var leng = div.length;

    	for(var i = 0; i < leng; i++){
    	console.log(div[i])
    	}

    	div[3].innerHTML= 	'<div class="comment__reply-container">'+
							'	<textarea id="comment__reply--textarea" name="cCmnt"></textarea>'+
						'	<input class="comment__reply-btn" type="submit" value="답글 남기기"/>'+
						'</div>';
	})
})
</script>
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
				<strong class="comment__title">댓글 <span class="comment__count">${jhCtotal}</span></strong>
			<!-- 댓글 작성 부분 -->
				<form name="JHbrBoardCommWrite" action="JHbrBoardCommWrite.do?pNum=${jhBoard.pNum}" method="post">
				<textarea
					id="comment__textarea"
					placeholder="댓글을 작성해주세요"
					name="cCmnt"></textarea>
				<input
					class="comment__submit-btn"
					type="submit"
					value="댓글 남기기"/>
				</form>                      
			<!-- 댓글 리스트 -->				
					<ul class="comment__container" id="comment_area">
					<c:forEach var="jhComments" items="${jhComments }">
					<input type="hidden" id="cNum" value="${jhComments.cNum}">               	
						<li <c:if test="${jhComments.cLevel == 0}">id="comment__main"</c:if>
							<c:if test="${jhComments.cLevel == 1}">id="comment__sub"</c:if>
							<c:if test="${jhComments.cLevel > 1}">id="comment__subsub"</c:if>>												
							<div class="comment__nick-name">${jhComments.mNick}
							<c:if test="${jhComments.cLevel == 0}">
								<p class="comment__content">${jhComments.cCmnt}</p>
							</c:if>
							<c:if test="${jhComments.cLevel != 0}">						
								<p class="comment__content">
									<span class="comment__content--nick-name"></span>${jhComments.cCmnt}
								</p>
							</c:if>
							</div>	
							<div class="comment__info">
								<span class="comment__info--date">${jhComments.cDate}</span>
									<a class="comment__info--comment"
										href="#none"
									>답글쓰기</a>
									<a	class="comment__info--update"
										href="#none"
									>수정</a>
									<a	class="comment__info--delete"
										href="JHbrBoardCommDelete.do?cNum=${jhComments.cNum}&pNum=${jhBoard.pNum}"
									>삭제</a>
							</div>																		
							<!-- 댓글 수정 창 -->
							<form action="JHbrBoardCommUpdate.do?cNum=${jhComments.cNum}&pNum=${jhBoard.pNum}" method="post">
								<div>
								</div>
							</form>
							<!-- 답글 작성창 -->
							<form action="JHbrBoardCommRe.do?cLot=${jhComments.cLot}&pNum=${jhBoard.pNum}&cSeq=${jhComments.cSeq}&cLevel=${jhComments.cLevel}" method="post">
								<div>
								</div>
							</form>
						</li>                      					
					</c:forEach>
				</ul>
			</div>
		</div>
	</article>
<%@include file="footer.jsp"%>
</body>
</html>