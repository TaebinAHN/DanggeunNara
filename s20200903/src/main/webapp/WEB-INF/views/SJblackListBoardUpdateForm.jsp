<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글수정하기 :: 당근나라</title>
</head>
<%@ include file="header.jsp"%>
<%@ include file="aside.jsp"%>
<body>
	<!-- 섹션 시작 -->
	<form action="SJblackListBoardUpdate.do" method="post">		
		<article class="article">
		<div class="article__black-list-board-update">
			<div class="black-list-board-update__image">
				<div class="black-list-board-update__image--title">사진 첨부</div>
				<div class="black-list-board-update__image--container">
					<!-- 이미지경로 받아오기 -->
					<div class="image--input-container">
						<label class="image--input-label">
							<div class="image--input-button button-1">
						
								<div class="del-btn"></div>
							</div> <input class="image--input image-1" type="file" accept=".jpg, .jpeg, .png" name="pImg1" value="${sjb.pImg1}"/>
						</label>
					</div>
					<div class="image--input-container">
						<label class="image--input-label">
							<div class="image--input-button button-2">
							
								<div class="del-btn"></div>
							</div> <input class="image--input image-2" type="file" accept=".jpg, .jpeg, .png"  name="pImg2" value="${sjb.pImg2}"/>
						</label>
					</div>
					<div class="image--input-container">
						<label class="image--input-label">
							<div class="image--input-button button-3">
								<div class="del-btn"></div>
							</div> <input class="image--input image-3" type="file" accept=".jpg, .jpeg, .png"  name="pImg3" value="${sjb.pImg3}"/>
						</label>
					</div>
					<div class="image--input-container">
						<label class="image--input-label">
							<div class="image--input-button button-4">
								<div class="image--input-button button-3">
									<div class="del-btn"></div>
								</div>
							</div> <input class="image--input image-4" type="file" accept=".jpg, .jpeg, .png"  name="pImg4" value="${sjb.pImg4}"/>
						</label>
					</div>
					<div class="image--input-container">
						<label class="image--input-label">
							<div class="image--input-button button-5">
								<div class="del-btn"></div>
							</div> <input class="image--input image-5" type="file" accept=".jpg, .jpeg, .png"  name="pImg5" value="${sjb.pImg5}"/>
						</label>
					</div>
				</div>
			</div>
				<input type="hidden" name="bId" value="${sjb.bId }" >
				<input type="hidden" name="pNum" value="${sjb.pNum }" >
				<input type="hidden" name="pDate" value="${sjb.pDate }" >
				<input type="hidden" name="pHit" value="${sjb.pHit }" >
				<input type="hidden" name="pPicks" value="${sjb.pPicks }" >
				
			<div class="black-list-board-update__title">
				<textarea class="black-list-board-update__title--textarea" name="pTitle" required>${sjb.pTitle }</textarea>
			</div>
			<div class="black-list-board-update__content">
				<textarea class="black-list-board-update__content--textarea" name="pContent" required>${sjb.pContent }</textarea>
			</div>
			<div class="black-list-board-update__btn-container">
				<a href="SJblackListBoardRead.do?pNum=${sjb.pNum }"><div class="black-list-board-update__list list--btn">돌아가기</div></a> 
				<input class="black-list-board-update__submit" type="submit" value="수정하기" />

			</div>
		</div>
		</article>
	</form>
</body>

</html>