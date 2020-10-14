<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>검거완료! :: 당근나라</title>
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
<%@ include file="header.jsp"%>
<%@ include file="aside.jsp"%>
<body>
	<!-- 섹션 시작 -->
	<article class="article">
	<form action="SJblackListBoardInsert.do" method="post" enctype="multipart/form-data" >
	<div class="article__black-list-board-write">
			<input type="hidden" name="mId" id="mId" value="admin">
		<div class="black-list-board-write__image">
			<div class="black-list-board-write__image--title">사진 첨부</div>
			<div class="black-list-board-write__image--container">
				<div class="image--input-container">
					<label class="image--input-label">
						<div class="image--input-button button-1"></div> <input
						class="image--input image-1" type="file" name="img"
						accept=".jpg, .jpeg, .png" />
					</label>
				</div>
				<div class="image--input-container">
					<label class="image--input-label">
						<div class="image--input-button button-2"></div> <input
						class="image--input image-2" type="file" name="img"
						accept=".jpg, .jpeg, .png" />
					</label>
				</div>
				<div class="image--input-container">
					<label class="image--input-label">
						<div class="image--input-button button-3"></div> <input
						class="image--input image-3" type="file" name="img"
						accept=".jpg, .jpeg, .png" />
					</label>
				</div>
				<div class="image--input-container">
					<label class="image--input-label">
						<div class="image--input-button button-4"></div> <input
						class="image--input image-4" type="file" name="img"
						accept=".jpg, .jpeg, .png" />
					</label>
				</div>
				<div class="image--input-container">
					<label class="image--input-label">
						<div class="image--input-button button-5"></div> <input
						class="image--input image-5" type="file" name="img"
						accept=".jpg, .jpeg, .png" />
					</label>
				</div>
			</div>
		</div>
		<div class="black-list-board-write__title">
			<textarea class="black-list-board-write__title--textarea" id="ptitle" name="pTitle"
				placeholder="제목을 입력해주세요" required></textarea>
		</div>
		<div class="black-list-board-write__content">
			<textarea class="black-list-board-write__content--textarea" id="pcontent" name="pContent"
				placeholder="내용을 입력해주세요" required></textarea>
		</div>
		<div class="black-list-board-write__btn-container">
		<div class="black-list-board-write__list list--btn">돌아가기</div> <input class="black-list-board-write__submit" type="submit" value="작성하기" />
		</div>
	</form>
	</div>
	</article>
<%@ include file="chat.jsp"%>
<%@ include file="footer.jsp"%>
</body>
</html>