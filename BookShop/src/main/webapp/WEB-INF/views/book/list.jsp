<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>

<div class="container">
	<div>
		<div><h3>도서 관리</h3></div>
		
		<div>
			<form class="row">
				<div class=col-6></div>
				<div class="col">
					<select name="search" class="form-select form-select-sm">
						<option value="1">도서번호</option>
						<option value="2">도서명</option>
						<option value="3">출판사</option>
					</select>
				</div>
				
				<div class="col">
					<input type="text" name="keyword" class="fomr-control form-control-smd d-grid">
				</div>
				
				<div class="col d-grid">
					<button class="btn btn-primary btn-sm ">검색</button>
					<a></a>
				</div>
			</form>
		</div>
		
		<div>${book.name}</div>
		<div>
			<table border="1" class="table table-sm">
				<thead class="table-dark">
					<tr>
						<th>도서번호</th>
						<th>도서명</th>
						<th>출판사</th>
						<th>가격</th>
						<th>출판일</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list.size() < 1 }">
					<tr>
						<td colspan="6">검색된 도서가 없습니다.</td>
					</tr>
					</c:if>
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.code}</td>
							<td>${item.title}</td>
							<td>${item.publisher}</td>
							<td>${item.price}</td>
							<td>${item.pubDate}</td>
							<td>
								<a href="delete/${item.code}" class="btn btn-danger btn-sm"><i class="bi bi-trash3"></i>삭제</a>
								<a href="update/${item.code}" class="btn btn-warning btn-sm"><i class="bi bi-vector-pen"></i>변경</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6"></td>
							<div class="pagination pagination-sm justify-content-center">
								<div class="page-item"> <a href="?page=1${pager.query}" class="page-link">처음</a> </div>
								<div class="page-item"> <a href="?page=${pager.prev}${pager.query}" class="page-link">이전</a> </div>
								
								<c:forEach var="page" items="${pager.list}" >
									<div  class="page-item ${pager.page == page ? 'active' : ''}"> <a href="?page=${page}${pager.query}" class="page-link">${page}</a> </div>
								</c:forEach>
								
								<div class="page-item"> <a href="?page=${pager.next}${pager.query}" class="page-link">다음</a> </div>
								<div class="page-item"> <a href="?page=${pager.last}${pager.query}" class="page-link">마지막</a> </div>
							</div>
					</tr>
				</tfoot>
			</table>
		</div>
		
		<div>
			<div class="row">
				<div class="col-6"></div>
				<div class="col"><a href="dummy" class="btn btn-sucess btn-sm">대량등록</a></div>
				<div class="col"><a href="init" class="btn btn-danger btn-sm">초기화</a></div>
				<div class="col"><a href="add" class="btn btn-warning btn-sm">등록</a></div>
				<div class="col"><a href=".." class="btn btn-info btn-sm"> 이전</a></div>
			</div>
		</div>
	</div>
</div>
</body>
</html>