<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="includeJSP.jsp" %>
<html lang="ko">
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>로그인 :: 당근나라</title>
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
        
        <section class="section">
            <article class="user-detail">
                <div class="user-detail__container">


				<div class="user-detail__info">
					<div class="user-detail__text">
						<strong class="user-detail__text--name">${sjmm.mId} (${sjmm.mNick})</strong>
						<p class="user-detail__text--address">${sjmm.mAddr }</p>
					</div>
					<div class="user-detail__sweet--container">
						<div class="user-detail__sweet--item sweet-cotainer"></div>
						<p class="user-detail__sweet--title">당도</p>
					</div>
				</div>
				<c:set var="num" value="${pg1.total-pg1.start+1}"></c:set>
				<c:if test="${sessionScope.checklevel == 3 }">

					<div class="user-detail__info-admin">
						<strong>회원 상세내역</strong>
						<table>
							<tr>
								<td>이름</td>
								<td>${sjmm.mName }</td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td>${sjmm.mTel }</td>
							</tr>
							<tr>
								<td>상태</td>
								<td><select name="info-status" id="info-status">
										<option value="general">일반</option>
										<option value="suspension">정지</option>
								</select></td>
							</tr>
						</table>
					</div>
				</c:if>
				<div class="user-detail__status">
					<p>
						회원등급 :
						<c:if test="${sessionScope.checklevel == 1 }">일반회원</c:if>
						<c:if test="${sessionScope.checklevel == 3 }">관리자</c:if>
					</p>
					<div class="vertical"></div>
					<p>총 거래내역 : 12건</p>
					<div class="vertical"></div>
					<p>총 판매내역 : 8건</p>
					<div class="vertical"></div>
					<p>총 나눔내역 : 1건</p>
					<div class="vertical"></div>
					<p>총 구매내역 : 3건</p>
				</div>
				<!-- 카테고리 불문 최신 순, 제목에 해당 게시글 링크-->
				<div class="user-detail__summary">
					<strong>활동내역</strong>
					<table>
						<tr>
							<th>번호</th>
							<th>카테고리 </th>
							<th>제목</th>
							<th>작성일</th>
						</tr>
						<c:forEach var="sjm" items="${sjmember }">
							<tr>
									<td>${num }</td>
									<td><c:if test="${sjm.bId == 0 }">공지사항</c:if> 
										<c:if test="${sjm.bId == 1 }">판매중</c:if> 
										<c:if test="${sjm.bId == 2 }">구매중</c:if> 
										<c:if test="${sjm.bId == 3 }">나눔중</c:if> 
										<c:if test="${sjm.bId == 4 }">불량거래게시판</c:if> 
										<c:if test="${sjm.bId == 5 }">블랙리스트게시판</c:if>
									</td>
									<td>
										<c:if test="${sjm.bId == 0 }"><a href="JYnoticeBoardRead.do?pNum=${sjm.pNum}">${sjm.pTitle }</c:if> 
										<c:if test="${sjm.bId == 1 }"><a href="HBSaleBoardRead.do?pNum=${sjm.pNum}">${sjm.pTitle }</c:if> 
										<c:if test="${sjm.bId == 2 }"><a href="buyPostDetail.do?pNum=${sjm.pNum}">${sjm.pTitle }</c:if> 
										<c:if test="${sjm.bId == 3 }"><a href="JYtoSharingBoardRead.do?pNum=${sjm.pNum}">${sjm.pTitle }</c:if> 
										<c:if test="${sjm.bId == 4 }"><a href="JHbadReviewBoardRead.do?pNum=${sjm.pNum}">${sjm.pTitle }</c:if> 
										<c:if test="${sjm.bId == 5 }"><a href="SJblackListBoardRead.do?pNum=${sjm.pNum}">${sjm.pTitle }</c:if>
									<a href="#">${sjm.pTitle }</a>
									</td>
									<td><fmt:formatDate pattern="yy-MM-dd HH:mm:ss" value="${sjm.pDate }"/></td>
							</tr>
							<c:set var="num" value="${num - 1 }"></c:set>
						</c:forEach>
					</table>
				</div>
				<div class="user-detail__page-num-container">
                        <ul class="page-num-container">
                        <c:if test="${pg1.startPage > pg1.pageBlock }">
                            <a href="SJUserDetail.do?currentPage=${pg1.startPage-pg1.pageBlock}&mId=${sjmm.mId }">
                                <li class="page-num-container__left-btn page-num-container__btn">
                                    <i class="fas fa-chevron-left"></i>
                                </li>
                            </a>
                            </c:if>
                            <c:forEach var="i" begin="${pg1.startPage }" end="${pg1.endPage }">
                            <a href="SJUserDetail.do?currentPage=${i}&mId=${sjmm.mId }">
                                <li class="page-num-container__num">${i}</li>
                            </a>
                            </c:forEach>
                            <c:if test="${pg1.endPage < pg1.totalPage }">
                            <a href="SJUserDetail.do?currentPage=${pg1.startPage+pg1.pageBlock}&mId=${sjmm.mId }">
                                <li class="page-num__right-btn page-num-container__btn">
                                    <i class="fas fa-chevron-right"></i>
                                </li>
                            </a>
                            </c:if>
                        </ul>
 					</div>  
             
                </div>
            </article>
        </section>     
    <%@ include file="chat.jsp" %>
	<%@ include file="footer.jsp" %>
    </body>
</html>