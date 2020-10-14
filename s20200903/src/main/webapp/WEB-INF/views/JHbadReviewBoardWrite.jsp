<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includeJSP.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>불량거래후기 :: 당근나라</title>
</head>
<body>
	<form action="JHbadReviewBoardWrite.do" method="post"
		enctype="multipart/form-data" >
	<article class="article">
		<div class="article__bad-review-board-write">
			<div class="bad-review-board-write__info">
				<div class="bad-review-board-write__location">
					<label  class="bad-review-board-write__location--label"
							for="bad-review-board-write__location--input">
							작성자 ${jhBoard.mNick }
					</label>
					<input  class="bad-review-board-write__location--input"
							type="text" readonly value="회원 지역	${jhBoard.mAddr }" />
				</div>
			</div>
			<div class="bad-review-board-write__image">
				<div class="bad-review-board-write__image--title">사진 첨부</div>
				<div class="bad-review-board-write__image--container">
					<!-- img1 -->
					<div class="image--input-container">
						<label class="image--input-label">
							<div class="image--input-button button-1"></div>
								<input  class="image--input image-1" type="file"
										accept=".jpg, .jpeg, .png" name="img"/>
						</label>
					</div>
					<!-- img2 -->
					<div class="image--input-container">
						<label class="image--input-label">
							<div class="image--input-button button-2"></div>
								<input  class="image--input image-2" type="file"
										accept=".jpg, .jpeg, .png" name="img"/>
						</label>
					</div>
					<!-- img3 -->
					<div class="image--input-container">
						<label class="image--input-label">
							<div class="image--input-button button-3"></div>
								<input  class="image--input image-3" type="file"
										accept=".jpg, .jpeg, .png" name="img"/>
						</label>
					</div>
					<!-- img4 -->
					<div class="image--input-container">
						<label class="image--input-label">
							<div class="image--input-button button-4"></div>
								<input  class="image--input image-4" type="file"
										accept=".jpg, .jpeg, .png" name="img"/>
						</label>
					</div>
					<!-- img5 -->
					<div class="image--input-container">
						<label class="image--input-label">
							<div class="image--input-button button-5"></div>
								<input  class="image--input image-5" type="file"
										accept=".jpg, .jpeg, .png" name="img"/>
						</label>
					</div>
				</div>
			</div>
			<div class="bad-review-board-write__title">
				<textarea class="bad-review-board-write__title--textarea"
					placeholder="제목을 입력해주세요" required="required" name="pTitle"></textarea>
			</div>
			<div class="bad-review-board-write__content">
				<textarea class="bad-review-board-write__content--textarea"
					placeholder="내용을 입력해주세요" required="required" name="pContent"></textarea>
			</div>
			<div class="bad-review-board-write__btn-container">
				<a href="JHbadReviewBoard.do">
					<div class="bad-review-board-write__list list--btn">돌아가기</div>
				</a>
				<input class="bad-review-board-write__submit" type="submit" value="작성하기" />
			</div>
		</div>
	</article>
	</form>
	<%@include file="footer.jsp"%>
</body>
</html>