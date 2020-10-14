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
<form name="jhbrBoardUpdate" action="JHbadReviewBoardUpdate.do?pNum=${jhBoard.pNum}" method="post" enctype="multipart/form-data">
<article class="article">
	<div class="article__bad-review-board-update">
		<div class="bad-review-board-update__info">
			<div class="bad-review-board-update__location">
				<label  class="bad-review-board-update__location--label"
						for="bad-review-board-update__location--input">
					작성자 ${jhBoard.mNick }
				</label>
				<input  class="bad-review-board-update__location--input"
						type="text"
						readonly
						value="회원 지역	${jhBoard.mAddr }"/>
			</div>
		</div>
		<div class="bad-review-board-update__image">
			<div class="bad-review-board-update__image--title">
				 사진 첨부
			</div>
			<div class="bad-review-board-update__image--container">
				<!-- img1 -->
				<div class="image--input-container">
					<label class="image--input-label">
						<div class="image--input-button button-1">
							<img	src="${jhBoard.pImg1 }"
									alt="이미지1"/>
							<div class="del-btn"></div>
						</div>
						<input	class="image--input image-1"
								type="file"
								accept=".jpg, .jpeg, .png"
								name="img"/>
					</label>
				</div>
				<!-- img2 -->
				<div class="image--input-container">
					<label class="image--input-label">
						<div class="image--input-button button-2">
							<img	src="${jhBoard.pImg2 }"
									alt="이미지2"/>
							<div class="del-btn"></div>
						</div>
						<input	class="image--input image-2"
								type="file"
								accept=".jpg, .jpeg, .png"
								name="img"/>
					</label>
				</div>
				<!-- img3 -->
				<div class="image--input-container">
					<label class="image--input-label">
						<div class="image--input-button button-3">
							<img	src="${jhBoard.pImg3 }"
									alt="이미지3"/>
							<div class="del-btn"></div>
						</div>
						<input	class="image--input image-3"
								type="file"
								accept=".jpg, .jpeg, .png"
								name="img"/>
					</label>
				</div>
				<!-- img4 -->
				<div class="image--input-container">
					<label class="image--input-label">
						<div class="image--input-button button-4">
							<div class="image--input-button button-3">
								<img	src="${jhBoard.pImg4 }"
										alt="이미지4"/>
								<div class="del-btn"></div>
							</div>
						</div>
						<input	class="image--input image-4"
								type="file"
								accept=".jpg, .jpeg, .png"
								name="img"/>
					</label>
				</div>
				<!-- img5 -->
				<div class="image--input-container">
					<label class="image--input-label">
						<div class="image--input-button button-5">
							<img	src="${jhBoard.pImg5 }"
									alt="이미지5"/>
							<div class="del-btn"></div>
						</div>
						<input	class="image--input image-5"
								type="file"
								accept=".jpg, .jpeg, .png"
								name="img"/>
					</label>
				</div>
			</div>
		</div>
		<!-- title -->
		<div class="bad-review-board-update__title">
			<textarea	class="bad-review-board-update__title--textarea"
						placeholder="제목을 입력해주세요"
						required="required"
						name="pTitle">
${jhBoard.pTitle }
			</textarea>
		</div>
		<!-- content -->
		<div class="bad-review-board-update__content">
			<textarea	class="bad-review-board-update__content--textarea"
                        placeholder="내용을 입력해주세요"
                        required="required"
                        name="pContent">
${jhBoard.pContent }
			</textarea>
		</div>
		<!-- button -->
		<div class="bad-review-board-update__btn-container">
			<a href="JHbadReviewBoard.do">
				<div class="bad-review-board-update__list list--btn">
					돌아가기
				</div>
			</a>
			<input type="hidden" name="pNum" value="${jhBoard.pNum }" />
			<input	class="bad-review-board-update__submit"
					type="submit"
					value="수정하기"/>
		</div>
	</div>
</article>
</form>
</body>
</html>