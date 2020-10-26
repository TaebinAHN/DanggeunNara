<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includeJSP.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>글작성하기 :: 당근나라</title>
<link rel="stylesheet" href="css/common.css" />
<script src="javascript/common.js" defer></script>
<script src="https://kit.fontawesome.com/797af710b1.js"
	crossorigin="anonymous" defer></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"
	defer></script>
<link rel="shortcut icon" type="image/x-icon"
	href="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fcz9VUi%2FbtqJt0b2VUe%2FiiBIEnDkufPInk4hKsunE1%2Fimg.png" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&display=swap"
	rel="stylesheet" />
</head>

<body>
	
	<!-- 섹션 시작 -->
	<form action="JYnoticeBoardWrite.do" method="post" enctype="multipart/form-data">
		<article class="article">
			<div class="article__notice-board-write">
				<div class="notice-board-write__info">
					<div class="notice-board-write__location">
						<label class="notice-board-write__location--label"
							for="notice-board-write__location--input"></label>
						<!-- <input class="notice-board-write__location--input" 
							   type="hidden" readonly value=null/>활동지역 -->
					</div>
				</div>
				<div class="notice-board-write__image">
					<div class="notice-board-write__image--title">사진 첨부</div>
					<div class="notice-board-write__image--container">
					
						<div class="image--input-container">
							<label class="image--input-label">
								<div class="image--input-button button-1"></div>
								 <input class="image--input image-1" 
								 type="file" accept=".jpg, .jpeg, .png" name="img"/>
							</label>
						</div>
						<div class="image--input-container">
							<label class="image--input-label">
								<div class="image--input-button button-2"></div> 
								<input class="image--input image-2" 
								type="file" accept=".jpg, .jpeg, .png" name="img"/>
							</label>
						</div>
						<div class="image--input-container">
							<label class="image--input-label">
								<div class="image--input-button button-3"></div> 
								<input class="image--input image-3" 
								type="file" accept=".jpg, .jpeg, .png" name="img"/>
							</label>
						</div>
						<div class="image--input-container">
							<label class="image--input-label">
								<div class="image--input-button button-4"></div> 
								<input class="image--input image-4" 
								type="file" accept=".jpg, .jpeg, .png" name="img"/>
							</label>
						</div>
						<div class="image--input-container">
							<label class="image--input-label">
								<div class="image--input-button button-5"></div> 
								<input class="image--input image-5" 
								type="file" accept=".jpg, .jpeg, .png" name="img"/>
							</label>
						</div>
					</div>
				</div>
				<!-- input--------------------------------------------------------------------------- -->
				<div class="notice-board-write__title">
					<input type="text" class="notice-board-write__title--textarea" 
						   name="pTitle" placeholder="제목을 입력해주세요" required>
				</div>
				<div class="notice-board-write__content">
					<input type="text" class="notice-board-write__content--textarea"
					       name="pContent" placeholder="내용을 입력해주세요" required>
					<!-- required: 값이 입력되야 넘어갈 수 있도록 해줌 -->
					
				
 					<input type="hidden" name="mId"> <%-- ${jyPost.mId}  --%>
					<input type="hidden" name="ctCode">
					
				</div>
	
				<div class="notice-board-write__btn-container">
					<a href="JYnoticeBoard.do">
						<div class="notice-board-write__list list--btn">돌아가기</div></a> 
					<input class="notice-board-write__submit" type="submit" value="작성하기" />
				</div>
			</div>
		</article>
	</form>

	<%@ include file="footer.jsp" %>
</body>
</html>
