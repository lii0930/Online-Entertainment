<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<base href="/ASM/" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="reset.css" />

<link href="css/bootstrap.min.css" rel="stylesheet">

<link href="css/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="css/fontAwesome.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">

<link rel="stylesheet" href="css/owl.theme.default.min.css">

<link
	href="https://fonts.googleapis.com/css2?family=Anton&family=Dosis:wght@200&family=Oswald&family=Quicksand:wght@300;400&family=Raleway:wght@200&display=swap"
	rel="stylesheet">

<link href="css/templatemo-kind-heart-charity.css" rel="stylesheet">
<style type="text/css">
button:focus, input:focus, textarea:focus, select:focus {
	outline: none;
}

.tabs {
	display: block;
	display: -webkit-flex;
	display: -moz-flex;
	display: flex;
	-webkit-flex-wrap: wrap;
	-moz-flex-wrap: wrap;
	flex-wrap: wrap;
	margin: 0;
	overflow: hidden;
}

.tabs [class^="tab"] label, .tabs [class*=" tab"] label {
	color: #5bc1ac;;
	cursor: pointer;
	display: block;
	font-size: 1.1em;
	font-weight: 300;
	line-height: 1em;
	padding: 2rem 0;
	text-align: center;
}

.tabs [class^="tab"] [type="radio"], .tabs [class*=" tab"] [type="radio"]
	{
	border-bottom: 1px solid rgba(239, 237, 239, 0.5);
	cursor: pointer;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	display: block;
	width: 100%;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

.tabs [class^="tab"] [type="radio"]:hover, .tabs [class^="tab"] [type="radio"]:focus,
	.tabs [class*=" tab"] [type="radio"]:hover, .tabs [class*=" tab"] [type="radio"]:focus
	{
	border-bottom: 1px solid #5bc1ac;
}

.tabs [class^="tab"] [type="radio"]:checked, .tabs [class*=" tab"] [type="radio"]:checked
	{
	border-bottom: 2px solid #5bc1ac;
}

.tabs [class^="tab"] [type="radio"]:checked+div, .tabs [class*=" tab"] [type="radio"]:checked+div
	{
	opacity: 1;
}

.tabs [class^="tab"] [type="radio"]+div, .tabs [class*=" tab"] [type="radio"]+div
	{
	display: block;
	opacity: 0;
	padding: 2rem 0;
	width: 90%;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

.tabs .tab-1 {
	width: 50%;
}

.tabs .tab-4 {
	width: 50%;
}

.tabs .tab-2-3 {
	width: 33.3333333338%;
}

.tabs .tab-2-3 [type="radio"]+div {
	width: 300%;
	margin-left: 300%;
}

.tabs .tab-2-3 [type="radio"]:checked+div {
	margin-left: 0;
}

.tabs .tab-2-3:last-child [type="radio"]+div {
	margin-left: 200%;
}

.tabs .tab-2-3:last-child [type="radio"]:checked+div {
	margin-left: -200%;
}

.tabs .tab-2-3:nth-child(2) [type="radio"]+div {
	margin-left: 100%;
}

.tabs .tab-2-3:nth-child(2) [type="radio"]:checked+div {
	margin-left: -100%;
}

.tabs .tab-1 [type="radio"]+div {
	width: 200%;
	margin-left: 200%;
}

.tabs .tab-1 [type="radio"]:checked+div {
	margin-left: 0;
}

.tabs .tab-1:last-child [type="radio"]+div {
	margin-left: 100%;
}

.tabs .tab-1:last-child [type="radio"]:checked+div {
	margin-left: -100%;
}

.tabs .tab-4 [type="radio"]+div {
	width: 200%;
	margin-left: 200%;
}

.tabs .tab-4 [type="radio"]:checked+div {
	margin-left: 0;
}

.tabs .tab-4:last-child [type="radio"]+div {
	margin-left: 100%;
}

.tabs .tab-4:last-child [type="radio"]:checked+div {
	margin-left: -100%;
}
</style>
</head>
<body>
	<%@include file="adheader.jsp"%>
	<main>
		<div class="container">
			<section class="mb-5 mt-5">
				<div class="tabs">
					<div class="tab-4">
						<label for="tab4-1">Chỉnh sửa Người dùng</label> <input
							id="tab4-1" name="tabs-4" type="radio" checked="checked">
						<div>
							<div class="row">
								<form class="custom-form search-form"
									action="DashboardServlet/users" method="post" role="form">
									<div class="d-flex justify-content-center">
										<div class="col-6">
											<div class="d-flex row mx-2">
												<p for="formGroupExampleInput" class="form-label">Tên
													đăng nhập</p>
												<input type="text" class="form-control" id="" placeholder=""
													name="id" value="${hehe.id}">
											</div>
										</div>
										<div class="col-6">
											<div class="d-flex row mx-2">
												<p for="formGroupExampleInput" class="form-label">Mật
													khẩu</p>
												<input type="password" class="form-control" readonly
													name="password" value="${hehe.password}">
											</div>
										</div>
									</div>
									<div class="d-flex justify-content-center">
										<div class="col-6">
											<div class="d-flex row mx-2">
												<p for="formGroupExampleInput" class="form-label">Họ tên</p>
												<input type="text" class="form-control" id="" placeholder=""
													name="fullname" value="${hehe.fullname}">
											</div>
										</div>
										<div class="col-6">
											<div class="d-flex row mx-2">
												<p for="formGroupExampleInput" class="form-label">Email</p>
												<input type="email" class="form-control" name="email"
													value="${hehe.email}">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="d-flex justify-content-center">
											<button class="btn custom-border-btn me-2"
												formaction="DashboardServlet/tdnd" formmethod="post">Cập
												nhật</button>
											<button class="btn custom-border-btn me-2"
												formaction="DashboardServlet/xnd" formmethod="post">Xóa
												thông tin</button>
										</div>
									</div>
								</form>
							</div>

						</div>
					</div>


					<div class="tab-4">
						<label for="tab4-2">Danh sách người dùng</label> <input
							id="tab4-2" name="tabs-4" type="radio"
							<c:if test="${selected == true}">checked</c:if>>
						<div>
							<div class="container">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>Tên đăng nhập</th>
											<th>Mật khẩu</th>
											<th>Họ tên</th>
											<th>Email</th>
											<th>Vai trò</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="user" items="${dataList}">
											<tr class="align-middle">
												<td>${user.id}</td>
												<td>${user.password}</td>
												<td>${user.fullname}</td>
												<td>${user.email}</td>
												<td>${user.admin}</td>
												<td>
													<div class="d-flex gap-2">
														<form action="DashboardServlet/change" method="post">
															<input type="hidden" name="id" value="${user.id}">
															<button class="btn custom-border-btn ps-4 pe-4"
																type="submit">Sửa</button>
														</form>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<div>
											<!--         Nút Previous -->
											<%--         <c:if test="${currentPage > 1}"> --%>
											<%--             <a href="DashboardServlet/DataServlet?page=${currentPage - 1}">Previous</a> --%>
											<%--         </c:if> --%>

											<!--         Nút Next -->
											<%--         <c:if test="${currentPage < totalPages}"> --%>
											<%--             <a href="DashboardServlet/DataServlet?page=${currentPage + 1}">Next</a> --%>
											<%--         </c:if> --%>
										</div>
									</tfoot>

								</table>
								<div class="row">
									<div class="d-flex justify-content-center">
										<a class="btn custom-btn me-2"
											href="DashboardServlet/DataServlet?page=${currentPage = 1}">
											<i class="fa-solid fa-backward-step"></i>
										</a>

<%-- 										<c:choose> --%>
<%-- 											<c:when test="${currentPage < 1}"> --%>
<!-- 												<a class="btn custom-btn me-2" -->
<!-- 													href="DashboardServlet/DataServlet?page=1"> <i -->
<!-- 													class="fa-solid fa-backward"></i> -->
<!-- 												</a> -->
<%-- 											</c:when> --%>
<%-- 											<c:when test="${currentPage > 1}"> --%>
<!-- 												<a class="btn custom-btn me-2" -->
<%-- 													href="DashboardServlet/DataServlet?page=${currentPage - 1}"> --%>
<!-- 													<i class="fa-solid fa-backward"></i> -->
<!-- 												</a> -->
<%-- 											</c:when> --%>
<%-- 										</c:choose> --%>

										<c:choose>
											<c:when test="${currentPage > totalPages}">
												<a class="btn custom-btn me-2"
													href="DashboardServlet/DataServlet?page=${currentPage=totalPages}">
													<i class="fa-solid fa-forward"></i>
												</a>
											</c:when>
											<c:when test="${currentPage < totalPages}">
												<a class="btn custom-btn me-2"
													href="DashboardServlet/DataServlet?page=${currentPage + 1}">
													<i class="fa-solid fa-forward"></i>
												</a>
											</c:when>
										</c:choose>

										<%-- 								</c:if> --%>
										<%-- 								<c:if test="${currentPage <= totalPages}"> --%>
										<a class="btn custom-btn me-2"
											href="DashboardServlet/DataServlet?page=${currentPage= totalPages}">
											<i class="fa-solid fa-forward-step"></i>
										</a>
										<%-- 								</c:if> --%>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>
	<%@include file="footer.jsp"%>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/jquery.sticky.js"></script>
	<script src="./js/click-scroll.js"></script>
	<script src="./js/counter.js"></script>
	<script src="./js/custom.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="./js/owl.carousel.min.js"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript" src="./js/bootstrap.js"></script>
	<script type="text/javascript" src="./js/owl.carousel.js"></script>
</head>
<script type="text/javascript" src="./js/script.js"></script>
</body>
</html>
