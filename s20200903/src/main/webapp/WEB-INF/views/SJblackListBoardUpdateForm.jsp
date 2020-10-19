<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글수정하기 :: 당근나라</title>
</head>
<%@ include file="includeJSP.jsp"%>

<body>
	<!-- 섹션 시작 -->
	<form action="SJblackListBoardUpdate.do?pNum=${sjb.pNum }" method="post" enctype="multipart/form-data">		
		<article class="article">
		<div class="article__black-list-board-update">
			<div class="black-list-board-update__image">
				<div class="black-list-board-update__image--title">사진 첨부</div>
				<div class="black-list-board-update__image--container">
					<!-- 이미지경로 받아오기 -->
					<div class="image--input-container">
						<label class="image--input-label">
							<div class="image--input-button button-1">
								<c:if test="${sjb.pImg1 != null}">
									<img src="/s20200903/blackListBoardImg/${sjb.pImg1}" alt="이미지1" />	
									<div class="del-btn"></div>
								</c:if>
							</div> 
							<input class="image--input image-1" type="file" accept=".jpg, .jpeg, .png" name="img"/>
						</label>
				
					</div>
					<div class="image--input-container">
						<label class="image--input-label">
							<div class="image--input-button button-2">
								<c:if test="${sjb.pImg2 != null}">
									<img src="/s20200903/blackListBoardImg/${sjb.pImg2}" alt="이미지2" />								
									<div class="del-btn"></div>
								</c:if>
							</div> 
								<input class="image--input image-2" type="file" accept=".jpg, .jpeg, .png"  name="img"/>
						</label>
					</div>
					<div class="image--input-container">
						<label class="image--input-label">
							<div class="image--input-button button-3">
								<c:if test="${sjb.pImg3 != null}">
									<img src="/s20200903/blackListBoardImg/${sjb.pImg3}" alt="이미지3" />	
									<div class="del-btn"></div>
								</c:if>
							</div> 
								<input class="image--input image-3" type="file" accept=".jpg, .jpeg, .png"  name="img"/>
						</label>
					</div>
					<div class="image--input-container">
						<label class="image--input-label">
							<div class="image--input-button button-4">
								<c:if test="${sjb.pImg4 != null}">
									<img src="/s20200903/blackListBoardImg/${sjb.pImg4}" alt="이미지4" />	
									<div class="del-btn"></div>
								</c:if>
							</div> 
								<input class="image--input image-4" type="file" accept=".jpg, .jpeg, .png"  name="img"/>
						</label>
					</div>
					<div class="image--input-container">
						<label class="image--input-label">
							<div class="image--input-button button-5">
								<c:if test="${sjb.pImg5 != null}">
									<img src="/s20200903/blackListBoardImg/${sjb.pImg5}" alt="이미지5" />	
									<div class="del-btn"></div>
								</c:if>
							</div> 
								<input class="image--input image-5" type="file" accept=".jpg, .jpeg, .png"  name="img"/>
						</label>
					</div>
				</div>
			</div>
				<input type="hidden" name="pNum" value="${sjb.pNum }" >
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
<%@ include file="chat.jsp"%>
<%@ include file="footer.jsp"%>
</html>