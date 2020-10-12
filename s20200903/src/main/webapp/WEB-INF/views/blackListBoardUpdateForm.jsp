<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글수정하기 :: 당근나라</title>
</head>
<body>
	<!-- 섹션 시작 -->
	<form action="blackListBoardUpdate.do" method="post">		
		<article class="article">
		<div class="article__black-list-board-update">
			<div class="black-list-board-update__info">
				<div class="black-list-board-update__location">
					<label class="black-list-board-update__location--label" for="black-list-board-update__location--input">활동 지역</label> 
						<input class="black-list-board-update__location--input" type="text" readonly value="회원 주소값 넣기" />
				</div>
			</div>
			<div class="black-list-board-update__image">
				<div class="black-list-board-update__image--title">사진 첨부</div>
				<div class="black-list-board-update__image--container">
					<!-- 이미지경로 받아오기 -->
					<div class="image--input-container">
						<label class="image--input-label">
							<div class="image--input-button button-1">
								<img
									src="data:image/jpeg;base64,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"
									alt="이미지1" />
								<div class="del-btn"></div>
							</div> <input class="image--input image-1" type="file" accept=".jpg, .jpeg, .png" />
						</label>
					</div>
					<div class="image--input-container">
						<label class="image--input-label">
							<div class="image--input-button button-2">
								<img
									src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRCitEjJ8125NcOUnkZyPRf711mPTxLnP6a6g&usqp=CAU"
									alt="이미지2" />
								<div class="del-btn"></div>
							</div> <input class="image--input image-2" type="file" accept=".jpg, .jpeg, .png" />
						</label>
					</div>
					<div class="image--input-container">
						<label class="image--input-label">
							<div class="image--input-button button-3">
								<img src="https://pbs.twimg.com/media/DtEUNKNVAAE2rzu.jpg" alt="이미지3" />
								<div class="del-btn"></div>
							</div> <input class="image--input image-3" type="file" accept=".jpg, .jpeg, .png" />
						</label>
					</div>
					<div class="image--input-container">
						<label class="image--input-label">
							<div class="image--input-button button-4">
								<div class="image--input-button button-3">
									<img
										src="https://i.ytimg.com/vi/bQSk7z5EW5E/hqdefault.jpg?sqp=-oaymwEXCPYBEIoBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLAfC2oEn9CREQ0FnRzXF18xOb-Mcg"
										alt="이미지4" />
									<div class="del-btn"></div>
								</div>
							</div> <input class="image--input image-4" type="file" accept=".jpg, .jpeg, .png" />
						</label>
					</div>
					<div class="image--input-container">
						<label class="image--input-label">
							<div class="image--input-button button-5">
								<img
									src="https://www.topstarnews.net/news/photo/202008/825560_548963_2442.jpg"
									alt="이미지5" />
								<div class="del-btn"></div>
							</div> <input class="image--input image-5" type="file" accept=".jpg, .jpeg, .png" />
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
				<a href="#none"><div class="black-list-board-update__list list--btn">돌아가기</div></a> 
				<input class="black-list-board-update__submit" type="submit" value="수정하기" />

			</div>
		</div>
		</article>
	</form>
</body>
<%@ include file="header.jsp"%>
<%@ include file="aside.jsp"%>
</html>