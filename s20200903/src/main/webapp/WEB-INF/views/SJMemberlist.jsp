<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>회원관리:: 당근나라</title>
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
<%@ include file="includeJSP.jsp"%>

<body>
	<c:set var="num" value="${pg.total-pg.start+1}"></c:set>


	<article class="article">

	<div class="article__user-manage-list">
		<h1 class="user-manage-list--title">회원관리</h1>
		<table>
			<tr>
				<th>이름</th>
				<th>이메일</th>
				<th>닉네임</th>
				<th>전화번호</th>
				<th>주소</th>
				<th><select name="user-status" id="user-status">
						<option value="status">상태</option>
						<option value="general"> 일반</option>
						<option value="suspension">정지</option>
						<option value="withdraswal">탈퇴</option>
				</select></th>
			</tr>
			<c:forEach var="TB" items="${adminList }">
				<tr>
					<td><a href="SJUserDetail.do?mId=${TB.mId}">${TB.mName}</a></td>
					<td>${TB.mId}</td>
					<td>${TB.mNick }</td>
					<td>${TB.mTel }</td>
					<td>${TB.mAddr }</td>
					<td><c:if test="${TB.mStatus == 1}">일반</c:if> <c:if
							test="${TB.mStatus == 2}">정지</c:if> <c:if
							test="${TB.mStatus > 2}">탈퇴</c:if></td>
				</tr>
				<c:set var="num" value="${num - 1}"></c:set>
			</c:forEach>
		</table>
		<div class="user-manage-list__page-num-container">
			<ul class="page-num-container">
				<c:if test="${pg.startPage > pg.pageBlock }">
					<a href="adminList.do?currentPage=${pg.startPage-pg.pageBlock}">
						<li class="page-num-container__left-btn page-num-container__btn">
							<i class="fas fa-chevron-left" />
					</li>
					</a>
				</c:if>
				<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
					<a href="adminList.do?currentPage=${i}">
						<li class="page-num-container__num">${i}</li>
					</a>
				</c:forEach>
				<c:if test="${pg.endPage < pg.totalPage }">
					<a href="adminList.do?currentPage=${pg.startPage+pg.pageBlock}">
						<li class="page-num__right-btn page-num-container__btn"><i
							class="fas fa-chevron-right" /></li>
					</a>
				</c:if>
			</ul>
		</div>
<!-- 
 		<div class="user-manage-list__search-container">
			<select name="search-container__category" id="search-container__category">
				<option value="name">이름</option>
				<option value="email">이메일</option>
				<option value="nick-name">닉네임</option>
			</select> 
			<input class="search-container__input" type="text" placeholder="검색어 입력" /> 
			<input type="image" class="search-container__icon" src="https://img.icons8.com/ios-glyphs/30/000000/search.png" />
		</div>
	</div>
 -->
	
	<%@ include file="chat.jsp" %>
	</article>
	<%@ include file="footer.jsp" %>
</body>
</html>