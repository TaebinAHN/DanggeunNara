<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includeJSP.jsp"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>!!!!!!!!!!!!!!!!!!제목 불러오는 기능 찾아보기 ::당근나라!!!!!!!!!!!!!!!</title>
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
	
	
	<!-- 섹션 시작 -->
	<article class="article">
	<div class="article__sharing-board-read">
		<div class="silder-container">
			<div class="slider">
				<div class="slide showing">
					<img src="/s20200903/resources/image/${jyPost.pImg1 }" alt="img-thumbnail1"/>
				</div>
				
 				<c:if test='${jyPost.pImg2 != "null" }'>
                <div class="slide">
                    <img src="/s20200903/resources/image/${jyPost.pImg2 }" alt="img-thumbnail2"/></div>
                </c:if>
                
                <c:if test='${jyPost.pImg3 != "null" }'>
                <div class="slide">
                	<img src="/s20200903/resources/image/${jyPost.pImg3 }" alt="img-thumbnail3"/></div>
                </c:if>
                
                 <c:if test='${jyPost.pImg4 != "null" }'>
                 <div class="slide">
                 	<img src="/s20200903/resources/image/${jyPost.pImg4 }" alt="img-thumbnail4"/></div>
                 </c:if>
                 
                 <c:if test='${jyPost.pImg5 != "null" }'>
                 <div class="slide">
                 	<img src="/s20200903/resources/image/${jyPost.pImg5 }" alt="img-thumbnail5"/></div>
                 </c:if>
                 
                 
				<div class="left btns" onclick="left_move();">
					<i class="fas fa-chevron-left"></i>
				</div>
				<div class="right btns" onclick="right_move();">
					<i class="fas fa-chevron-right"></i>
				</div>
			</div>
		</div>
		<div class="sharing-board-read__info-container">
			<div class="sharing-board-read__info">
				<a href="#none">
				<div class="sharing-board-read__name">${jyPost.mNick }</div></a> <!-- 닉네임  -->
				<p class="sharing-board-read__address">${jyPost.mAddr }</p> 		<!-- 주소  -->
			</div>
			<div class="sharing-board-read__sweet-cotainer">
				<div class="sharing-board-read__sweet sweet-cotainer"></div>
				<div class="sharing-board-read__text">당도</div>	<!-- 당도 -->
			</div>
		</div>
		<div class="sharing-board-read__content">
			<h1 class="sharing-board-read__content--title">${jyPost.pTitle }</h1>
			<div class="sharing-board-read__content--detail">
				<!-- 실제 게시글에 등록된 주소, 카테고리 -->
				<span>${jyPost.mAddr }
					<div class="vertical"></div> ${jyPost.ctKinds } <!-- 카테고리종류 -->
					<div class="vertical" name ="pStatus"></div> ${jyPost.pStatus }
				</span>
			</div>
			<div class="sharing-board-read__content--price"></div>
			<div class="sharing-board-read__content--article">
				${jyPost.pContent }<!-- 게시글 내용  -->
			</div>
		  	<div class="sharing-board-read__content--hits">
                        <fmt:parseDate var="pDate" value="${jyPost.pDate}" pattern="yyyy-MM-dd HH:mm:ss" />
						<fmt:formatDate value="${pDate}" pattern="yyyy-MM-dd" /> · 조회수 ${jyPost.pHit }
            </div>
			<div class="sharing-board-read__content--counts picks-container">
				<img class="picks-ico"
					src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHg9IjBweCIgeT0iMHB4Igp3aWR0aD0iMjYiIGhlaWdodD0iMjYiCnZpZXdCb3g9IjAgMCAxNzIgMTcyIgpzdHlsZT0iIGZpbGw6IzAwMDAwMDsiPjxnIHRyYW5zZm9ybT0iIj48ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9Im5vbnplcm8iIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBzdHJva2UtbGluZWNhcD0iYnV0dCIgc3Ryb2tlLWxpbmVqb2luPSJtaXRlciIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBzdHJva2UtZGFzaGFycmF5PSIiIHN0cm9rZS1kYXNob2Zmc2V0PSIwIiBmb250LWZhbWlseT0ibm9uZSIgZm9udC13ZWlnaHQ9Im5vbmUiIGZvbnQtc2l6ZT0ibm9uZSIgdGV4dC1hbmNob3I9Im5vbmUiIHN0eWxlPSJtaXgtYmxlbmQtbW9kZTogbm9ybWFsIj48cGF0aCBkPSJNMCwxNzJ2LTE3MmgxNzJ2MTcyeiIgZmlsbD0ibm9uZSI+PC9wYXRoPjxnIGZpbGw9IiMwMDAwMDAiPjxwYXRoIGQ9Ik01MS4wNjI1LDI2Ljg3NWMtMjIuMjM0ODYsMCAtNDAuMzEyNSwxOC4yODc2IC00MC4zMTI1LDQwLjMxMjVjMCw3LjY4NDU3IDMuNDg1MzUsMTQuMzQwMzMgNi43MTg3NSwxOS4xNDg0NGMzLjIzMzQsNC44MDgxIDYuNTUwNzgsNy44OTQ1MyA2LjU1MDc4LDcuODk0NTNsNTguMTE3MTksNTguMjg1MTZsMy44NjMyOCwzLjg2MzI4bDMuODYzMjgsLTMuODYzMjhsNTguMTE3MTksLTU4LjI4NTE2YzAsMCAxMy4yNjk1MywtMTEuNjk0ODIgMTMuMjY5NTMsLTI3LjA0Mjk3YzAsLTIyLjAyNDkgLTE4LjA3NzY0LC00MC4zMTI1IC00MC4zMTI1LC00MC4zMTI1Yy0xOC40NTU1NywwIC0zMC4zMzkzNSwxMS4xMDY5MyAtMzQuOTM3NSwxNS43ODkwNmMtNC41OTgxNSwtNC42ODIxMyAtMTYuNDgxOTMsLTE1Ljc4OTA2IC0zNC45Mzc1LC0xNS43ODkwNnpNNTEuMDYyNSwzNy42MjVjMTYuMDYyMDEsMCAzMC45MDYyNSwxNS42MjEwOSAzMC45MDYyNSwxNS42MjEwOWw0LjAzMTI1LDQuNTM1MTZsNC4wMzEyNSwtNC41MzUxNmMwLDAgMTQuODQ0MjQsLTE1LjYyMTA5IDMwLjkwNjI1LC0xNS42MjEwOWMxNi4zNTU5NiwwIDI5LjU2MjUsMTMuNDE2NTEgMjkuNTYyNSwyOS41NjI1YzAsOC4yOTM0NiAtMTAuMDc4MTIsMTkuNDg0MzggLTEwLjA3ODEyLDE5LjQ4NDM4bC01NC40MjE4Nyw1NC40MjE4OGwtNTQuNDIxODcsLTU0LjQyMTg3YzAsMCAtMi42MDM1MiwtMi40OTg1NCAtNS4yMDcwMywtNi4zODI4MWMtMi42MDM1MiwtMy44ODQyOCAtNC44NzEwOSwtOC45NDQzMyAtNC44NzEwOSwtMTMuMTAxNTZjMCwtMTYuMTQ1OTkgMTMuMjA2NTQsLTI5LjU2MjUgMjkuNTYyNSwtMjkuNTYyNXoiPjwvcGF0aD48L2c+PC9nPjwvZz48L3N2Zz4="
					alt="picks" />
			</div>
		</div>
		<div class="sharing-board-read__btn-container">
			<a href="JYtoSharingBoard.do">
			<div class="sharing-board-read__list list-btn">목록</div></a> 
			
			<a href="deleteSharing.do?bId=${jyPost.bId}&pNum=${jyPost.pNum}">
			<input class="sharing-board-read__delete" type="button" value="삭제" /></a>
			
			<a href="JYtoSharingBoardUpdate.do?bId=${jyPost.bId}&pNum=${jyPost.pNum}">
			<input class="sharing-board-read__update" type="button" value="수정" /></a>
			
		</div>
	</div>
	</article>
	
	
<%@ include file="footer.jsp" %>
</body>
</html>
