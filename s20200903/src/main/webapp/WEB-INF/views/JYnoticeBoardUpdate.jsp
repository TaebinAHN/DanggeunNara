<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includeJSP.jsp"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>글수정하기 :: 당근나라</title>
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
	
	<form action="JYnoticeBoardUpdate.do" method="post" name="frm" enctype="multipart/form-data">
	<article class="article">
		<div class="article__notice-board-update">
			<div class="notice-board-update__info">
				<div class="notice-board-update__location">
				<!-- 	<label class="notice-board-update__location--label"
						for="notice-board-update__location--input">활동지역</label> 
						<input class="notice-board-update__location--input" type="text" readonly value="회원 주소값 넣기" /> -->
				</div>
			</div>
			<div class="notice-board-update__image">
				<div class="notice-board-update__image--title">사진 첨부</div>
				<div class="notice-board-update__image--container">
					<!-- 이미지경로 받아오기 -->
					
                   <div class="image--input-container">
                            <label class="image--input-label">    
                                                   
						<div class="image--input-button button-1">
                        	<img class="update-image1 image-1" src="/s20200903/resources/image/${jyPost.pImg1}" alt="이미지1"/>
                            <div class="del-btn1 del-btn"></div>
                        </div>
                            <input name ="img" class="image--input image-1" type="file" accept=".jpg, .jpeg, .png"/>
                            </label>
                        </div>
                        
                        
                        <div class="image--input-container">
                            <label class="image--input-label">
                                <div class="image--input-button button-2">
                                <c:if test="${jyPost.pImg2 != 'null' && jyPost.pImg2 != null}">
                                    <img class="update-image2 image-2" src="/s20200903/resources/image/${jyPost.pImg2}" alt="이미지2"/>
                                    <div class="del-btn2 del-btn"></div>
                                </c:if>
                                </div>
                                <input name ="img" class="image--input image-2" type="file" accept=".jpg, .jpeg, .png"/>
                            </label>
                        </div>
                        
                        
                        <div class="image--input-container">
                            <label class="image--input-label">
                                <div class="image--input-button button-3">
                                <c:if test='${jyPost.pImg3 != "null" && jyPost.pImg3 != null}'>
                                    <img class="update-image3 image-3" src="/s20200903/resources/image/${jyPost.pImg3 }" alt="이미지3"/>
                                    <div class="del-btn3 del-btn"></div>
                                </c:if>
                                </div>
                                <input name ="img" class="image--input image-3" type="file" accept=".jpg, .jpeg, .png"/>
                            </label>
                        </div
                        >
                        <div class="image--input-container">
                            <label class="image--input-label">
                                <div class="image--input-button button-4">
                                    <div class="image--input-button button-3">
                                    <c:if test='${jyPost.pImg4 != "null" && jyPost.pImg4 != null}'>
                                        <img class="update-image4 image-4" src="/s20200903/resources/image/${jyPost.pImg4 }" alt="이미지4"/>
                                        <div class="del-btn4 del-btn"></div>
                                    </c:if>
                                    </div>
                                </div>
                                <input name ="img" class="image--input image-4" type="file" accept=".jpg, .jpeg, .png"/>
                            </label>
                        </div>
                        <div class="image--input-container">
                            <label class="image--input-label">
                                <div class="image--input-button button-5">
                                <c:if test='${jyPost.pImg5 != "null" && jyPost.pImg5 != null}'>
                                    <img class="update-image5 image-5" src="/s20200903/resources/image/${jyPost.pImg5 }" alt="이미지5"/>
                                    <div class="del-btn5 del-btn"></div>
                                </c:if>
                                </div>
                                <input name ="img" class="image--input image-5" type="file" accept=".jpg, .jpeg, .png"/>
                            </label>
                        </div>
						
						
												
					</div>
				</div>
			<!-- input--------------------------------------------------------------------------- -->
			<div class="notice-board-update__title">
				<input type="text" class="notice-board-update__title--textarea"
					   name="pTitle" value="${jyPost.pTitle}" required/>
			<div class="notice-board-update__content">
				<input type="text" class="notice-board-update__content--textarea"
					   name="pContent" value="${jyPost.pContent}" required/>
			</div>
				 <!-- 게시판 구분코드 공지사항 = 0 -->
				<input type="hidden" name="pNum" value="${jyPost.pNum}"/>
				<input type="hidden" name="mId"/> <%-- ${jyPost.mId} --%>
				
			
			<div class="notice-board-update__btn-container">
				<a href="JYnoticeBoard.do">
				<div class="notice-board-update__list list--btn">돌아가기</div></a> 
				<input class="notice-board-update__submit" type="submit" value="수정하기" />
			</div>
		</div>
	</article>
	</form>

	<!-- 하단 카피라이트 -->
	<%@ include file="footer.jsp" %>
</body>
</html>
