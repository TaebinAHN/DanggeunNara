<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includeJSP.jsp" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>판매중이에요~! :: 당근나라</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" />
        <script src="${pageContext.request.contextPath}/javascript/common.js" defer></script>
        <script
            src="https://kit.fontawesome.com/797af710b1.js"
            crossorigin="anonymous"
            defer
        ></script>
        <script
            src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"
            defer
        ></script>
        <link
            rel="shortcut icon"
            type="image/x-icon"
            href="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fcz9VUi%2FbtqJt0b2VUe%2FiiBIEnDkufPInk4hKsunE1%2Fimg.png"
        />
        <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&display=swap"
            rel="stylesheet"
        />
    </head>

    <body>
        <!-- 섹션 시작 -->
        <div class="to-sale">
            <!-- 판매게시판 시작 -->
            <div class="to-sale__article-container">
                <div class="to-sale__head-container">
               	 
                    <div class="to-sale__sort">
                        <select
                            class="to-sale__category"
                            name="to-sale__category"
                        >
                            <option value="all" selected>전체</option>
                            <option value="pdate">최근 30일</option>
                            <option value="ppicks">관심순</option>
                            <option value="phit">조회순</option>
                        </select>
                        <select
                            class="to-sale__category"
                            name="to-sale__category--code"
                        >
                            <option value="all" selected>전체</option>
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
                    <div class="to-sale__head">
                        <h1 class="to-sale__title">판매중</h1>
                        <p class="to-sale__sub">
                            <strong class="to-sale__total-head">전체 글</strong>
                            <!-- 불러오는 게시글 갯수불러오기 -->
                            <span class="to-sale__count">${pg.total}</span>
                        </p>
                        <c:if test="${sessionScope.mId != null}">
                        <a href="HBSaleBoardWrite.do?bid=1&mId=${sessionScope.mId}"
                            ><div class="to-sale__write">글작성</div></a
                        >
                        </c:if>
                    </div>
                </div>
                <!-- 각 최신글 9 ~ 12개만 띄어주시면 됩니다 -->
                <div class="to-sale__content">
                    <!-- 태그 안에 있는 더미 데이터들은 틀을 보기 위함이며 실제 작업시엔 해당 데이터를 불러 올 수 있도록 변경 부탁드립니다. -->
                    <c:forEach items="${list}" var="sb">
                    <article class="to-sale__article">                    	
	                        <a href="HBSaleBoardRead.do?bId=${sb.bId}&pNum=${sb.pNum}&mId=${sessionScope.mId}">
	                            <div class="to-sale__content--thumbnail">
	                                <img
	                                    src="/s20200903/img/sale/${sb.pImg1}"
	                                    alt="img-thumbnail"
	                                />
	                            </div>
	                            <div class="to-sale__content--text">
	                                <h1 class="to-sale__content--text__title">
	                                    ${sb.pTitle}
	                                </h1>
	                                <div class="to-sale__content--text__date">
	                                    <div class="to-sale__content--date">
	                                       <fmt:formatDate value="${sb.pDate}" pattern="yyyy-MM-dd"/>
	                                    </div>
	                                    <div class="to-sale__content--hit">
	                                        	조회수 ${sb.pHit}
	                                    </div>
	                                </div>
	                                <div class="to-sale__content--text__price">
	                                    <div class="to-sale__content--price">
	                                        <fmt:formatNumber value="${sb.pPrice}" pattern="#,###" />원
	                                    </div>
	                                    <div class="to-sale__content--picks">
	                                        <img
	                                            src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/like-8111aa74d4b1045d7d5943a901896992574dd94c090cef92c26ae53e8da58260.svg"
	                                            alt="picks"
	                                            
	                                        />
	                                        ${sb.pPicks}
	                                    </div>
	                                </div>
	                            </div>
	                        </a>                    	
                   	 	</article>
                    </c:forEach>
 
                </div>
            </div>
            <div class="to-sale__page-num-container">
                <ul class="page-num-container">
                    <a href="#">
						<li class="page-num-container__left-btn page-num-container__btn">
							<i class="fas fa-chevron-left"></i>
						</li>
					</a>
                    	<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
							<a href="list.do?sword=${bId }&currentPage=${i}">
							<li class="page-num-container__num">${i}</li>
							</a>
						</c:forEach>
					<a href="list.do?sword=${bId }&currentPage=${i+1}">
						<li class="page-num__right-btn page-num-container__btn">
							<i class="fas fa-chevron-right"></i>
						</li>
					</a>                   
                </ul>
            </div>
        </div>
	<%@ include file="footer.jsp" %>
    </body>
</html>