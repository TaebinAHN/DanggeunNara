<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includeJSP.jsp"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>글수정하기 :: 당근나라</title>
        <link rel="stylesheet" href="css/common.css" />
        <!-- <script src="javascript/common.js" defer></script> -->
        <script
            src="https://kit.fontawesome.com/797af710b1.js"crossorigin="anonymous" defer></script>
        <script
            src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <link
            rel="shortcut icon"
            type="image/x-icon"
            href="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fcz9VUi%2FbtqJt0b2VUe%2FiiBIEnDkufPInk4hKsunE1%2Fimg.png"/>
        <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&display=swap"/>
    </head>
    
    <script type="text/javascript">
    
    </script>

    <body>
        
        <!-- 섹션 시작 -->
        <form action="JYtoSharingBoardUpdate.do" method="post" enctype="multipart/form-data">
        <article class="article">
            <div class="article__sharing-board-update">
                <!-- 게시글에대한 카테고리 불러오기 -->
                <div class="sharing-board-update__sort">
                    <select class="sharing-board-update__category" required name="ctCode">
                    	<option value="${jyPost.ctCode}" selected hidden>${jyPost.ctKinds }</option>
                        <option value="1">디지털/가전</option>
                        <option value="2">가구/인테리어</option>
                        <option value="3">유아동/유아도서</option>
                        <option value="4">생활/가공식품</option>
                        <option value="5">스포츠/레저</option>
                        <option value="6">여성잡화</option>
                        <option value="7">여성의류</option>
                        <option value="8">남성패션/잡화</option>
                        <option value="9">게임/취미</option>
                        <option value="10">뷰티/미용</option>
                        <option value="11">반려동물용품</option>
                        <option value="12">도서/티켓/음반</option>
                        <option value="13">기타중고물품</option>
                    </select>
                    
                    <select class="sharing-board-update__category category-status" name="psCode" required>
                 	    <option value="${jyPost.psCode}" selected hidden>${jyPost.pStatus }</option>
                       	<option value="1" >거래가능</option>
					 	<option value="2" >거래중</option> 
					 	<option value="3" >거래완료</option> 
                    </select>
                    
                   <%--  <input class="sharing-board-update__category--text category-input" type="text"
                       name="mId" value="${jyPost.mId }" required> --%>
                       
                    </input>
                </div>
                <div class="sharing-board-update__info">
                    <div class="sharing-board-update__location">
                        <label class="sharing-board-update__location--label" for="sharing-board-update__location--input">활동 지역</label>
                        <input class="sharing-board-update__location--input" type="text" readonly value="주소"/>
                    </div>
                    <div class="sharing-board-update__price">
                        <label class="sharing-board-update__price--label" for="sharing-board-update__price--input"></label>
                        <input class="sharing-board-update__price--input" type="text" readonly value="무료나눔"/>
                    </div>
                </div>
                <div class="sharing-board-update__image">
                    <div class="sharing-board-update__image--title">사진 첨부</div>
                    <div class="sharing-board-update__image--container">
                    
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
                <div class="sharing-board-update__title">
                    <input type="text" class="sharing-board-update__title--textarea"
					   name="pTitle" value="${jyPost.pTitle}" required/>
                </div>
                <div class="sharing-board-update__content">
                	<input type="text" class="sharing-board-update__content--textarea"
					   name="pContent" value="${jyPost.pContent}" required/>
                 
                </div>
                <%-- <input type="hidden" name="bId" value="${jyPost.bId}"/> <!-- 게시판 구분코드 공지사항 = 0 --> --%>
				<input type="hidden" name="pNum" value="${jyPost.pNum}"/>
				<input type="hidden" name="mId"/>
			
	
                
                <div class="sharing-board-update__btn-container">
                    <a href="JYtoSharingBoard.do"><div class="sharing-board-update__list list--btn">돌아가기</div></a>
                   
                    <input class="sharing-board-update__submit" type="submit" value="수정하기"/>
                </div>
            </div>
        </article>
</form>
       <%@ include file="footer.jsp" %>
    </body>
</html>
