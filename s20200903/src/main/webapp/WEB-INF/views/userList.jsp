<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();
		var url = "${getBoardListURL}";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		console.log(url);
		location.href = url;
	});
	function fn_prev(page, range, rangeSize, searchType, keyword) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${globalCtx}/user/getUserList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;
	}
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${getUserListURL}";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		console.log(url);
		location.href = url;
	}
	function fn_next(page, range, rangeSize, searchType, keyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${globalCtx}/user/getUserList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;
	}
</script>

</head>
<body>
	<div class="container">
		<h2>User list</h2>
		<div class="table-responsive">
			<table class="table table-striped table-sm">
				<colgroup>
					<col style="width: auto;" />
					<col style="width: 25%;" />
					<col style="width: 25%;" />
					<col style="width: 15%;" />
					<col style="width: 15%;" />
				</colgroup>
				<thead>
					<tr>
						<th>USER ID</th>
						<th>USER NAME</th>
						<th>EMAIL</th>
						<th>GRADE</th>
						<th>가입일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty userList }">
							<tr>
								<td colspan="5" align="center">데이터가 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty userList}">
							<c:forEach var="list" items="${userList}">
								<tr>
									<td><c:out value="${list.uid}" /></td>
									<td><c:out value="${list.name}" /></td>
									<td><c:out value="${list.email}" /></td>
									<td><c:out value="${list.grade}" /></td>
									<td><c:out value="${list.reg_dt}" /></td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
		<!-- pagination{s} -->
		<div id="paginationBox">
			<ul class="pagination">
				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.searchType}', '${pagination.keyword}')">Previous</a></li>
				</c:if>
				<c:forEach begin="${pagination.startPage}"
					end="${pagination.endPage}" var="idx">
					<li
						class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
						class="page-link" href="#"
						onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.searchType}', '${pagination.keyword}' )">
							${idx} </a></li>
				</c:forEach>
				<c:if test="${pagination.next}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.searchType}', '${pagination.keyword}')">Next</a></li>
				</c:if>
			</ul>
		</div>

</body>
</html>