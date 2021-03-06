<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>회원가입 :: 당근나라</title>
        <link rel="stylesheet" href="css/common.css" />
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
        <aside class="fixed__list">
            <ul>
                <li><a href="JYnoticeBoard.do">공지사항</a></li>
                <li><a href="SJblackListBoard.do">검거완료 !</a></li>
                <li>
                    <a href="JHbadReviewBoard.do">불량거래 후기</a>
                </li>
                <li><a href="list.do">판매중 이에요.</a></li>
                <li><a href="#">나눔중 이에요.</a></li>
                <li><a href="buylist.do?mId=${sessionScope.mId }">구매합니다 ~!</a></li>
            </ul>
        </aside>
</body>
</html>