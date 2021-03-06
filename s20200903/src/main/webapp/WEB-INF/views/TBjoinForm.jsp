<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includeJSP.jsp" %>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>

<html lang="ko"> 
    <head>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/httpRequest.js"></script>
	<script type="text/javascript">
	function joinus() {
		if('${msg}' != null) {
			alert("회원이 되신걸 환영합니다~!");
		}
	}

	/*이메일 중복확인 AJAX... */
    var contextPath='${pageContext.request.contextPath}';
    var src='${pageContext.request.contextPath}/images/';
    var contextPath='${pageContext.request.contextPath}';

	
	/* TBController */
	function checkid(){
		var mId = $('#email__write').val();
		console.log(mId);
		/* alert("mId -> " + mId); */
		$.ajax({
			url:"<%=context%>/checkid.do",
			data:{'mId' : mId},
			error:function(error) {
				console.log(mId);
			}
			,success:function(data, textStatus){
				if(data != ""){
					$("#msg").text("☓사용중인 아이디입니다.")
					$("#msg").css("color", "#b3130b") 
				}else{
					$("#msg").text("✓사용가능한 아이디 입니다.")
					$("#msg").css("color", "#0f851a")
				}
			}
		});
	}
	
	/* ktg test TBController */
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
					$("#msg1").text("☓사용중인 닉네임입니다.")
					$("#msg1").css("color", "#b3130b")

				}else{
					$("#msg1").text("✓사용가능한 닉네임 입니다.")
					$("#msg1").css("color", "#0f851a")
				}
			}
		});
	}
  </script>
</head>

    <body>
        <!-- 섹션 시작 -->
        <section class="section">
        <form action="joinMember.do" method="post" name="join" onsubmit="joinus()">
            <div class="join">
                <div class="join__head">
                    <h1 class="join__title">회원가입</h1>
                    <p class="join__sub">
                        <span class="join__sub--color-pink">*</span>
                        필수입력사항
                    </p>
                </div>
                <div class="join--form">
                    <table class="join--form__table">
                        <tr>
                            <th>
                                이메일<span class="join--form__sub--color-pink"
                                    >*</span
                                >
                            </th>
                            <td>
                                <input
                                    id="email__write"
                                    name="mId"
                                    class="join--form__input"
                                    type="email"
                                    placeholder="example@naver.com"
                                    maxlength="30"
                                    required="required"
                                    onkeyup="checkid()"
                                    />
