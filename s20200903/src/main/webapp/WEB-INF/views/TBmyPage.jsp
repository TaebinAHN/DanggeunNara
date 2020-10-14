<%@page import="oracle.java.s20200903.model.TBMember"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includeJSP.jsp" %>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>회원 정보 수정 :: 당근나라</title>
        <link rel="stylesheet" href="../css/common.css" />
        <script src="../javascript/common.js" defer></script>
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
    
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/httpRequest.js"></script>
	<script type="text/javascript">
	/*이메일 중복확인 AJAX... */
    var contextPath='${pageContext.request.contextPath}';
    var src='${pageContext.request.contextPath}/images/';
    var contextPath='${pageContext.request.contextPath}';
	
	/* TBController */
	function checkNick(){
		var mNick = $('#name__write').val();
		console.log(mNick);
		$.ajax({
			url:"<%=context%>/checkNick.do",
			data:{'mNick' : mNick},
			error:function(error) {
				console.log(mNick);
			}
			,success:function(data, textStatus){
				if(data != ""){
					$("#msg1").text("사용중인 닉네임입니다.")
					$("#msg1").css("color", "#b3130b")

				}else{
					$("#msg1").text("사용가능한 닉네임 입니다.")
					$("#msg1").css("color", "#0f851a")
				}
			}
		});
	}
  </script>
    <body>
        <!-- 섹션 시작 -->
        <!-- 각 input의 value값을 DB에서 가져올 값으로 수정해주세요 -->
        <section class="section">
        	<form action="userInfoUpdate.do">
            <div class="mypage">
                <div class="mypage__head">
                    <h1 class="mypage__title">회원정보 수정</h1>
                    <p class="mypage__sub">
                        <span class="mypage__sub--color-pink">*</span>
                        필수입력사항
                    </p>
                </div>
                <div class="mypage--form">
                    <table class="mypage--form__table">
                        <tr>
                            <th>
                                이메일
                            </th>
                            <td>
                                <input
                                    id="email__write"
                                    name="mId"
                                    class="mypage--form__input"
                                    type="text"
                                    maxlength="16"
                                    value="${sessionScope.mId}"
                                    readonly
                                />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                닉네임<span class="mypage--form__sub--color-pink"
                                    >*</span
                                >
                            </th>
                            <td>
                                <input
                                    id="name__write"
                                    name="mNick"
                                    class="mypage--form__input"
                                    type="text"
                                    placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합"
                                    value="${tbm.mNick}"
                                    maxlength="16"
                                    required="required"
                                    onkeyup="checkNick()"
                                />
