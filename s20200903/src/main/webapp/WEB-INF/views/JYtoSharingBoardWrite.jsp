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
        <script
            src="https://kit.fontawesome.com/797af710b1.js"
            crossorigin="anonymous" defer></script>
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" defer></script>
        <link rel="shortcut icon" type="image/x-icon" href="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fcz9VUi%2FbtqJt0b2VUe%2FiiBIEnDkufPInk4hKsunE1%2Fimg.png"/>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&display=swap" rel="stylesheet"/>
    </head>

    <body>
        
        <!-- 섹션 시작 -->
        <form action="JYtoSharingBoardWrite.do" method="post" enctype="multipart/form-data">
        <article class="article">
            <div class="article__sharing-board-write">
                <div class="sharing-board-write__sort">
                    <select class="sharing-board-write__category" name="ctCode" required>  <!-- name="sharing-board-write__category--code" -->
                        <option value="" disabled selected hidden>
                            카테고리
                        </option>
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
                </div>
                <div class="sharing-board-write__info">
                    <div class="sharing-board-write__location">
                        <label
                            class="sharing-board-write__location--label"
                            for="sharing-board-write__location--input">주소</label>
                        <input class="sharing-board-write__location--input" type="text" readonly value="임시주소"/> <!--${jyPost.mAddr}  -->
                    </div>
                    <div class="sharing-board-write__price">
                        <label class="sharing-board-write__price--label" for="sharing-board-write__price--input">
                         <input type="hidden"></label><!-- 가격 -->
                        <input class="sharing-board-write__price--input" type="text" readonly value="무료나눔"/>
                    </div>
                </div>
                
                
                <div class="sharing-board-write__image">
                    <div class="sharing-board-write__image--title">사진 첨부</div>
                    <div class="sharing-board-write__image--container">
                    
                        <div class="image--input-container">
                            <label class="image--input-label">
                            
                                <div class="image--input-button button-1"></div>
                                <input class="image--input image-1" type="file" accept=".jpg, .jpeg, .png" name="img"/>
                            </label>
                        </div>
                        <div class="image--input-container">
                            <label class="image--input-label">
                                <div class="image--input-button button-2"></div>
                                <input class="image--input image-2" type="file" accept=".jpg, .jpeg, .png" name="img"/>
                            </label>
                        </div>
                        <div class="image--input-container">
                            <label class="image--input-label">
                                <div class="image--input-button button-3"></div>
                                <input class="image--input image-3" type="file" accept=".jpg, .jpeg, .png" name="img"/>
                            </label>
                        </div>
                        <div class="image--input-container">
                            <label class="image--input-label">
                                <div class="image--input-button button-4"></div>
                                <input class="image--input image-4" type="file" accept=".jpg, .jpeg, .png" name="img"/>
                            </label>
                        </div>
                        <div class="image--input-container">
                            <label class="image--input-label">
                                <div class="image--input-button button-5"></div>
                                <input class="image--input image-5" type="file" accept=".jpg, .jpeg, .png" name="img"/>
                            </label>
                        </div>
                        
                        
                    </div>
                </div>
                <div class="sharing-board-write__title">
   					<input type="text" class="notice-board-write__title--textarea" 
						   name="pTitle" placeholder="제목을 입력해주세요" required>
                </div>
                <div class="sharing-board-write__content">
					<input type="text" class="notice-board-write__content--textarea"
					       name="pContent" placeholder="내용을 입력해주세요" required>						   
                </div>
                
					<input type="hidden" name="mId"><%-- ${jyPost.mId} --%>
					
              
                <div class="sharing-board-write__btn-container">
                    <a href="JYtoSharingBoard.do">
                    	<div class="sharing-board-write__list list--btn">돌아가기</div></a>
                    <input class="sharing-board-write__submit" type="submit" value="작성하기"/>
                </div>
            </div>
        </article>
	</form>
 <%@ include file="footer.jsp" %>
    </body>
</html>