<!--                                <input
                                    class="join--form__btn"
                                    type="button"
                                    value="중복확인"
                                    onclick="chkmId()"
                                /> -->
                                <div class="check__message email__message"></div>
                                <div class="check__message email__message1"></div>
                            </td>
                        </tr>
        				<tr>
        					<th></th>
        					<td>
        						<div style="font-size: 12px;">
        						<span id="msg"></span>
        						</div>
							</td>
        				</tr>
                        <tr>
                            <th>
                                닉네임<span class="join--form__sub--color-pink"
                                    >*</span
                                >
                            </th>
                            <td>
                                <input
                                    id="name__write"
                                    name="mNick"
                                    class="join--form__input"
                                    type="text"
                                    placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합"
                                    maxlength="30"
                                    required="required"
                                    onkeyup="checkNick()"
                                /><!-- <input
                                    class="join--form__btn name-check"
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
        					<th></th>
        					<td>
        						<div style="font-size: 12px;">
        						<span id="msg1"></span>
        						</div>
							</td>
        				</tr>                        
                        <tr>
                            <th>
                                비밀번호<span
                                    class="join--form__sub--color-pink"
                                    >*</span
                                >
                            </th>
                            <td>
                                <input
                                    id="pw__write"
                                    name="mPw"
                                    class="join--form__input pw__write"
                                    type="password"
                                    placeholder="비밀번호를 입력해주세요"
                                    maxlength="16"
                                    required="required"
                                    pattern="^.*(?=^.{10,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$"
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
                                비밀번호확인<span
                                    class="join--form__sub--color-pink"
                                    >*</span
                                >
                            </th>
                            <td>
                                <input
                                    id="pw__check"
                                    class="join--form__input"
                                    type="password"
                                    placeholder="비밀번호를 한번 더 입력해주세요"
                                    maxlength="16"
                                    required="required"
                                    pattern="^.*(?=^.{10,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$"
                                />
                                <div class="check__message pw__confirm"></div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                이름<span class="join--form__sub--color-pink"
                                    >*</span
                                >
                            </th>
                            <td>
                                <input
                                    class="join--form__input"
                                    name="mName"
                                    type="text"
                                    placeholder="이름을 입력해주세요"
                                    maxlength="16"
                                    required="required"
                                />
                            </td>
                        </tr>
                        <tr class="address">
                            <th>
                                주소<span class="join--form__sub--color-pink"
                                    >*</span
                                >
                            </th>
                            <td>
                                <input
                                    id="address"
                                    class="join--form__input"
                                    name="mAddr"
                                    type="text"
                                    placeholder="주소를 검색해 주세요"
                                    maxlength="16"
                                    required="required"
                                />
                                <a class="address--search" href="#none"
                                    ><span id="join--form__btn--address">
                                        <img
                                            src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHg9IjBweCIgeT0iMHB4Igp3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIKdmlld0JveD0iMCAwIDE3MiAxNzIiCnN0eWxlPSIgZmlsbDojMDAwMDAwOyI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJub256ZXJvIiBzdHJva2U9Im5vbmUiIHN0cm9rZS13aWR0aD0iMSIgc3Ryb2tlLWxpbmVjYXA9ImJ1dHQiIHN0cm9rZS1saW5lam9pbj0ibWl0ZXIiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgc3Ryb2tlLWRhc2hhcnJheT0iIiBzdHJva2UtZGFzaG9mZnNldD0iMCIgZm9udC1mYW1pbHk9Im5vbmUiIGZvbnQtd2VpZ2h0PSJub25lIiBmb250LXNpemU9Im5vbmUiIHRleHQtYW5jaG9yPSJub25lIiBzdHlsZT0ibWl4LWJsZW5kLW1vZGU6IG5vcm1hbCI+PHBhdGggZD0iTTAsMTcydi0xNzJoMTcydjE3MnoiIGZpbGw9Im5vbmUiPjwvcGF0aD48ZyBmaWxsPSIjZmZiOThiIj48cGF0aCBkPSJNNzMuNDU4MzMsMjEuNWMtMjguNjMyMTQsMCAtNTEuOTU4MzMsMjMuMzI2MjEgLTUxLjk1ODMzLDUxLjk1ODMzYzAsMjguNjMyMTIgMjMuMzI2MTksNTEuOTU4MzMgNTEuOTU4MzMsNTEuOTU4MzNjMTIuMzg1MjksMCAyMy43NzA3OSwtNC4zNzUwOSAzMi43MTE5MSwtMTEuNjQ1ODNsMzUuMTU0NDYsMzUuMTU0NDZjMS4zNDgxNSwxLjQwNDEyIDMuMzUwMDUsMS45Njk3MSA1LjIzMzY0LDEuNDc4NjZjMS44ODM1OSwtMC40OTEwNSAzLjM1NDU2LC0xLjk2MjAyIDMuODQ1NjEsLTMuODQ1NjFjMC40OTEwNSwtMS44ODM1OSAtMC4wNzQ1NSwtMy44ODU0OSAtMS40Nzg2NiwtNS4yMzM2NGwtMzUuMTU0NDYsLTM1LjE1NDQ2YzcuMjcwNzQsLTguOTQxMTIgMTEuNjQ1ODMsLTIwLjMyNjYzIDExLjY0NTgzLC0zMi43MTE5MWMwLC0yOC42MzIxMiAtMjMuMzI2MTksLTUxLjk1ODMzIC01MS45NTgzMywtNTEuOTU4MzN6TTczLjQ1ODMzLDMyLjI1YzIyLjgyMjQyLDAgNDEuMjA4MzMsMTguMzg1OTMgNDEuMjA4MzMsNDEuMjA4MzNjMCwxMS4xMTc2OSAtNC4zODUyOSwyMS4xNjIxNSAtMTEuNDk4ODYsMjguNTYxNjljLTAuNDM4NDksMC4zMjIyOSAtMC44MjU1LDAuNzA5MyAtMS4xNDc3OSwxLjE0Nzc5Yy03LjM5OTUzLDcuMTEzNTcgLTE3LjQ0Mzk5LDExLjQ5ODg2IC0yOC41NjE2OSwxMS40OTg4NmMtMjIuODIyNDIsMCAtNDEuMjA4MzMsLTE4LjM4NTkzIC00MS4yMDgzMywtNDEuMjA4MzNjMCwtMjIuODIyNCAxOC4zODU5MSwtNDEuMjA4MzMgNDEuMjA4MzMsLTQxLjIwODMzeiI+PC9wYXRoPjwvZz48L2c+PC9zdmc+"
                                            alt="주소검색"
                                        />
                                        주소검색
                                    </span></a
                                >
                                <input
                                    id="sample6_detailAddress"
                                    name="mAddr2"
                                    class="join--form__input"
                                    type="text"
                                    placeholder="상세주소를 입력해 주세요"
                                    maxlength="16"
                                />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                휴대폰<span class="join--form__sub--color-pink"
                                    >*</span
                                >
                            </th>
                            <td>
                                <input
                                    class="join--form__input"
                                    name="mTel"
                                    type="text"
                                    placeholder="숫자만 입력해주세요"
                                    maxlength="16"
                                    required="required"
                                />
                            </td>
                        </tr>
                        <tr class="join--form__agree">
                            <th>
                                이용약관동의<span
                                    class="join--form__sub--color-pink"
                                    >*</span
                                >
                            </th>
                            <td>
                                <ul>
                                    <li>
                                        <label for="all"
                                            ><input
                                                id="all"
                                                class="all--select"
                                                type="checkbox"
                                            />
                                            <div id="all--ico" class="ico">
                                                <i class="fas fa-check"></i>
                                            </div>
                                            전체 동의합니다.
                                        </label>
                                        <p class="sub">
                                            선택항목에 동의하지 않은 경우도
                                            회원가입 및 일반적인 서비스를 이용
                                            할 수 있습니다.
                                        </p>
                                    </li>
                                    <li>
                                        <label for="agreement"
                                            ><input
                                                id="agreement"
                                                class="agree--select"
                                                type="checkbox"
                                                required
                                            />
                                            <div
                                                id="agreement--ico"
                                                class="ico"
                                            >
                                                <i class="fas fa-check"></i>
                                            </div>
                                            이용약관 동의<span class="agree-sub"
                                                >(필수)</span
                                            >
                                        </label>
                                        <a
                                            class="detail agreement"
                                            href="#none"
                                        >
                                            <p>약관보기</p>
                                            <img
                                                src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAABmJLR0QA/wD/AP+gvaeTAAABSUlEQVRoge3Zy01CURCA4X+AGoRYAZEmUBOpwCp0q9YgbFhYhXsSJSCxCOOjAGNswSvjQrcmPuahyfwFnJNvcXLnnAtVVVVV9UfS+fhAZ+Next4tq4X0YnKIyhkdWWVgzCAI5yA3QJ+2XOv8dNNs7S9tb5heTjZArkAHKA+01tuyd/JoucdnmUIgD2MOgRyMCwTiMW4QiMW4QiAO4w6BGEwIBPwxYRDwxYRCwA8TDgEfTAoE7DFpELDFpEIAdDbu0ZEV0AdugaGMjp6/u47dGJ9cO3NzXUy7iC6BLeAeWe/K6PjpJ2vlHfbFtMtrswQd8I7Y+XeH3RoBGR9EBwREjyhOCIgcGh0REDXGOyMg4mIVgADvq24QAjwfHwIR4PUcFIwAjwe6BARYP5kmIcAQkokAyzG+edn/QNzR6DASYV7mj56qqqqq+k1vUFMjm2m669IAAAAASUVORK5CYII="
                                            />
                                        </a>
                                        <div
                                            class="window--blocker agreement--blocker"
                                        >
                                            <div
                                                class="window--detail agreement--detail"
                                            >
                                                <h1 class="detail--title">
                                                    이용약관
                                                    <span class="detail--sub"
                                                        >(필수)</span
                                                    >
                                                </h1>
                                                <div class="detail--article">
                                                    <section
                                                        class="article-section"
                                                    >
                                                        <p>안녕하세요?</p>

                                                        <p>
                                                            (주)당근나라
                                                            서비스를 이용해
                                                            주셔서 감사합니다.
                                                            지역 정보 모바일
                                                            서비스를 제공하는
                                                            당근나라의 아래
                                                            준비한 약관을
                                                            읽어주시면
                                                            감사드리겠습니다.
                                                        </p>

                                                        <h3>계정 관련</h3>

                                                        <p>
                                                            당근나라은 모바일
                                                            서비스 특성상 별다른
                                                            비밀번호 없이
                                                            휴대전화 번호만으로
                                                            계정을 생성하실 수
                                                            있습니다. 다만, 실제
                                                            휴대전화의
                                                            소유주임을 확인하기
                                                            위해서 가입 당시
                                                            인증 절차를 거치게
                                                            됩니다. 또한, 다른
                                                            모바일 기기에서
                                                            서비스 사용을
                                                            연속하기 위해서는
                                                            기존에 가입하고
                                                            인증했던 휴대전화
                                                            번호로 재인증을 해야
                                                            합니다. 아래의
                                                            경우에는 계정 생성을
                                                            승인하지 않을 수
                                                            있습니다.
                                                        </p>

                                                        <ol>
                                                            <li>
                                                                다른 사람의
                                                                명의나 휴대전화
                                                                번호 등
                                                                개인정보를
                                                                이용하여 계정을
                                                                생성하려 한 경우
                                                            </li>
                                                            <li>
                                                                동일인이 다수의
                                                                계정을 생성하려
                                                                한 경우
                                                            </li>
                                                            <li>
                                                                계정 생성시
                                                                필요한 정보를
                                                                입력하지 않거나
                                                                허위 정보를
                                                                입력한 경우
                                                            </li>
                                                            <li>
                                                                당근나라의
                                                                과거에 운영원칙
                                                                또는 법률 위반
                                                                등의 정당한
                                                                사유로 해당
                                                                계정을 삭제 또는
                                                                징계한 경우
                                                            </li>
                                                            <li>
                                                                사기 정보 모음
                                                                사이트나
                                                                정부기관 사이트
                                                                등에서 거래 사기
                                                                이력이 있는
                                                                휴대전화 번호로
                                                                확인된 경우
                                                            </li>
                                                        </ol>

                                                        <p>
                                                            계정은 본인만 이용할
                                                            수 있고, 다른
                                                            사람에게 이용을
                                                            허락하거나 양도할 수
                                                            없습니다. 사용자는
                                                            계정과 관련된 정보,
                                                            즉 프로필 사진이나
                                                            별명 등을 수정할 수
                                                            있습니다. 휴대폰
                                                            번호가 바뀐 경우에는
                                                            서비스 내 설정
                                                            메뉴나 고객센터
                                                            문의를 통해 새
                                                            휴대폰 번호로
                                                            인증절차를 걸쳐
                                                            수정할 수 있습니다.
                                                        </p>

                                                        <h3>
                                                            사용시 주의해야 할
                                                            점
                                                        </h3>

                                                        <p>
                                                            당근나라은 사용자가
                                                            아래와 같이 잘못된
                                                            방법이나 행위로
                                                            서비스를 이용할 경우
                                                            사용에 대한
                                                            제재(이용정지,
                                                            강제탈퇴 등)를 가할
                                                            수 있습니다.
                                                        </p>

                                                        <ol>
                                                            <li>
                                                                잘못된 방법으로
                                                                서비스의 제공을
                                                                방해하거나
                                                                당근나라의
                                                                안내하는 방법
                                                                이외의 다른
                                                                방법을 사용하여
                                                                당근나라
                                                                서비스에
                                                                접근하는 행위
                                                            </li>
                                                            <li>
                                                                다른 이용자의
                                                                정보를 무단으로
                                                                수집, 이용하거나
                                                                다른 사람들에게
                                                                제공하는 행위
                                                            </li>
                                                            <li>
                                                                서비스를 영리나
                                                                홍보 목적으로
                                                                이용하는 행위
                                                            </li>
                                                            <li>
                                                                음란 정보나
                                                                저작권 침해 정보
                                                                등 공서양속 및
                                                                법령에 위반되는
                                                                내용의 정보 등을
                                                                발송하거나
                                                                게시하는 행위
                                                            </li>
                                                            <li>
                                                                당근나라의 동의
                                                                없이 당근나라
                                                                서비스 또는 이에
                                                                포함된
                                                                소프트웨어의
                                                                일부를 복사,
                                                                수정, 배포,
                                                                판매, 양도,
                                                                대여,
                                                                담보제공하거나
                                                                타인에게 그
                                                                이용을 허락하는
                                                                행위
                                                            </li>
                                                            <li>
                                                                소프트웨어를
                                                                역설계하거나
                                                                소스 코드의
                                                                추출을 시도하는
                                                                등 당근나라
                                                                서비스를 복제,
                                                                분해 또는
                                                                모방하거나 기타
                                                                변형하는 행위
                                                            </li>
                                                            <li>
                                                                관련 법령,
                                                                당근나라의 모든
                                                                약관 또는 정책을
                                                                준수하지 않는
                                                                행위
                                                            </li>
                                                        </ol>

                                                        <h3>
                                                            개인정보 보호 관련
                                                        </h3>

                                                        <p>
                                                            개인정보는 당근나라
                                                            서비스의 원활한
                                                            제공을 위하여
                                                            사용자가 동의한
                                                            목적과 범위 내에서만
                                                            이용됩니다. 개인정보
                                                            보호 관련 기타
                                                            상세한 사항은
                                                            당근나라
                                                            <a
                                                                href="https://policy.daangn.com/privacy.html"
                                                                >개인정보처리방침</a
                                                            >을 참고하시기
                                                            바랍니다.
                                                        </p>

                                                        <h3>
                                                            게시물의 저작권 보호
                                                        </h3>

                                                        <ol>
                                                            <li>
                                                                당근나라 서비스
                                                                사용자가 서비스
                                                                내에 게시한
                                                                게시물의
                                                                저작권은 해당
                                                                게시물의
                                                                저작자에게
                                                                귀속됩니다.
                                                            </li>
                                                            <li>
                                                                사용자가 서비스
                                                                내에 게시하는
                                                                게시물은
                                                                검색결과 내지
                                                                서비스 및 관련
                                                                프로모션, 광고
                                                                등에 노출될 수
                                                                있으며, 해당
                                                                노출을 위해
                                                                필요한 범위
                                                                내에서는 일부
                                                                수정, 복제,
                                                                편집되어 게시될
                                                                수 있습니다. 이
                                                                경우, 당근나라은
                                                                저작권법 규정을
                                                                준수하며,
                                                                사용자는
                                                                언제든지
                                                                고객센터 또는
                                                                운영자 문의
                                                                기능을 통해 해당
                                                                게시물에 대해
                                                                삭제, 검색결과
                                                                제외, 비공개
                                                                등의 조치를
                                                                요청할 수
                                                                있습니다.
                                                            </li>
                                                            <li>
                                                                위 2항 이외의
                                                                방법으로
                                                                사용자의
                                                                게시물을
                                                                이용하고자 하는
                                                                경우에는 전화,
                                                                팩스, 전자우편
                                                                등을 통해 사전에
                                                                사용자의 동의를
                                                                얻어야 합니다.
                                                            </li>
                                                        </ol>

                                                        <h3>게시물의 관리</h3>

                                                        <ol>
                                                            <li>
                                                                사용자의
                                                                게시물이
                                                                "정보통신망법"
                                                                및 "저작권법"등
                                                                관련법에
                                                                위반되는 내용을
                                                                포함하는 경우,
                                                                권리자는
                                                                관련법이 정한
                                                                절차에 따라 해당
                                                                게시물의
                                                                게시중단 및 삭제
                                                                등을 요청할 수
                                                                있으며,
                                                                당근나라은
                                                                관련법에 따라
                                                                조치를 취하여야
                                                                합니다.
                                                            </li>
                                                            <li>
                                                                당근나라은
                                                                전항에 따른
                                                                권리자의 요청이
                                                                없는 경우라도
                                                                권리침해가
                                                                인정될 만한
                                                                사유가 있거나
                                                                기타 회사 정책
                                                                및 관련법에
                                                                위반되는
                                                                경우에는
                                                                관련법에 따라
                                                                해당 게시물에
                                                                대해
                                                                임시조치(삭제,
                                                                노출제한,
                                                                게시중단) 등을
                                                                취할 수
                                                                있습니다.
                                                            </li>
                                                        </ol>

                                                        <h3>사용권리</h3>

                                                        <p>
                                                            당근나라은 서비스
                                                            이용을 위하여
                                                            양도불가능하고
                                                            무상의 라이선스를
                                                            사용자분들에게
                                                            제공합니다.
                                                            다만,당근나라 상표
                                                            및 로고를 사용할
                                                            권리를
                                                            사용자분들에게
                                                            부여하는 것은
                                                            아닙니다.
                                                        </p>

                                                        <h3>
                                                            서비스 고지 및
                                                            홍보내용 표시
                                                        </h3>

                                                        <p>
                                                            당근나라은 서비스
                                                            사용자분의 편의를
                                                            위해 서비스 이용과
                                                            관련된 각종 고지 및
                                                            기타 당근나라 서비스
                                                            홍보를 포함한 다양한
                                                            정보를 당근나라
                                                            서비스에 표시하거나
                                                            사용자의 휴대폰
                                                            문자로 발송할 수
                                                            있습니다.
                                                        </p>

                                                        <h3>
                                                            위치기반서비스 관련
                                                        </h3>

                                                        <p>
                                                            당근나라은 사용자의
                                                            실생활에 더욱 보탬이
                                                            되는 유용한 서비스를
                                                            제공하기 위하여
                                                            당근나라 서비스에
                                                            위치기반서비스를
                                                            포함시킬 수
                                                            있습니다. 당근나라의
                                                            위치기반서비스는
                                                            사용자의 단말기기의
                                                            위치정보를 수집하는
                                                            위치정보사업자로부터
                                                            위치정보를 전달받아
                                                            제공하는
                                                            무료서비스이며,
                                                            구체적으로는
                                                            사용자의 현재 위치를
                                                            기준으로 특정
                                                            지역커뮤니티에
                                                            가입자격을 부여하고
                                                            다른 이용자와 해당
                                                            지역과 관련된
                                                            게시물을 작성할 수
                                                            있도록 하는
                                                            서비스(지역커뮤니티서비스),
                                                            사용자의 현재 위치를
                                                            이용한 생활 정보나
                                                            광고성 정보를
                                                            제공하는
                                                            서비스(정보제공서비스)가
                                                            있습니다. 특히,
                                                            사용자가 14세 미만
                                                            이용자로서
                                                            개인위치정보를
                                                            활용한 위치기반
                                                            서비스를 이용하기
                                                            위해서는 당근나라은
                                                            사용자의
                                                            개인위치정보를 이용
                                                            또는 제공하게 되며,
                                                            이 경우 부모님 등
                                                            법정대리인의 동의가
                                                            먼저 있어야 합니다.
                                                            만약 법정대리인의
                                                            동의 없이
                                                            위치기반서비스가
                                                            이용된 것으로 판명된
                                                            때에는 당근나라은
                                                            즉시 사용자의
                                                            위치기반서비스
                                                            이용을 중단하는 등
                                                            적절한 제한을 할 수
                                                            있습니다.
                                                        </p>

                                                        <p>
                                                            사용자(14세 미만
                                                            이용자의 법정대리인
                                                            포함)는 당근나라
                                                            서비스와 관련된
                                                            개인위치정보의 이용,
                                                            제공 목적, 제공받는
                                                            자의 범위 및
                                                            위치기반서비스의
                                                            일부에 대하여 동의를
                                                            유보하거나,
                                                            이용∙제공에 대한
                                                            동의의 전부 또는
                                                            일부 철회할 수
                                                            있으며, 일시적인
                                                            중지를 요구할 수
                                                            있습니다. 당근나라은
                                                            위치정보의 보호 및
                                                            이용 등에 관한
                                                            법률의 규정에 따라
                                                            개인위치정보 및
                                                            위치정보
                                                            이용∙제공사실
                                                            확인자료를 6개월
                                                            이상 보관하며,
                                                            사용자가 동의의 전부
                                                            또는 일부를 철회한
                                                            때에는 당근나라은
                                                            철회한 부분에
                                                            해당하는
                                                            개인위치정보 및
                                                            위치정보
                                                            이용∙제공사실
                                                            확인자료를 지체 없이
                                                            파기하겠습니다.
                                                        </p>

                                                        <p>
                                                            사용자(14세 미만
                                                            이용자의 법정대리인
                                                            포함)는 당근나라에
                                                            대하여 사용자에 대한
                                                            위치정보
                                                            이용∙제공사실
                                                            확인자료나, 사용자의
                                                            개인위치정보가
                                                            법령에 의하여
                                                            제3자에게 제공되었을
                                                            때에는 그 이유 및
                                                            내용의 열람 또는
                                                            고지를 요구할 수
                                                            있고, 오류가 있는
                                                            때에는 정정을 요구할
                                                            수 있습니다. 만약,
                                                            당근나라의 사용자의
                                                            개인위치정보를
                                                            사용자가 지정하는
                                                            제3자에게 직접
                                                            제공하는 때에는
                                                            법령에 따라
                                                            개인위치정보를
                                                            수집한 스마트폰
                                                            등으로 사용자에게
                                                            개인위치정보를
                                                            제공받는 자, 제공
                                                            일시 및 제공 목적을
                                                            즉시 통보하겠습니다.
                                                        </p>

                                                        <p>
                                                            당근나라은 8세
                                                            이하의 아동
                                                            등(금치산자, 중증
                                                            정신장애인 포함)의
                                                            보호의무자가
                                                            개인위치정보의 이용
                                                            또는 제공에 서면으로
                                                            동의하는 경우에는
                                                            해당 본인의 동의가
                                                            있는 것으로 보며, 이
                                                            경우 보호의무자는
                                                            개인위치정보주체의
                                                            권리를 모두 행사할
                                                            수 있습니다.
                                                        </p>

                                                        <p>
                                                            당근나라은 사용자의
                                                            위치정보를 안전하게
                                                            보호하기 위하여
                                                            위치정보관리책임자(정창훈
                                                            이사,
                                                            privacy@daangnservice.com)를
                                                            지정하고 있습니다.
                                                        </p>

                                                        <p>
                                                            만약 사용자와
                                                            당근나라 간의
                                                            위치정보와 관련한
                                                            분쟁에 대하여 협의가
                                                            어려운 때에는
                                                            사용자은 위치정보의
                                                            보호 및 이용 등에
                                                            관한 법률 제 28조
                                                            2항 및
                                                            개인정보보호법
                                                            제43조의 규정에 따라
                                                            개인정보
                                                            분쟁조정위원회에
                                                            조정을 신청할 수
                                                            있습니다.
                                                        </p>

                                                        <p>
                                                            <a
                                                                href="https://policy.daangn.com/location.html"
                                                                >위치기반서비스
                                                                이용약관
                                                                전문보기</a
                                                            >
                                                        </p>

                                                        <h3>서비스 중단</h3>

                                                        <p>
                                                            당근나라 서비스는
                                                            장비의 유지∙보수를
                                                            위한 정기 또는 임시
                                                            점검 또는 다른
                                                            상당한 이유로
                                                            당근나라 서비스의
                                                            제공이 일시 중단될
                                                            수 있으며, 이때에는
                                                            미리 서비스
                                                            제공화면에
                                                            공지하겠습니다.
                                                            만약, 당근나라로서도
                                                            예측할 수 없는
                                                            이유로 당근나라
                                                            서비스가 중단된
                                                            때에는 당근나라의
                                                            상황을 파악하는 즉시
                                                            통지하겠습니다.
                                                        </p>

                                                        <h3>
                                                            이용계약 해지(서비스
                                                            탈퇴)
                                                        </h3>

                                                        <p>
                                                            사용자가 당근나라
                                                            서비스의 이용을 더
                                                            이상 원치 않는
                                                            때에는 언제든지
                                                            당근나라 서비스 내
                                                            제공되는 메뉴를
                                                            이용하여 당근나라
                                                            서비스 이용계약의
                                                            해지 신청을 할 수
                                                            있으며, 당근나라은
                                                            법령이 정하는 바에
                                                            따라 신속히
                                                            처리하겠습니다.
                                                            다만, 거래사기 등의
                                                            부정이용 방지를 위해
                                                            거래를 진행중이거나
                                                            거래 관련 분쟁이
                                                            발생한 사용자는
                                                            이용계약 해지 및
                                                            서비스 탈퇴가 특정
                                                            기간 동안 제한될 수
                                                            있습니다. 이용계약이
                                                            해지되면 법령 및
                                                            개인정보처리방침에
                                                            따라 사용자 정보를
                                                            보유하는 경우를
                                                            제외하고는 사용자
                                                            정보나 사용자가
                                                            작성한 게시물 등
                                                            모든 데이터는
                                                            삭제됩니다. 다만,
                                                            사용자가 작성한
                                                            게시물이 제3자에
                                                            의하여 스크랩 또는
                                                            다른 공유 기능으로
                                                            게시되거나, 사용자가
                                                            제3자의 게시물에
                                                            댓글, 채팅 등
                                                            게시물을 추가하는
                                                            등의 경우에는 다른
                                                            이용자의 정상적
                                                            서비스 이용을 위하여
                                                            필요한 범위 내에서
                                                            당근나라 서비스 내에
                                                            삭제되지 않고 남아
                                                            있게 됩니다.
                                                        </p>

                                                        <h3>책임제한</h3>

                                                        <p>
                                                            당근나라은 법령상
                                                            허용되는 한도 내에서
                                                            당근나라 서비스와
                                                            관련하여 본 약관에
                                                            명시되지 않은 어떠한
                                                            구체적인 사항에 대한
                                                            약정이나 보증을 하지
                                                            않습니다. 예를 들어,
                                                            당근나라은 당근나라
                                                            서비스에 속한
                                                            콘텐츠, 서비스의
                                                            특정 기능, 서비스의
                                                            이용가능성에 대하여
                                                            어떠한 약정이나
                                                            보증을 하는 것이
                                                            아니며, 당근나라
                                                            서비스를 있는 그대로
                                                            제공할 뿐입니다.
                                                        </p>

                                                        <h3>손해배상</h3>

                                                        <p>
                                                            당근나라의 과실로
                                                            인하여 사용자가
                                                            손해를 입게 될 경우
                                                            당근나라은 법령에
                                                            따라 사용자의 손해를
                                                            배상하겠습니다.
                                                            다만, 당근나라은
                                                            당근나라 서비스에
                                                            접속 또는
                                                            이용과정에서
                                                            발생하는 개인적인
                                                            손해, 제3자가
                                                            불법적으로
                                                            당근나라의 서버에
                                                            접속하거나 서버를
                                                            이용함으로써
                                                            발생하는 손해,
                                                            제3자가 당근나라
                                                            서버에 대한 전송
                                                            또는 당근나라
                                                            서버로부터의 전송을
                                                            방해함으로써
                                                            발생하는 손해,
                                                            제3자가 악성
                                                            프로그램을 전송 또는
                                                            유포함으로써
                                                            발생하는 손해,
                                                            전송된 데이터의
                                                            생략, 누락, 파괴
                                                            등으로 발생한 손해,
                                                            명예훼손 등 제3자가
                                                            당근나라 서비스를
                                                            이용하는 과정에서
                                                            사용자에게 발생시킨
                                                            손해에 대하여 책임을
                                                            부담하지 않습니다.
                                                            또한 당근나라은
                                                            법률상 허용되는 한도
                                                            내에서 간접 손해,
                                                            특별 손해, 결과적
                                                            손해, 징계적 손해,
                                                            및 징벌적 손해에
                                                            대한 책임을 부담하지
                                                            않습니다.
                                                        </p>

                                                        <h3>약관수정</h3>

                                                        <p>
                                                            당근나라은 법률이나
                                                            당근나라 서비스의
                                                            변경사항을 반영하기
                                                            위한 목적 등으로 본
                                                            약관이나 각 당근나라
                                                            서비스 고객센터의
                                                            당근나라 서비스
                                                            이용방법, 해당 안내
                                                            및 고지사항을 수정할
                                                            수 있습니다. 본
                                                            약관이 변경되는 경우
                                                            당근나라은 변경
                                                            사항을 개별 당근나라
                                                            서비스 초기화면에
                                                            게시하며, 변경된
                                                            약관은 게시한
                                                            날로부터 7일 후부터
                                                            효력이 발생합니다.
                                                        </p>

                                                        <p>
                                                            당근나라은 변경된
                                                            약관을 게시한
                                                            날로부터 효력이
                                                            발생되는 날까지
                                                            약관변경에 대한
                                                            사용자의 의견을
                                                            기다리겠습니다. 위
                                                            기간이 지나도록
                                                            사용자의 의견이
                                                            당근나라에 접수되지
                                                            않으면, 사용자가
                                                            변경된 약관에 따라
                                                            서비스를 이용하는
                                                            데에 동의하는 것으로
                                                            보겠습니다. 사용자가
                                                            변경된 약관에
                                                            동의하지 않는 경우
                                                            변경된 약관의 적용을
                                                            받는 해당 서비스의
                                                            제공이 더 이상
                                                            불가능하게 됩니다.
                                                        </p>

                                                        <h3>사용자 의견</h3>

                                                        <p>
                                                            당근나라은 사용자의
                                                            의견을 소중하게
                                                            생각합니다. 사용자는
                                                            언제든지 서비스 내
                                                            당근나라 운영자
                                                            문의란을 통해 의견을
                                                            개진할 수 있습니다.
                                                            당근나라은 푸시
                                                            알림, 채팅 방법,
                                                            휴대폰 번호 등으로
                                                            사용자에게 여러 가지
                                                            소식을 알려드리며,
                                                            사용자 전체에 대한
                                                            통지는 당근나라
                                                            서비스 초기화면 또는
                                                            공지사항 란에
                                                            게시함으로써 효력이
                                                            발생합니다.
                                                        </p>

                                                        <p>
                                                            본 약관은 당근나라와
                                                            사용자와의 관계에
                                                            적용되며, 제3자의
                                                            수익권을 발생시키지
                                                            않습니다.
                                                        </p>

                                                        <p>
                                                            사용자가 본 약관을
                                                            준수하지 않은
                                                            경우에, 당근나라의
                                                            즉시 조치를 취하지
                                                            않더라도 당근나라의
                                                            가지고 있는 권리를
                                                            포기하는 것이
                                                            아니며, 본 약관 중
                                                            일부 조항의 집행이
                                                            불가능하게 되더라도
                                                            다른 조항에는 영향을
                                                            미치지 않습니다.
                                                        </p>

                                                        <p>
                                                            본 약관 또는
                                                            당근나라 서비스와
                                                            관련하여서는
                                                            대한민국의 법률이
                                                            적용됩니다.
                                                        </p>

                                                        <ul>
                                                            <li>
                                                                공고일자: 2020년
                                                                03월 04일
                                                            </li>
                                                            <li>
                                                                시행일자: 2020년
                                                                03월 11일
                                                            </li>
                                                        </ul>
                                                    </section>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <label for="private"
                                            ><input
                                                id="private"
                                                class="agree--select"
                                                type="checkbox"
                                                required="required"
                                            />
                                            <div id="private--ico" class="ico">
                                                <i class="fas fa-check"></i>
                                            </div>
                                            개인정보처리방침 동의<span
                                                class="agree-sub"
                                                >(필수)</span
                                            >
                                        </label>
                                        <a
                                            class="detail private"
                                            href="#none"
                                        >
                                            <p>약관보기</p>
                                            <img
                                                src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAABmJLR0QA/wD/AP+gvaeTAAABSUlEQVRoge3Zy01CURCA4X+AGoRYAZEmUBOpwCp0q9YgbFhYhXsSJSCxCOOjAGNswSvjQrcmPuahyfwFnJNvcXLnnAtVVVVV9UfS+fhAZ+Next4tq4X0YnKIyhkdWWVgzCAI5yA3QJ+2XOv8dNNs7S9tb5heTjZArkAHKA+01tuyd/JoucdnmUIgD2MOgRyMCwTiMW4QiMW4QiAO4w6BGEwIBPwxYRDwxYRCwA8TDgEfTAoE7DFpELDFpEIAdDbu0ZEV0AdugaGMjp6/u47dGJ9cO3NzXUy7iC6BLeAeWe/K6PjpJ2vlHfbFtMtrswQd8I7Y+XeH3RoBGR9EBwREjyhOCIgcGh0REDXGOyMg4mIVgADvq24QAjwfHwIR4PUcFIwAjwe6BARYP5kmIcAQkokAyzG+edn/QNzR6DASYV7mj56qqqqq+k1vUFMjm2m669IAAAAASUVORK5CYII="
                                            />
                                        </a>
                                        <div
                                            class="window--blocker private--blocker"
                                        >
                                            <div
                                                class="window--detail private--detail"
                                            >
                                                <h1 class="detail--title">
                                                    개인정보처리방침
                                                    <span class="detail--sub"
                                                        >(필수)</span
                                                    >
                                                </h1>
                                                <div class="detail--article">
                                                    <section
                                                        class="article-section"
                                                    >
                                                        <p>
                                                            "주식회사
                                                            당근나라”(이하
                                                            “회사”)은
                                                            "정보통신망 이용촉진
                                                            및 정보보호에 관한
                                                            법률",
                                                            “개인정보보호법”,
                                                            "통신비밀보호법",
                                                            "전기통신사업법" 및
                                                            “전자상거래 등에서의
                                                            소비자 보호에 관한
                                                            법률” 등
                                                            정보통신서비스제공자가
                                                            준수하여야 할 관련
                                                            법령상의
                                                            개인정보보호 규정을
                                                            준수하며, 관련
                                                            법령에 의거한
                                                            개인정보처리방침을
                                                            정하여 이용자 권익
                                                            보호에 최선을
                                                            다하겠습니다. 회사는
                                                            이용자의 개인정보를
                                                            [개인정보의
                                                            수집목적]에서 고지한
                                                            범위 내에서
                                                            사용하며, 이용자의
                                                            사전 동의 없이는 동
                                                            범위를 초과하여
                                                            이용하거나
                                                            원칙적으로 이용자의
                                                            개인정보를 외부에
                                                            제공 또는 위탁하지
                                                            않습니다. 다만,
                                                            아래의 경우에는
                                                            예외로 합니다.
                                                        </p>

                                                        <ul>
                                                            <li>
                                                                이용자가 사전에
                                                                동의한
                                                                경우(이용자가
                                                                사전에 동의한
                                                                경우란, 서비스
                                                                이용 등을 위하여
                                                                이용자가
                                                                자발적으로
                                                                자신의
                                                                개인정보를
                                                                제3자에게
                                                                제공하는 것에
                                                                동의하는 것을
                                                                의미합니다.)
                                                            </li>
                                                            <li>
                                                                법령의 규정에
                                                                의거하거나, 수사
                                                                목적으로 법령에
                                                                정해진 절차와
                                                                방법에 따라
                                                                수사기관의
                                                                요구가 있는 경우
                                                            </li>
                                                        </ul>

                                                        <p>
                                                            이러한 경우에도,
                                                            회사는 이용자에게
                                                            (1) 개인정보를
                                                            제공받는 자 (2) 그의
                                                            이용목적 (3)
                                                            개인정보의 보유 및
                                                            이용기간을 사전에
                                                            고지하고 이에 대해
                                                            명시적·개별적으로
                                                            동의를 얻습니다.
                                                            이와 같은 모든
                                                            과정에 있어서 회사는
                                                            이용자의 의사에
                                                            반하여 추가적인
                                                            정보를 수집하거나,
                                                            동의의 범위를 벗어난
                                                            정보를 제3자와
                                                            공유하지 않습니다.
                                                        </p>

                                                        <h3>개인정보 활용처</h3>

                                                        <p>
                                                            당근나라은 아래와
                                                            같은 활용 목적을
                                                            가지고 사용자
                                                            개인정보를
                                                            수집합니다.
                                                        </p>

                                                        <ol>
                                                            <li>
                                                                서비스의 기본
                                                                기능이나 특화된
                                                                기능을 제공
                                                            </li>
                                                            <li>
                                                                개별적 공지
                                                                필요시
                                                            </li>
                                                            <li>
                                                                서비스 이용과
                                                                관련하여 문의나
                                                                분쟁의 해결
                                                            </li>
                                                            <li>
                                                                유료서비스 이용
                                                                시 컨텐츠 등의
                                                                전송이나
                                                                배송∙요금 정산
                                                            </li>
                                                            <li>
                                                                맞춤형 서비스
                                                                제공
                                                            </li>
                                                            <li>
                                                                인구통계학적
                                                                특성에 따른
                                                                서비스 제공
                                                            </li>
                                                            <li>
                                                                각종 이벤트나
                                                                광고성 정보의
                                                                제공
                                                            </li>
                                                            <li>
                                                                법령 등에 규정된
                                                                의무의 이행
                                                            </li>
                                                            <li>
                                                                법령이나
                                                                이용약관에
                                                                반하여
                                                                여러분에게
                                                                피해를 줄 수
                                                                있는 잘못된
                                                                이용행위의 방지
                                                            </li>
                                                        </ol>

                                                        <h3>
                                                            수집하는 개인정보
                                                        </h3>

                                                        <ol>
                                                            <li>휴대폰 번호</li>
                                                            <li>
                                                                거래 계좌번호
                                                            </li>
                                                            <li>
                                                                앱 내 채팅
                                                                기능을 사용한
                                                                채팅 내용
                                                            </li>
                                                            <li>
                                                                이용자
                                                                이름(닉네임)
                                                            </li>
                                                            <li>프로필 사진</li>
                                                            <li>
                                                                사진(메타정보
                                                                포함)
                                                            </li>
                                                            <li>
                                                                위치정보(선택적)
                                                            </li>
                                                            <li>
                                                                단말기 정보(OS,
                                                                화면사이즈,
                                                                디바이스
                                                                아이디), IP주소,
                                                                쿠키 정보
                                                            </li>
                                                            <li>
                                                                이름, 휴대폰
                                                                번호, 주소와
                                                                같은
                                                                배송정보(이벤트
                                                                물품 당첨시)
                                                            </li>
                                                            <li>
                                                                신용카드 정보,
                                                                통신사 정보,
                                                                상품권 번호 등
                                                                결제에 필요한
                                                                정보(유료 서비스
                                                                이용시)
                                                            </li>
                                                        </ol>

                                                        <h3>
                                                            개인정보를 수집하는
                                                            방법
                                                        </h3>

                                                        <p>
                                                            당근나라은 다음과
                                                            같은 방법을 통해
                                                            개인정보를
                                                            수집합니다.
                                                        </p>

                                                        <ol>
                                                            <li>
                                                                회원가입 및
                                                                서비스 이용
                                                                과정에서
                                                                이용자가
                                                                개인정보 수집에
                                                                대해 동의를 하고
                                                                직접 정보를
                                                                입력하는 경우
                                                            </li>
                                                            <li>
                                                                거래 과정에서
                                                                사용자가
                                                                채팅방에
                                                                입력하는
                                                                휴대번호,
                                                                계좌번호
                                                            </li>
                                                            <li>
                                                                제휴 서비스 또는
                                                                단체 등으로부터
                                                                개인정보를
                                                                제공받은 경우
                                                            </li>
                                                            <li>
                                                                고객센터를 통한
                                                                상담 과정에서
                                                                웹페이지, 메일,
                                                                팩스, 전화
                                                                등온·오프라인에서
                                                                진행되는
                                                                이벤트/행사 등
                                                                참여
                                                            </li>
                                                        </ol>

                                                        <h3>
                                                            서비스 이용 과정에서
                                                            이용자로부터
                                                            수집하는 개인정보
                                                        </h3>

                                                        <p>
                                                            PC웹, 모바일 웹/앱
                                                            이용 과정에서
                                                            단말기정보(OS,
                                                            화면사이즈, 디바이스
                                                            아이디), IP주소,
                                                            쿠키, 방문일시의
                                                            정보가 자동으로
                                                            생성되어 수집될 수
                                                            있습니다.
                                                        </p>

                                                        <h3>
                                                            개인정보 공유 및
                                                            제공
                                                        </h3>

                                                        <p>
                                                            당근나라은 사용자가
                                                            서비스 이용과정
                                                            등에서 따로 동의하는
                                                            경우나 법령에 규정된
                                                            경우를 제외하고는
                                                            사용자 개인정보를
                                                            위에서 말씀 드린
                                                            목적 범위를 초과하여
                                                            이용하거나 제3자에게
                                                            제공 또는 공유하지
                                                            않습니다.
                                                        </p>

                                                        <h4>
                                                            개인정보 취급 위탁
                                                        </h4>

                                                        <p>
                                                            당근나라은 서비스의
                                                            원활한 제공을 위해
                                                            필요한 때에는
                                                            개인정보의 취급을
                                                            일부 위탁하고
                                                            있으며, 수탁 받은
                                                            업체가 관계 법령을
                                                            준수하도록
                                                            관리·감독하고
                                                            있습니다.
                                                        </p>

                                                        <ul>
                                                            <li>
                                                                수탁업체 :
                                                                나이스페이먼츠(주)
                                                            </li>
                                                            <li>
                                                                위탁내용 : 전자
                                                                결제 서비스
                                                            </li>
                                                            <li>
                                                                <p>
                                                                    개인정보의
                                                                    보유 및
                                                                    이용기간 :
                                                                    회원탈퇴시
                                                                    혹은
                                                                    위탁계약
                                                                    종료시까지
                                                                </p>
                                                            </li>
                                                            <li>
                                                                <p>
                                                                    수탁업체 :
                                                                    (주)당근서비스
                                                                </p>
                                                            </li>
                                                            <li>
                                                                위탁내용 :
                                                                고객센터 운영,
                                                                응대, 상담을
                                                                위해 활용되는
                                                                개인정보
                                                            </li>
                                                            <li>
                                                                <p>
                                                                    개인정보의
                                                                    보유 및
                                                                    이용기간 :
                                                                    회원탈퇴시
                                                                    혹은
                                                                    위탁계약
                                                                    종료시까지
                                                                </p>
                                                            </li>
                                                            <li>
                                                                <p>
                                                                    수탁업체 :
                                                                    (주)티아이모바일
                                                                </p>
                                                            </li>
                                                            <li>
                                                                위탁내용 :
                                                                이벤트 쿠폰
                                                                문자발송을 위한
                                                                휴대폰번호
                                                            </li>
                                                            <li>
                                                                개인정보의 보유
                                                                및 이용기간 :
                                                                회원탈퇴시 혹은
                                                                위탁계약
                                                                종료시까지
                                                            </li>
                                                        </ul>

                                                        <h3>
                                                            개인정보 보유기간,
                                                            파기방법 및 이용기간
                                                        </h3>

                                                        <p>
                                                            사용자 개인정보는
                                                            사용자로부터 동의를
                                                            받은 수집 및
                                                            이용목적이 달성된
                                                            때에는 회사 내부
                                                            방침 또는 관계
                                                            법령에서 정한 일정한
                                                            기간 동안 보관한
                                                            다음 파기합니다.
                                                            종이에 출력된
                                                            개인정보는 분쇄기로
                                                            분쇄하거나 소각을
                                                            통하여 파기하고,
                                                            전자적 파일 형태로
                                                            저장된 개인정보는
                                                            기록을 재생할 수
                                                            없는 기술적 방법을
                                                            사용하여 삭제합니다.
                                                            당근나라의 내부 방침
                                                            또는 법령에 따라
                                                            보관하는 개인정보 및
                                                            해당 법령은 아래
                                                            표와 같습니다.
                                                        </p>

                                                        <p>
                                                            가. 회사 내부 방침에
                                                            의한 정보보유 사유
                                                        </p>

                                                        <ul>
                                                            <li>
                                                                보존 항목: 부정
                                                                이용 기록
                                                            </li>
                                                            <li>
                                                                보존 이유: 부정
                                                                이용 방지
                                                            </li>
                                                            <li>
                                                                <p>
                                                                    보존 기간:
                                                                    10년
                                                                </p>
                                                            </li>
                                                            <li>
                                                                <p>
                                                                    보존 항목:
                                                                    판매 게시물
                                                                    및 채팅 내용
                                                                </p>
                                                            </li>
                                                            <li>
                                                                보존 이유: 거래
                                                                관련 사기 방지
                                                                및 분쟁 해결
                                                            </li>
                                                            <li>
                                                                보존 기간: 5년
                                                            </li>
                                                        </ul>

                                                        <p>
                                                            나. 관련 법령에 의한
                                                            정보보유 사유
                                                        </p>

                                                        <ul>
                                                            <li>
                                                                보존 항목: 계약
                                                                또는 청약철회
                                                                등에 관한 기록
                                                            </li>
                                                            <li>
                                                                근거 법령:
                                                                전자상거래
                                                                등에서의
                                                                소비자보호에
                                                                관한 법률
                                                            </li>
                                                            <li>
                                                                <p>
                                                                    보존 기간:
                                                                    5년
                                                                </p>
                                                            </li>
                                                            <li>
                                                                <p>
                                                                    보존 항목:
                                                                    대금결제 및
                                                                    재화 등의
                                                                    공급에 관한
                                                                    기록
                                                                </p>
                                                            </li>
                                                            <li>
                                                                근거 법령:
                                                                전자상거래
                                                                등에서의
                                                                소비자보호에
                                                                관한 법률
                                                            </li>
                                                            <li>
                                                                <p>
                                                                    보존 기간:
                                                                    5년
                                                                </p>
                                                            </li>
                                                            <li>
                                                                <p>
                                                                    보존 항목:
                                                                    소비자의
                                                                    불만 또는
                                                                    분쟁처리에
                                                                    관한 기록
                                                                </p>
                                                            </li>
                                                            <li>
                                                                근거 법령:
                                                                전자상거래
                                                                등에서의
                                                                소비자보호에
                                                                관한 법률
                                                            </li>
                                                            <li>
                                                                <p>
                                                                    보존 기간:
                                                                    3년
                                                                </p>
                                                            </li>
                                                            <li>
                                                                <p>
                                                                    보존 항목:
                                                                    표시/광고에
                                                                    관한 기록
                                                                </p>
                                                            </li>
                                                            <li>
                                                                근거 법령:
                                                                전자상거래
                                                                등에서의
                                                                소비자보호에
                                                                관한 법률
                                                            </li>
                                                            <li>
                                                                <p>
                                                                    보존 기간:
                                                                    6개월
                                                                </p>
                                                            </li>
                                                            <li>
                                                                <p>
                                                                    보존 항목:
                                                                    세법이
                                                                    규정하는
                                                                    모든 거래에
                                                                    관한 장부 및
                                                                    증빙서류
                                                                </p>
                                                            </li>
                                                            <li>
                                                                근거 법령:
                                                                국세기본법
                                                            </li>
                                                            <li>
                                                                <p>
                                                                    보존 기간:
                                                                    5년
                                                                </p>
                                                            </li>
                                                            <li>
                                                                <p>
                                                                    보존 항목:
                                                                    전자금융
                                                                    거래에 관한
                                                                    기록
                                                                </p>
                                                            </li>
                                                            <li>
                                                                근거 법령:
                                                                전자금융거래법
                                                            </li>
                                                            <li>
                                                                <p>
                                                                    보존 기간:
                                                                    5년
                                                                </p>
                                                            </li>
                                                            <li>
                                                                <p>
                                                                    보존 항목:
                                                                    서비스
                                                                    방문기록
                                                                </p>
                                                            </li>
                                                            <li>
                                                                근거 법령:
                                                                통신비밀보호법
                                                            </li>
                                                            <li>
                                                                보존 기간: 3개월
                                                            </li>
                                                        </ul>

                                                        <h3>
                                                            인터넷 접속정보파일
                                                            등 개인정보를
                                                            자동으로 수집하는
                                                            장치의 설치·운영 및
                                                            그 거부에 관한 사항
                                                        </h3>

                                                        <h4>쿠키란?</h4>

                                                        <p>
                                                            웹사이트를
                                                            운영하는데 이용되는
                                                            서버가 이용자의
                                                            브라우저에 보내는
                                                            아주 작은 텍스트
                                                            파일로서 이용자
                                                            컴퓨터에 저장됩니다.
                                                        </p>

                                                        <h4>사용목적?</h4>

                                                        <p>
                                                            개인화되고 맞춤화된
                                                            서비스를 제공하기
                                                            위해서 이용자의
                                                            정보를 저장하고
                                                            수시로 불러오는
                                                            쿠키를 사용합니다.
                                                            이용자가 웹사이트에
                                                            방문할 경우 웹
                                                            사이트 서버는
                                                            이용자의 디바이스에
                                                            저장되어 있는 쿠키의
                                                            내용을 읽어 이용자의
                                                            환경설정을 유지하고
                                                            맞춤화된 서비스를
                                                            제공하게 됩니다.
                                                            쿠키는 이용자가 웹
                                                            사이트를 방문할 때,
                                                            웹 사이트 사용을
                                                            설정한대로 접속하고
                                                            편리하게 사용할 수
                                                            있도록 돕습니다.
                                                            또한, 이용자의
                                                            웹사이트 방문 기록,
                                                            이용 형태를 통해서
                                                            최적화된 광고 등
                                                            맞춤형 정보를
                                                            제공하기 위해
                                                            활용됩니다.
                                                        </p>

                                                        <h4>쿠키 수집 거부</h4>

                                                        <p>
                                                            쿠키에는 이름,
                                                            전화번호 등 개인을
                                                            식별하는 정보를
                                                            저장하지 않으며,
                                                            이용자는 쿠키 설치에
                                                            대한 선택권을 가지고
                                                            있습니다. 따라서,
                                                            이용자는 웹
                                                            브라우저에서 옵션을
                                                            설정함으로써 모든
                                                            쿠키를 허용하거나,
                                                            쿠키가 저장될 때마다
                                                            확인을 거치거나,
                                                            모든 쿠키의 저장을
                                                            거부할 수도
                                                            있습니다. 다만, 쿠키
                                                            설치를 거부할 경우
                                                            웹 사용이
                                                            불편해지며, 로그인이
                                                            필요한 일부 서비스
                                                            이용에 어려움이 있을
                                                            수 있습니다.
                                                        </p>

                                                        <h4>설정 방법의 예</h4>

                                                        <ul>
                                                            <li>
                                                                Internet
                                                                Explorer의 경우
                                                                웹 브라우저
                                                                상단의 도구 메뉴
                                                                > 인터넷 옵션 >
                                                                개인정보 > 설정
                                                            </li>
                                                            <li>
                                                                Chrome의 경우 웹
                                                                브라우저 우측의
                                                                설정 메뉴 > 화면
                                                                하단의 고급 설정
                                                                표시 >
                                                                개인정보의
                                                                콘텐츠 설정 버튼
                                                                > 쿠키
                                                            </li>
                                                        </ul>

                                                        <h3>
                                                            사용자 권리 보호
                                                        </h3>

                                                        <p>
                                                            사용자(만 14세
                                                            미만인 경우 법정
                                                            대리인)는 언제든지
                                                            사용자 개인정보를
                                                            조회하거나 수정할 수
                                                            있으며 수집∙이용에
                                                            대한 동의 철회 또는
                                                            가입 해지를 요청할
                                                            수도 있습니다. 보다
                                                            구체적으로는 서비스
                                                            내 설정 기능을 통한
                                                            변경, 가입 해지(동의
                                                            철회)를 위해서는
                                                            서비스 내
                                                            "계정탈퇴"를
                                                            클릭하면 되며,
                                                            운영자에게
                                                            이메일이나 별도
                                                            게시판으로 문의할
                                                            경우도 지체 없이
                                                            조치하겠습니다.
                                                        </p>

                                                        <h3>개인정보 문의처</h3>

                                                        <p>
                                                            사용자가 서비스를
                                                            이용하면서 발생하는
                                                            모든 개인정보보호
                                                            관련 문의, 불만,
                                                            조언이나 기타 사항은
                                                            개인정보 보호책임자
                                                            및 담당부서로 연락해
                                                            주시기 바랍니다.
                                                            당근나라은 사용자
                                                            목소리에 귀 기울이고
                                                            신속하고 충분한
                                                            답변을 드릴 수
                                                            있도록 최선을
                                                            다하겠습니다.
                                                        </p>

                                                        <h3>
                                                            개인정보 보호책임자
                                                        </h3>

                                                        <ul>
                                                            <li>
                                                                이름: 정창훈
                                                            </li>
                                                            <li>
                                                                직위:
                                                                기술총괄이사
                                                            </li>
                                                            <li>
                                                                부서: 보안파트
                                                            </li>
                                                            <li>
                                                                연락처:
                                                                privacy@daangnservice.com
                                                            </li>
                                                        </ul>

                                                        <h3>고지의 의무</h3>

                                                        <p>
                                                            당근나라은 법률이나
                                                            서비스의 변경사항을
                                                            반영하기 위한 목적
                                                            등으로
                                                            개인정보처리방침을
                                                            수정할 수 있습니다.
                                                            개인정보처리방침이
                                                            변경되는 경우
                                                            당근나라은 변경
                                                            사항을 게시하며,
                                                            변경된
                                                            개인정보처리방침은
                                                            게시한 날로부터 7일
                                                            후부터 효력이
                                                            발생합니다.
                                                        </p>

                                                        <ul>
                                                            <li>
                                                                공고일자: 2020년
                                                                06월 11일
                                                            </li>
                                                            <li>
                                                                시행일자: 2020년
                                                                06월 18일
                                                            </li>
                                                        </ul>
                                                    </section>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
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
                                                class="window--detail location--detail"
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
                    <div class="join--form">
                        <input
                        	id="join"
                            class="submit-btn"
                            type="submit"
                            value="가입완료"
                        />
                    </div>
                </div>
            </div>
            </form>
        </section>
        
<%@ include file="footer.jsp"%>
    </body>
</html>