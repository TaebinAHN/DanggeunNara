<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>당근나라</title>
    <link rel="stylesheet" href="css/common.css" />
        <script src="javascript/common.js" defer></script>
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
            href="https://d1unjqcospf8gs.cloudfront.net/favicon.ico"
        />
        <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&display=swap"
            rel="stylesheet"
        />
</head>
<body>
        <!-- 메뉴 고정바 -->
        <header class="header">
            <div class="header__fixed-bar">
                <section class="header__fixed-bar-logo section-logo">
                    <a href="main.do">
                        <img
                            src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FSQxEt%2FbtqJs5kkQnP%2FhvX1kh8aeqli9J93tF5qV1%2Ftfile.svg"
                            alt="당근마켓"
                        />
                    </a>
                </section>
                <section class="header__fixed-bar-search section-search">
                    <div class="header__fixed-bar-search-container">
                        <input
                            class="search-input"
                            type="text"
                            placeholder="동네 이름, 물품명 등을 검색해보세요!"
                        />
                        <input
                            type="image"
                            class="search-icon"
                            src="https://img.icons8.com/ios-glyphs/30/000000/search.png"
                        />
                    </div>
                </section>
                <section class="header__fixed-bar-nav section-nav">
                    <nav class="header__fixed-bar-nav-container">
                    <c:choose>
                    	<c:when test="${sessionScope.mId != null}">
	                    	<ul class="header__fixed-bar-nav-list nav-list">
	                            <li class="nav-list-content drop">
	                                <span class="nav-list-text">
	                                    <span class="name">${sessionScope.mId}</span>님 </span
	                                ><img
	                                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABmJLR0QA/wD/AP+gvaeTAAAA1ElEQVRIie2TsQ3CMBBF/zkLpMQLQO9zmV2IBBINJZQZgDAAVRAj0FBlhrRZwV1GwDQGhUhJnFQg+Xdn371nyzIQEvJfYeZMa50DEDPGBTOfmTn7Wuw0xdbaIzMXEyXCzRwAxO2NqF0YY0op5YKItlLKVZIk97qurQf8CiAFcKuqag/gMxN1u40xDydJm6ZZjkje8LWDbwA8e28wUTIK7xV4SLzgg4IBCfnCAYCGBK3TFnCP6NZSH7ivAABIKXUhop2rveBTI7TWuVLqhHkfMSTkV/MCeGNw/fvNnQwAAAAASUVORK5CYII="
	                                />
	                                <ul class="drop__container">
	                                    <li><a href="TBmyPage.do?mId=${sessionScope.mId}">마이페이지</a></li>
	                                    <li><a href="#">관심목록</a></li>
	                                    <li><a href="#">판매내역</a></li>
	                                    <li><a href="#">구매내역</a></li>
	                                    <li><a href="#">나눔내역</a></li>
	                                    <li><a href="TBLogout.do">로그아웃</a></li>
	                                    
	                                </ul>
	                            </li>
	                            <li class="nav-list-content">
	                                <a href="#">지도로 보기</a>
	                            </li>
	                        </ul>
                    	</c:when>
                    	<c:when test="${sessionScope.mId == null}">
	                        <ul class="header__fixed-bar-nav-list nav-list">
	                            <li class="nav-list-content">
	                                <a href="joinForm.do">회원가입</a>
	                            </li>
	                            <li class="nav-list-content">
	                                <a href="TBlogin.do">로그인</a>
	                            </li>
	                            <li class="nav-list-content">
	                                <a href="#">지도로 보기</a>
	                            </li>
	                        </ul>                    		
                    	</c:when>
                    	<c:when test="${tbm.mLevel == 3}">
                              <ul class="header__fixed-bar-nav-list nav-list">
                                 <li class="nav-list-content drop">
                                <span class="nav-list-text">
                                    Welcome ~!
                                    <span class="name">관리자</span>님 </span
                                ><img
                                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABmJLR0QA/wD/AP+gvaeTAAAA1ElEQVRIie2TsQ3CMBBF/zkLpMQLQO9zmV2IBBINJZQZgDAAVRAj0FBlhrRZwV1GwDQGhUhJnFQg+Xdn371nyzIQEvJfYeZMa50DEDPGBTOfmTn7Wuw0xdbaIzMXEyXCzRwAxO2NqF0YY0op5YKItlLKVZIk97qurQf8CiAFcKuqag/gMxN1u40xDydJm6ZZjkje8LWDbwA8e28wUTIK7xV4SLzgg4IBCfnCAYCGBK3TFnCP6NZSH7ivAABIKXUhop2rveBTI7TWuVLqhHkfMSTkV/MCeGNw/fvNnQwAAAAASUVORK5CYII="
                                />
                                <ul class="drop__container">
                                    <li><a href="../admin/adminManageList.html">회원관리</a></li>
                                    <li><a href="#">로그아웃</a></li>
                                </ul>
                            </li>
                            <li class="nav-list-content">
                                <a href="#">지도로 보기</a>
                            </li> 
                        </ul>                  		
                    	
                    	</c:when>
                    </c:choose>
                    </nav>
                </section>
            </div>
        </header>
</body>
</html>