<!--                                 <input
                                    class="mypage--form__btn"
                                    type="button"
                                    value="중복확인"
                                /> -->
                                <div class="check__message name__message"></div>
                                <div
                                    class="check__message name__message1"
                                ></div>
                                <div
                                    class="check__message name__message2"
                                ></div>
                            </td>
                        </tr>
                        <tr>
        					<td>
        						<span id="msg1"></span>
							</td>
						</tr>					
                        <tr>
                            <th>
                                현재 비밀번호<span class="mypage--form__sub--color-pink"
                                    >*</span
                                >
                            </th>
                            <td>
                                <input
                                    class="mypage--form__input"
                                    type="password"
                                    placeholder="기존의 비밀번호를 입력해주세요"
                                    maxlength="16"
                                    required="required"
                                />
                            </td>
                        </tr>

                        <tr>
                            <th>
                                새 비밀번호<span class="mypage--form__sub--color-pink"></span>
                            </th>
                            <td>
                                <input
                                    id="pw__write"
                                    name="mPw"
                                    class="mypage--form__input pw__write"
                                    type="password"
                                    placeholder="새 비밀번호를 입력해주세요"
                                    maxlength="16"
                                />
                                <div
                                    class="check__message write__message"
                                ></div>
                                <div
                                    class="check__message write__message1"
                                ></div>
                                <div
                                    class="check__message write__message2"
                                ></div>
                            </td>
                        </tr>
                        <tr class="pw-check">
                            <th>
                                새 비밀번호확인<span
                                    class="mypage--form__sub--color-pink"
                                    >
                            </th>
                            <td>
                                <input
                                    id="pw__check"
                                    class="mypage--form__input"
                                    type="password"
                                    placeholder="새 비밀번호를 한번 더 입력해주세요"
                                    maxlength="16"
                                />
                                <div class="check__message pw__confirm"></div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                이름
                            </th>
                            <td>
                                <input
                                	id="mName"
                                    class="mypage--form__input"
                                    name="mName"
                                    type="text"
                                    placeholder="이름을 입력해주세요"
                                    maxlength="16"
                                    value="${tbm.mName}"
                                    readonly
                                />
                            </td>
                        </tr>
                        <tr class="address">
                            <th>
                                주소<span class="mypage--form__sub--color-pink">*</span>
                            </th>
                            <td>
                                <input
                                    id="address"
                                    class="mypage--form__input"
                                    type="text"
                                    name="mAddr"
                                    placeholder="주소를 검색해 주세요"
                                    value="${tbm.mAddr}"
                                    maxlength="16"
                                    required="required"
                                />
                                <a class="address--search" href="#none"
                                    ><span id="mypage--form__btn--address">
                                        <img
                                            src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHg9IjBweCIgeT0iMHB4Igp3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIKdmlld0JveD0iMCAwIDE3MiAxNzIiCnN0eWxlPSIgZmlsbDojMDAwMDAwOyI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJub256ZXJvIiBzdHJva2U9Im5vbmUiIHN0cm9rZS13aWR0aD0iMSIgc3Ryb2tlLWxpbmVjYXA9ImJ1dHQiIHN0cm9rZS1saW5lam9pbj0ibWl0ZXIiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgc3Ryb2tlLWRhc2hhcnJheT0iIiBzdHJva2UtZGFzaG9mZnNldD0iMCIgZm9udC1mYW1pbHk9Im5vbmUiIGZvbnQtd2VpZ2h0PSJub25lIiBmb250LXNpemU9Im5vbmUiIHRleHQtYW5jaG9yPSJub25lIiBzdHlsZT0ibWl4LWJsZW5kLW1vZGU6IG5vcm1hbCI+PHBhdGggZD0iTTAsMTcydi0xNzJoMTcydjE3MnoiIGZpbGw9Im5vbmUiPjwvcGF0aD48ZyBmaWxsPSIjZmZiOThiIj48cGF0aCBkPSJNNzMuNDU4MzMsMjEuNWMtMjguNjMyMTQsMCAtNTEuOTU4MzMsMjMuMzI2MjEgLTUxLjk1ODMzLDUxLjk1ODMzYzAsMjguNjMyMTIgMjMuMzI2MTksNTEuOTU4MzMgNTEuOTU4MzMsNTEuOTU4MzNjMTIuMzg1MjksMCAyMy43NzA3OSwtNC4zNzUwOSAzMi43MTE5MSwtMTEuNjQ1ODNsMzUuMTU0NDYsMzUuMTU0NDZjMS4zNDgxNSwxLjQwNDEyIDMuMzUwMDUsMS45Njk3MSA1LjIzMzY0LDEuNDc4NjZjMS44ODM1OSwtMC40OTEwNSAzLjM1NDU2LC0xLjk2MjAyIDMuODQ1NjEsLTMuODQ1NjFjMC40OTEwNSwtMS44ODM1OSAtMC4wNzQ1NSwtMy44ODU0OSAtMS40Nzg2NiwtNS4yMzM2NGwtMzUuMTU0NDYsLTM1LjE1NDQ2YzcuMjcwNzQsLTguOTQxMTIgMTEuNjQ1ODMsLTIwLjMyNjYzIDExLjY0NTgzLC0zMi43MTE5MWMwLC0yOC42MzIxMiAtMjMuMzI2MTksLTUxLjk1ODMzIC01MS45NTgzMywtNTEuOTU4MzN6TTczLjQ1ODMzLDMyLjI1YzIyLjgyMjQyLDAgNDEuMjA4MzMsMTguMzg1OTMgNDEuMjA4MzMsNDEuMjA4MzNjMCwxMS4xMTc2OSAtNC4zODUyOSwyMS4xNjIxNSAtMTEuNDk4ODYsMjguNTYxNjljLTAuNDM4NDksMC4zMjIyOSAtMC44MjU1LDAuNzA5MyAtMS4xNDc3OSwxLjE0Nzc5Yy03LjM5OTUzLDcuMTEzNTcgLTE3LjQ0Mzk5LDExLjQ5ODg2IC0yOC41NjE2OSwxMS40OTg4NmMtMjIuODIyNDIsMCAtNDEuMjA4MzMsLTE4LjM4NTkzIC00MS4yMDgzMywtNDEuMjA4MzNjMCwtMjIuODIyNCAxOC4zODU5MSwtNDEuMjA4MzMgNDEuMjA4MzMsLTQxLjIwODMzeiI+PC9wYXRoPjwvZz48L2c+PC9zdmc+"
                                            alt="주소검색"
                                        />
                                        주소검색
                                    </span></a
                                >
                                <input
                                    id="sample6_detailAddress"
                                    class="mypage--form__input"
                                    name="mAddr2"
                                    type="text"
                                    placeholder="상세주소를 입력해 주세요"
                                    value="${tbm.mAddr2}"
                                    maxlength="16"
                                />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                휴대폰<span class="mypage--form__sub--color-pink"
                                    >*</span
                                >
                            </th>
                            <td>
                                <input
                                    class="mypage--form__input"
                                    type="text"
                                    name="mTel"
                                    placeholder="숫자만 입력해주세요"
                                    value="${tbm.mTel}"
                                    maxlength="16"
                                />
                            </td>
                        </tr>
                        <tr class="mypage--form__agree">
                            <th>
                                이용약관동의<span class="mypage--form__sub--color-pink"
                                    >*</span
                                >
                            </th>
                            <td>
                                <ul>
                                    <li>
                                        <label for="location"
                                            ><input
                                                id="location"
                                                class="agree--select"
                                                type="checkbox"
                                            />
                                            <div id="location--ico" class="ico">
                                                <i class="fas fa-check"></i>
                                            </div>
                                            위치정보 이용약관 동의<span
                                                class="agree-sub"
                                                >(선택)</span
                                            >
                                        </label>
                                        <a
                                            class="detail location"
                                            href="#none"
                                        >
                                            <p>약관보기</p>
                                            <img
                                                src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAABmJLR0QA/wD/AP+gvaeTAAABSUlEQVRoge3Zy01CURCA4X+AGoRYAZEmUBOpwCp0q9YgbFhYhXsSJSCxCOOjAGNswSvjQrcmPuahyfwFnJNvcXLnnAtVVVVV9UfS+fhAZ+Next4tq4X0YnKIyhkdWWVgzCAI5yA3QJ+2XOv8dNNs7S9tb5heTjZArkAHKA+01tuyd/JoucdnmUIgD2MOgRyMCwTiMW4QiMW4QiAO4w6BGEwIBPwxYRDwxYRCwA8TDgEfTAoE7DFpELDFpEIAdDbu0ZEV0AdugaGMjp6/u47dGJ9cO3NzXUy7iC6BLeAeWe/K6PjpJ2vlHfbFtMtrswQd8I7Y+XeH3RoBGR9EBwREjyhOCIgcGh0REDXGOyMg4mIVgADvq24QAjwfHwIR4PUcFIwAjwe6BARYP5kmIcAQkokAyzG+edn/QNzR6DASYV7mj56qqqqq+k1vUFMjm2m669IAAAAASUVORK5CYII="
                                            />
                                        </a>
                                        <div
                                            class="window--blocker location--blocker"
                                        >
                                            <div
                                                class="agreement--detail location"
                                            >
                                                <h1 class="detail--title">
                                                    위치정보 이용약관
                                                    <span class="detail--sub"
                                                        >(선택)</span
                                                    >
                                                </h1>
                                                <div class="detail--article">
                                                    <section
                                                        class="article-section"
                                                    >
                                                        <h3>제1조 (목적)</h3>

                                                        <p>
                                                            본 약관은 회원(본
                                                            약관에 동의한 자를
                                                            말합니다. 이하
                                                            “회원”이라고
                                                            합니다)이 주식회사
                                                            당근나라(이하
                                                            “회사”라고 합니다)가
                                                            제공하는
                                                            위치기반서비스(이하
                                                            “서비스”라고
                                                            합니다)를 이용함에
                                                            있어 회사와 회원의
                                                            권리・의무 및
                                                            책임사항을 규정함을
                                                            목적으로 합니다.
                                                        </p>

                                                        <h3>
                                                            제2조 (약관의 효력
                                                            및 변경)
                                                        </h3>

                                                        <ol>
                                                            <li>
                                                                본 약관은
                                                                서비스를 신청한
                                                                고객 또는
                                                                개인위치정보주체가
                                                                본 약관에
                                                                동의하고 회사가
                                                                정한 소정의
                                                                절차에 따라
                                                                서비스의
                                                                이용자로
                                                                등록함으로써
                                                                효력이
                                                                발생합니다.
                                                            </li>
                                                            <li>
                                                                회사는 본 약관의
                                                                내용을 회원이
                                                                쉽게 알 수
                                                                있도록 서비스
                                                                초기 화면에
                                                                게시하거나
                                                                기타의 방법으로
                                                                공지합니다.
                                                            </li>
                                                            <li>
                                                                회사는
                                                                필요하다고
                                                                인정되면 본
                                                                약관을 변경할 수
                                                                있으며, 회사가
                                                                약관을 개정할
                                                                경우에는
                                                                기존약관과
                                                                개정약관 및
                                                                개정약관의
                                                                적용일자와
                                                                개정사유를
                                                                명시하여
                                                                현행약관과 함께
                                                                그 적용일자 7일
                                                                전부터 적용일
                                                                이후 상당한 기간
                                                                동안 공지합니다.
                                                                다만, 개정
                                                                내용이 회원에게
                                                                불리한 경우에는
                                                                그 적용일자 30일
                                                                전부터 적용일
                                                                이후 상당한 기간
                                                                동안 각각 이를
                                                                서비스
                                                                홈페이지에
                                                                게시하여
                                                                고지합니다.
                                                            </li>
                                                            <li>
                                                                회사가 전항에
                                                                따라 회원에게
                                                                공지하거나
                                                                통지하면서 공지
                                                                또는
                                                                통지ㆍ고지일로부터
                                                                개정약관 시행일
                                                                7일 후까지
                                                                거부의사를
                                                                표시하지
                                                                아니하면 승인한
                                                                것으로 본다는
                                                                뜻을 명확하게
                                                                고지하였음에도
                                                                불구하고 거부의
                                                                의사표시가 없는
                                                                경우에는 변경된
                                                                약관에 승인한
                                                                것으로 봅니다.
                                                                회원이
                                                                개정약관에
                                                                동의하지 않을
                                                                경우 회원은
                                                                이용계약을
                                                                해지할 수
                                                                있습니다.
                                                            </li>
                                                        </ol>

                                                        <h3>
                                                            제3조 (약관 외 준칙)
                                                        </h3>

                                                        <p>
                                                            본 약관에 규정되지
                                                            않은 사항에 대해서는
                                                            위치정보의 보호 및
                                                            이용 등에 관한
                                                            법률(이하
                                                            “위치정보법”이라고
                                                            합니다),
                                                            전기통신사업법,
                                                            정보통신망 이용촉진
                                                            및 보호 등에 관한
                                                            법률(이하
                                                            “정보통신망법”이라고
                                                            합니다),
                                                            개인정보보호법 등
                                                            관련법령 또는 회사가
                                                            정한 서비스의
                                                            운영정책 및 규칙
                                                            등(이하
                                                            “세부지침”이라고
                                                            합니다)의 규정에
                                                            따릅니다.
                                                        </p>

                                                        <h3>
                                                            제4조 (서비스의
                                                            가입)
                                                        </h3>

                                                        <ol>
                                                            <li>
                                                                본회사는 아래와
                                                                같은 경우에는
                                                                여러분의
                                                                당근나라 계정
                                                                생성을 유보할 수
                                                                있습니다.

                                                                <ul>
                                                                    <li>
                                                                        실명이
                                                                        아니거나
                                                                        다른
                                                                        사람의
                                                                        명의를
                                                                        사용하는
                                                                        등
                                                                        허위로
                                                                        신청하는
                                                                        경우
                                                                    </li>
                                                                    <li>
                                                                        회원
                                                                        등록
                                                                        사항을
                                                                        빠뜨리거나
                                                                        잘못
                                                                        기재하여
                                                                        신청하는
                                                                        경우
                                                                    </li>
                                                                    <li>
                                                                        기타
                                                                        회사가
                                                                        정한
                                                                        이용신청
                                                                        요건을
                                                                        충족하지
                                                                        않았을
                                                                        경우
                                                                    </li>
                                                                </ul>
                                                            </li>
                                                        </ol>

                                                        <h3>
                                                            제5조 (서비스의
                                                            해지)
                                                        </h3>

                                                        <p>
                                                            회원이 서비스 이용을
                                                            해지하고자 할 경우
                                                            회원은 회사가 정한
                                                            절차(서비스 홈페이지
                                                            등을 통해
                                                            공지합니다)를 통해
                                                            서비스 해지를 신청할
                                                            수 있으며, 회사는
                                                            법령이 정하는 바에
                                                            따라 신속히
                                                            처리합니다.
                                                        </p>

                                                        <h3>
                                                            제6조 (서비스의
                                                            내용)
                                                        </h3>

                                                        <ol>
                                                            <li>
                                                                서비스의 이용은
                                                                연중무휴 1일
                                                                24시간을
                                                                원칙으로 합니다.
                                                                단, 회사의 업무
                                                                또는 기술상의
                                                                이유로 서비스가
                                                                일시 중지될 수
                                                                있으며, 운영상의
                                                                목적으로 회사가
                                                                정한 기간에도
                                                                서비스는 일시
                                                                중지될 수
                                                                있습니다. 이때
                                                                회사는 사전 또는
                                                                사후에 이를
                                                                공지합니다.
                                                            </li>
                                                            <li>
                                                                회사가 제공하는
                                                                서비스의 종류,
                                                                세부 내용, 이용
                                                                요금은 아래와
                                                                같습니다.

                                                                <ol>
                                                                    <li>
                                                                        종류 :
                                                                        동네
                                                                        커뮤니티
                                                                        서비스
                                                                    </li>
                                                                    <li>
                                                                        서비스명
                                                                        :
                                                                        당근나라
                                                                    </li>
                                                                    <li>
                                                                        설명 :
                                                                        내동네를
                                                                        인증하고
                                                                        주변
                                                                        이웃과
                                                                        중고물품을
                                                                        거래하거나
                                                                        동네
                                                                        정보를
                                                                        공유하는
                                                                        서비스
                                                                    </li>
                                                                    <li>
                                                                        위치정보
                                                                        이용
                                                                        목적:
                                                                        내동네
                                                                        인증
                                                                    </li>
                                                                    <li>
                                                                        이용
                                                                        요금 :
                                                                        무료
                                                                    </li>
                                                                </ol>
                                                            </li>
                                                        </ol>

                                                        <h3>
                                                            제7조 (서비스
                                                            이용요금)
                                                        </h3>

                                                        <ol>
                                                            <li>
                                                                회사가 제공하는
                                                                서비스는
                                                                기본적으로 유료
                                                                또는 무료입니다.
                                                                단, 별도의
                                                                유료서비스의
                                                                경우 해당
                                                                서비스에 명시된
                                                                요금을
                                                                지불하여야 사용
                                                                가능합니다.
                                                            </li>
                                                            <li>
                                                                회사는
                                                                유료서비스
                                                                이용요금을
                                                                회사와 계약한
                                                                전자지불업체에서
                                                                정한 방법에
                                                                의하거나 회사가
                                                                정한 청구서에
                                                                합산하여 청구할
                                                                수 있습니다.
                                                            </li>
                                                            <li>
                                                                유료서비스
                                                                이용을 통하여
                                                                결제된 대금에
                                                                대한 취소 및
                                                                환불은 회사의
                                                                결제 이용약관 등
                                                                관련법령에
                                                                따릅니다.
                                                            </li>
                                                            <li>
                                                                회원의
                                                                개인정보도용 및
                                                                결제사기로 인한
                                                                환불요청 또는
                                                                결제자의
                                                                개인정보 요구는
                                                                법률이 정한 경우
                                                                외에는 거절될 수
                                                                있습니다.
                                                            </li>
                                                            <li>
                                                                무선서비스 이용
                                                                시 발생하는
                                                                데이터 통신료는
                                                                별도이며, 회원이
                                                                가입한 각
                                                                이동통신사의
                                                                정책에 따릅니다.
                                                            </li>
                                                            <li>
                                                                MMS 등으로
                                                                게시물을 등록할
                                                                경우 발생하는
                                                                요금은 회원이
                                                                가입한 각
                                                                이동통신사의
                                                                정책에 따릅니다.
                                                            </li>
                                                        </ol>

                                                        <h3>
                                                            제8조 (서비스의
                                                            이용제한 및 중지)
                                                        </h3>

                                                        <ol>
                                                            <li>
                                                                회사는 아래 각
                                                                호의 경우에는
                                                                회원의 서비스
                                                                이용을
                                                                제한하거나
                                                                중지시킬 수
                                                                있습니다.

                                                                <ol>
                                                                    <li>
                                                                        회원이
                                                                        회사
                                                                        서비스의
                                                                        운영을
                                                                        고의
                                                                        또는
                                                                        중과실로
                                                                        방해하는
                                                                        경우
                                                                    </li>
                                                                    <li>
                                                                        서비스용
                                                                        설비
                                                                        점검,
                                                                        보수
                                                                        또는
                                                                        공사로
                                                                        인하여
                                                                        부득이한
                                                                        경우
                                                                    </li>
                                                                    <li>
                                                                        전기통신사업법에
                                                                        규정된
                                                                        기간통신사업자가
                                                                        전기통신
                                                                        서비스를
                                                                        중지했을
                                                                        경우
                                                                    </li>
                                                                    <li>
                                                                        국가비상사태,
                                                                        서비스
                                                                        설비의
                                                                        장애
                                                                        또는
                                                                        서비스
                                                                        이용의
                                                                        폭주
                                                                        등으로
                                                                        서비스
                                                                        이용에
                                                                        지장이
                                                                        있는 때
                                                                    </li>
                                                                    <li>
                                                                        기타
                                                                        중대한
                                                                        사유로
                                                                        인하여
                                                                        회사가
                                                                        서비스
                                                                        제공을
                                                                        지속하는
                                                                        것이
                                                                        부적당하다고
                                                                        인정하는
                                                                        경우
                                                                    </li>
                                                                </ol>
                                                            </li>
                                                            <li>
                                                                회사는 전항의
                                                                규정에 의하여
                                                                서비스의 이용을
                                                                제한하거나
                                                                중지한 때에는 그
                                                                사유 및 제한기간
                                                                등을 회원에게
                                                                알려야 합니다.
                                                            </li>
                                                        </ol>

                                                        <h3>
                                                            제9조
                                                            (서비스내용변경 통지
                                                            등)
                                                        </h3>

                                                        <ol>
                                                            <li>
                                                                회사가 서비스
                                                                내용을
                                                                변경하거나
                                                                종료하는 경우
                                                                회사는 회원의
                                                                등록된 휴대폰
                                                                번호 문자
                                                                방식으로 서비스
                                                                내용의 변경 사항
                                                                또는 종료를
                                                                통지할 수
                                                                있습니다.
                                                            </li>
                                                            <li>
                                                                전항의 경우
                                                                불특정 다수인을
                                                                상대로 통지를
                                                                함에 있어서는
                                                                서비스 홈페이지
                                                                등 기타 회사의
                                                                공지사항
                                                                페이지를 통하여
                                                                회원들에게
                                                                통지할 수
                                                                있습니다. 단,
                                                                회원 본인의
                                                                거래와 관련하여
                                                                중대한 영향을
                                                                미치는 사항은
                                                                상당한 기간 동안
                                                                서비스
                                                                홈페이지에
                                                                게시하거나
                                                                회원에게 전자적
                                                                형태(전자우편,
                                                                SMS 등)로
                                                                개별통지 합니다.
                                                            </li>
                                                        </ol>

                                                        <h3>
                                                            제10조
                                                            (개인위치정보의 이용
                                                            또는 제공)
                                                        </h3>

                                                        <ol>
                                                            <li>
                                                                회사는
                                                                개인위치정보를
                                                                이용하여
                                                                서비스를
                                                                제공하고자 하는
                                                                경우에는 미리
                                                                약관에 명시한 후
                                                                개인위치정보주체의
                                                                동의를 얻어야
                                                                합니다.
                                                            </li>
                                                            <li>
                                                                회원 및
                                                                법정대리인의
                                                                권리와 그
                                                                행사방법은 제소
                                                                당시의 이용자의
                                                                주소에 의하며,
                                                                주소가 없는
                                                                경우에는 거소를
                                                                관할하는
                                                                지방법원의
                                                                전속관할로
                                                                합니다. 다만,
                                                                제소 당시
                                                                이용자의 주소
                                                                또는 거소가
                                                                분명하지 않거나
                                                                외국 거주자의
                                                                경우에는
                                                                민사소송법상의
                                                                관할법원에
                                                                제기합니다.
                                                            </li>
                                                            <li>
                                                                회사는 타사업자
                                                                또는 이용
                                                                고객과의
                                                                요금정산 및
                                                                민원처리를 위해
                                                                위치정보
                                                                이용·제공, 사실
                                                                확인자료를 자동
                                                                기록·보존하며,
                                                                해당 자료는
                                                                6개월간
                                                                보관합니다.
                                                            </li>
                                                            <li>
                                                                회사는
                                                                개인위치정보주체의
                                                                동의 없이
                                                                개인위치정보를
                                                                제3자에게
                                                                제공하지
                                                                아니하며, 제3자
                                                                제공 서비스를
                                                                제공하는
                                                                경우에는 제공
                                                                받는자 및
                                                                제공목적을
                                                                사전에
                                                                개인위치정보주체에게
                                                                고지하고 동의를
                                                                받습니다. 다만,
                                                                다음의 경우는
                                                                예외로 하고
                                                                있습니다.

                                                                <ol>
                                                                    <li>
                                                                        법령의
                                                                        규정에
                                                                        의거하거나
                                                                        수사
                                                                        목적으로
                                                                        법령에
                                                                        정해진
                                                                        절차와
                                                                        방법에
                                                                        따라
                                                                        수사기관의
                                                                        요구가
                                                                        있는
                                                                        경우
                                                                    </li>
                                                                </ol>
                                                            </li>
                                                            <li>
                                                                회사는
                                                                개인위치정보를
                                                                회원이 지정하는
                                                                제3자에게
                                                                제공하는
                                                                경우에는
                                                                개인위치정보를
                                                                수집한 당해 통신
                                                                단말장치로 매회
                                                                회원에게
                                                                제공받는 자,
                                                                제공 일시 및
                                                                제공목적을 즉시
                                                                통보합니다. 단,
                                                                아래 각 호의 1에
                                                                해당하는
                                                                경우에는 회원이
                                                                미리 특정하여
                                                                지정한 통신
                                                                단말장치 또는
                                                                전자우편주소로
                                                                통보합니다.

                                                                <ol>
                                                                    <li>
                                                                        개인위치정보를
                                                                        수집한
                                                                        당해
                                                                        통신단말장치가
                                                                        문자,
                                                                        음성
                                                                        또는
                                                                        영상의
                                                                        수신기능을
                                                                        갖추지
                                                                        아니한
                                                                        경우
                                                                    </li>
                                                                    <li>
                                                                        회원이
                                                                        온라인
                                                                        게시
                                                                        등의
                                                                        방법으로
                                                                        통보할
                                                                        것을
                                                                        미리
                                                                        요청한
                                                                        경우
                                                                    </li>
                                                                </ol>
                                                            </li>
                                                        </ol>

                                                        <h3>
                                                            제11조
                                                            (개인위치정보주체의
                                                            권리)
                                                        </h3>

                                                        <ol>
                                                            <li>
                                                                회원은 회사에
                                                                대하여 언제든지
                                                                개인위치정보를
                                                                이용한
                                                                위치기반서비스
                                                                제공 및
                                                                개인위치정보의
                                                                제3자 제공에
                                                                대한 동의의 전부
                                                                또는 일부를
                                                                철회할 수
                                                                있습니다. 이
                                                                경우 회사는
                                                                수집한
                                                                개인위치정보 및
                                                                위치정보 이용,
                                                                제공사실
                                                                확인자료를
                                                                파기합니다.
                                                            </li>
                                                            <li>
                                                                회원은 회사에
                                                                대하여 언제든지
                                                                개인위치정보의
                                                                수집, 이용 또는
                                                                제공의 일시적인
                                                                중지를 요구할 수
                                                                있으며, 회사는
                                                                이를 거절할 수
                                                                없고 이를 위한
                                                                기술적 수단을
                                                                갖추고 있습니다.
                                                            </li>
                                                            <li>
                                                                회원은 회사에
                                                                대하여 아래 각
                                                                호의 자료에 대한
                                                                열람 또는 고지를
                                                                요구할 수 있고,
                                                                당해 자료에
                                                                오류가 있는
                                                                경우에는 그
                                                                정정을 요구할 수
                                                                있습니다. 이
                                                                경우 회사는
                                                                정당한 사유 없이
                                                                회원의 요구를
                                                                거절할 수
                                                                없습니다.

                                                                <ol>
                                                                    <li>
                                                                        본인에
                                                                        대한
                                                                        위치정보
                                                                        수집,
                                                                        이용,
                                                                        제공사실
                                                                        확인자료
                                                                    </li>
                                                                    <li>
                                                                        본인의
                                                                        개인위치정보가
                                                                        위치정보의
                                                                        보호 및
                                                                        이용
                                                                        등에
                                                                        관한
                                                                        법률
                                                                        또는
                                                                        다른
                                                                        법률
                                                                        규정에
                                                                        의하여
                                                                        제3자에게
                                                                        제공된
                                                                        이유 및
                                                                        내용
                                                                    </li>
                                                                </ol>
                                                            </li>
                                                            <li>
                                                                회원은 제1항
                                                                내지 제3항의
                                                                권리행사를 위해
                                                                회사의 소정의
                                                                절차를 통해
                                                                요구할 수
                                                                있습니다.
                                                            </li>
                                                        </ol>

                                                        <h3>
                                                            제12조 (법정대리인의
                                                            권리)
                                                        </h3>

                                                        <ol>
                                                            <li>
                                                                회사는 14세
                                                                미만의 회원에
                                                                대해서는
                                                                개인위치정보를
                                                                이용한
                                                                위치기반서비스
                                                                제공 및
                                                                개인위치정보의
                                                                제3자 제공에
                                                                대한 동의를 당해
                                                                회원과 당해
                                                                회원의
                                                                법정대리인으로부터
                                                                동의를 받아야
                                                                합니다. 이 경우
                                                                법정대리인은
                                                                제11조에 의한
                                                                회원의 권리를
                                                                모두 가집니다.
                                                            </li>
                                                            <li>
                                                                회사는 14세
                                                                미만의 아동의
                                                                개인위치정보
                                                                또는 위치정보
                                                                이용, 제공사실
                                                                확인자료를
                                                                이용약관에 명시
                                                                또는 고지한
                                                                범위를 넘어
                                                                이용하거나
                                                                제3자에게
                                                                제공하고자 하는
                                                                경우에는 14세
                                                                미만의 아동과 그
                                                                법정대리인의
                                                                동의를 받아야
                                                                합니다. 단,
                                                                아래의 경우는
                                                                제외합니다.

                                                                <ol>
                                                                    <li>
                                                                        위치정보
                                                                        및
                                                                        위치기반서비스
                                                                        제공에
                                                                        따른
                                                                        요금정산을
                                                                        위하여
                                                                        위치정보
                                                                        이용,
                                                                        제공사실
                                                                        확인자료가
                                                                        필요한
                                                                        경우
                                                                    </li>
                                                                    <li>
                                                                        통계작성,
                                                                        학술연구
                                                                        또는
                                                                        시장조사를
                                                                        위하여
                                                                        특정
                                                                        개인을
                                                                        알아볼
                                                                        수 없는
                                                                        형태로
                                                                        가공하여
                                                                        제공하는
                                                                        경우
                                                                    </li>
                                                                </ol>
                                                            </li>
                                                        </ol>

                                                        <h3>
                                                            제13조 (8세 이하의
                                                            아동 등의
                                                            보호의무자의 권리)
                                                        </h3>

                                                        <ol>
                                                            <li>
                                                                회사는 14세
                                                                미만의 아동의
                                                                개인위치정보
                                                                또는 위치정보
                                                                이용, 제공사실
                                                                확인자료를
                                                                이용약관에 명시
                                                                또는 고지한
                                                                범위를 넘어
                                                                이용하거나
                                                                제3자에게
                                                                제공하고자 하는
                                                                경우에는 14세
                                                                미만의 아동과 그
                                                                법정대리인의
                                                                동의를 받아야
                                                                합니다. 단,
                                                                아래의 경우는
                                                                제외합니다.

                                                                <ul>
                                                                    <li>
                                                                        8세
                                                                        이하의
                                                                        아동
                                                                    </li>
                                                                    <li>
                                                                        피성년후견인
                                                                    </li>
                                                                    <li>
                                                                        장애인복지법
                                                                        제2조
                                                                        제2항
                                                                        제2호의
                                                                        규정에
                                                                        따른
                                                                        정신적
                                                                        장애를
                                                                        가진
                                                                        자로서
                                                                        장애인
                                                                        고용촉진
                                                                        및
                                                                        직업재활법
                                                                        제2조
                                                                        제2호의
                                                                        규정에
                                                                        따라
                                                                        중증장애인에
                                                                        해당하는
                                                                        자(장애인복지법
                                                                        제32조의
                                                                        규정에
                                                                        따라
                                                                        장애인등록을
                                                                        한 자에
                                                                        한합니다)
                                                                    </li>
                                                                </ul>
                                                            </li>
                                                            <li>
                                                                전항의 규정에
                                                                따른 8세 이하
                                                                아동 등의
                                                                보호의무자는
                                                                해당 아동을
                                                                사실상 보호하는
                                                                자로서 다음 각
                                                                호에 해당하는
                                                                자를 말합니다.

                                                                <ul>
                                                                    <li>
                                                                        8세
                                                                        이하의
                                                                        아동의
                                                                        법정대리인
                                                                        또는
                                                                        보호시설에
                                                                        있는
                                                                        미성년자의
                                                                        후견
                                                                        직무에
                                                                        관한
                                                                        법률
                                                                        제3조의
                                                                        규정에
                                                                        따른
                                                                        후견인
                                                                    </li>
                                                                    <li>
                                                                        피성년후견인의
                                                                        법정대리인
                                                                    </li>
                                                                    <li>
                                                                        본 조
                                                                        제1항
                                                                        제3호의
                                                                        자의
                                                                        법정대리인
                                                                        또는
                                                                        장애인복지법
                                                                        제58조
                                                                        제1항
                                                                        제1호의
                                                                        규정에
                                                                        따른
                                                                        장애인생활시설(국가
                                                                        또는
                                                                        지방자치단체가
                                                                        설치·운영하는
                                                                        시설에
                                                                        한합니다)의
                                                                        장,
                                                                        정신보건법
                                                                        제3조
                                                                        제4호의
                                                                        규정에
                                                                        따른
                                                                        정신질환자
                                                                        사회복귀시설(국가
                                                                        또는
                                                                        지방자치단체가
                                                                        설치·운영하는
                                                                        시설에
                                                                        한합니다)의
                                                                        장, 동법
                                                                        동조
                                                                        제5호의
                                                                        규정에
                                                                        따른
                                                                        정신요양시설의
                                                                        장
                                                                    </li>
                                                                </ul>
                                                            </li>
                                                            <li>
                                                                8세 이하의 아동
                                                                등의 생명 또는
                                                                신체의 보호를
                                                                위하여
                                                                개인위치정보의
                                                                이용 또는 제공에
                                                                동의를 하고자
                                                                하는
                                                                보호의무자는
                                                                서면동의서에
                                                                보호의무자임을
                                                                증명하는 서면을
                                                                첨부하여 회사에
                                                                제출하여야
                                                                합니다.
                                                            </li>
                                                            <li>
                                                                보호의무자는 8세
                                                                이하의 아동 등의
                                                                개인위치정보
                                                                이용 또는 제공에
                                                                동의하는 경우
                                                                개인위치정보주체
                                                                권리의 전부를
                                                                행사할 수
                                                                있습니다.
                                                            </li>
                                                        </ol>

                                                        <h3>
                                                            제14조 (회사의 주소
                                                            및 연락처 등)
                                                        </h3>

                                                        <ol>
                                                            <li>
                                                                <p>
                                                                    회사의 상호,
                                                                    주소 및
                                                                    연락처는
                                                                    아래와
                                                                    같습니다.
                                                                </p>

                                                                <ul>
                                                                    <li>
                                                                        상호 :
                                                                        주식회사
                                                                        당근나라
                                                                    </li>
                                                                    <li>
                                                                        대표 :
                                                                        김재현,
                                                                        김용현
                                                                    </li>
                                                                    <li>
                                                                        주소 :
                                                                        서울특별시
                                                                        구로구
                                                                        디지털로
                                                                        30길 28
                                                                        609호
                                                                    </li>
                                                                    <li>
                                                                        대표전화
                                                                        :
                                                                        1644-9736
                                                                    </li>
                                                                </ul>
                                                            </li>
                                                            <li>
                                                                <p>
                                                                    회사는
                                                                    개인위치정보를
                                                                    적절히
                                                                    관리·보호하고,
                                                                    개인위치정보주체의
                                                                    불만을
                                                                    원활히
                                                                    처리할 수
                                                                    있도록
                                                                    실질적인
                                                                    책임을 질 수
                                                                    있는 지위에
                                                                    있는 자를
                                                                    위치정보관리책임자로
                                                                    지정해
                                                                    운영하고
                                                                    있으며,
                                                                    위치정보관리책임자의
                                                                    성명과
                                                                    연락처는
                                                                    아래와
                                                                    같습니다.
                                                                </p>

                                                                <ul>
                                                                    <li>
                                                                        성명 :
                                                                        정창훈
                                                                    </li>
                                                                    <li>
                                                                        대표전화
                                                                        :
                                                                        1644-9736
                                                                    </li>
                                                                    <li>
                                                                        이메일주소
                                                                        :
                                                                        contact@daangn.com
                                                                    </li>
                                                                </ul>
                                                            </li>
                                                        </ol>

                                                        <h3>
                                                            제15조 (양도금지)
                                                        </h3>

                                                        <p>
                                                            회원의 서비스 받을
                                                            권리는 이를 양도
                                                            내지 증여하거나
                                                            담보제공 등의
                                                            목적으로 처분할 수
                                                            없습니다.
                                                        </p>

                                                        <h3>
                                                            제16조 (손해배상)
                                                        </h3>

                                                        <ol>
                                                            <li>
                                                                회사가
                                                                위치정보법
                                                                제15조 내지
                                                                제26조의 규정을
                                                                위반한 행위로
                                                                회원에게 손해가
                                                                발생한 경우
                                                                회원은 회사에
                                                                대하여 손해배상
                                                                청구를 할 수
                                                                있습니다. 이
                                                                경우 회사는
                                                                고의, 과실이
                                                                없음을 입증하지
                                                                못하는 경우
                                                                책임을 면할 수
                                                                없습니다.
                                                            </li>
                                                            <li>
                                                                회사가
                                                                위치정보법
                                                                제15조 내지
                                                                제26조의 규정을
                                                                위반한 행위로
                                                                회원에게 손해가
                                                                발생한 경우
                                                                회원은 회사에
                                                                대하여 손해배상
                                                                청구를 할 수
                                                                있습니다. 이
                                                                경우 회사는
                                                                고의, 과실이
                                                                없음을 입증하지
                                                                못하는 경우
                                                                책임을 면할 수
                                                                없습니다.
                                                            </li>
                                                        </ol>

                                                        <h3>제17조 (면책)</h3>

                                                        <ol>
                                                            <li>
                                                                회사는 다음 각
                                                                호의 경우로
                                                                서비스를 제공할
                                                                수 없는 경우
                                                                이로 인하여
                                                                회원에게 발생한
                                                                손해에 대해서는
                                                                책임을 부담하지
                                                                않습니다.

                                                                <ol>
                                                                    <li>
                                                                        천재지변
                                                                        또는
                                                                        이에
                                                                        준하는
                                                                        불가항력의
                                                                        상태가
                                                                        있는
                                                                        경우
                                                                    </li>
                                                                    <li>
                                                                        서비스
                                                                        제공을
                                                                        위하여
                                                                        회사와
                                                                        서비스
                                                                        제휴계약을
                                                                        체결한
                                                                        제3자의
                                                                        고의적인
                                                                        서비스
                                                                        방해가
                                                                        있는
                                                                        경우
                                                                    </li>
                                                                    <li>
                                                                        회원의
                                                                        귀책사유로
                                                                        서비스
                                                                        이용에
                                                                        장애가
                                                                        있는
                                                                        경우4)
                                                                        제1호
                                                                        내지
                                                                        제3호를
                                                                        제외한
                                                                        기타
                                                                        회사의
                                                                        고의ㆍ과실이
                                                                        없는
                                                                        사유로
                                                                        인한
                                                                        경우
                                                                    </li>
                                                                </ol>
                                                            </li>
                                                            <li>
                                                                회사는 서비스 및
                                                                서비스에 게재된
                                                                정보, 자료,
                                                                사실의 신뢰도,
                                                                정확성 등에
                                                                대해서는 보증을
                                                                하지 않으며 이로
                                                                인해 발생한
                                                                회원의 손해에
                                                                대하여는 책임을
                                                                부담하지
                                                                아니합니다.
                                                            </li>
                                                        </ol>

                                                        <h3>
                                                            제18조 (분쟁의 조정
                                                            및 기타)
                                                        </h3>

                                                        <ol>
                                                            <li>
                                                                서비스 이용과
                                                                관련하여 회사와
                                                                회원 간에 분쟁이
                                                                발생하면, 회사는
                                                                분쟁의 해결을
                                                                위해 회원과
                                                                성실히
                                                                협의합니다.
                                                            </li>
                                                            <li>
                                                                전항의 협의에서
                                                                분쟁이 해결되지
                                                                않은 경우 회사와
                                                                회원은
                                                                위치정보법
                                                                제28조에 의한
                                                                방송통신위원회에
                                                                재정을
                                                                신청하거나,
                                                                개인정보보호법
                                                                제43조에 의한
                                                                방송통신위원회
                                                                또는
                                                                개인정보분쟁조정위원회에
                                                                재정 또는
                                                                분쟁조정을
                                                                신청할 수
                                                                있습니다.
                                                            </li>
                                                            <li>
                                                                전항으로도
                                                                분쟁이 해결되지
                                                                않으면 회사와
                                                                회원 양 당사자는
                                                                민사소송법상의
                                                                관할법원에 소를
                                                                제기할 수
                                                                있습니다.
                                                            </li>
                                                        </ol>

                                                        <h3>부칙</h3>

                                                        <p>
                                                            제1조 (시행일) 본
                                                            약관은 2017년 12월
                                                            1일부터 시행합니다.
                                                        </p>
                                                    </section>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <label for="sms"
                                            ><input
                                                id="sms"
                                                name="mSms"
                                                type="checkbox"
                                                class="agree--select"
                                            />
                                            <div id="sms--ico" class="ico">
                                                <i class="fas fa-check"></i>
                                            </div>
                                            SMS 수신<span class="agree-sub"
                                                >(선택)</span
                                            > </label
                                        ><label for="email"
                                            ><input
                                                id="email"
                                                name="mMail"
                                                class="agree--select"
                                                type="checkbox"
                                            />
                                            <div id="email--ico" class="ico">
                                                <i class="fas fa-check"></i>
                                            </div>
                                            이메일 수신<span class="agree-sub"
                                                >(선택)</span
                                            >
                                        </label>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                    </table>
                    <div class="mypage__btn">
                        <input
                            class="mypage__leave"
                            type="button"
                            value="탈퇴하기"
                            onclick="location.href='TBuserLeave.do'"
                        />
                        <input
                            class="mypage__update"
                            type="submit"
                            value="회원정보수정"
                        />
                    </div>
                </div>
            </div>
        </form>
        </section>

		<%@ include file="footer.jsp" %>
    </body>
</html>
