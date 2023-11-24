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
			<section class="mb-5 mt-5" id="section1">
				<div class="tabs">
					<div class="tab-2-3">
						<label for="tab2-1">Yêu thích</label> <input id="tab2-1"
							name="tabs-two" type="radio" checked="checked">
						<div>
							<div class="container">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>Tiêu đề video</th>
											<th>Số lượt thích</th>
											<th>Gần đây nhất</th>
											<th>Lần đầu</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${ds}">
											<tr class="align-middle">
												<td>${item.group}</td>
												<td>${item.likes}</td>
												<td>${item.newest}</td>
												<td>${item.oldest}</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
								<div class="row">
									<div class="d-flex justify-content-center">
										<button class="btn custom-btn me-2">
											<i class="fa-solid fa-backward-step"></i>
										</button>
										<button class="btn custom-btn me-2">
											<i class="fa-solid fa-backward"></i>
										</button>
										<button class="btn custom-btn me-2">
											<i class="fa-solid fa-forward"></i>
										</button>
										<button class="btn custom-btn me-2">
											<i class="fa-solid fa-forward-step"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-2-3">
						<label for="tab2-2">Lượt yêu thích</label> <input id="tab2-2"
							name="tabs-two" type="radio">
						<div>
							<div class="container">
								<form action="" method="post">
									<div class="d-flex row justify-content-center mx-1">
										<p class="fs-5">Tiêu đề video</p>
										<select name="year" onchange="this.form.submit();">
											<option selected disabled>Chọn tiêu đề phim</option>
											<c:forEach var="item" items="${ds}">
												<option value="${item.group}"
													${sessionScope.selected eq item.group ? 'selected' : ''}>${item.group}</option>
											</c:forEach>
										</select>

									</div>
									<table class="table table-hover">
										<thead>
											<tr>
												<th>Tên đăng nhập</th>
												<th>Họ tên</th>
												<th>Email</th>
												<th>Ngày thích</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="count" items="${video}">
												<tr class="align-middle">
													<td>${count.username}</td>
													<td>${count.fullname}</td>
													<td>${count.email}</td>
													<td>${count.datelike}</td>
												</tr>
											</c:forEach>



										</tbody>
									</table>
									<div class="row">
										<div class="d-flex justify-content-center">
											<button class="btn custom-btn me-2">
												<i class="fa-solid fa-backward-step"></i>
											</button>
											<button class="btn custom-btn me-2">
												<i class="fa-solid fa-backward"></i>
											</button>
											<button class="btn custom-btn me-2">
												<i class="fa-solid fa-forward"></i>
											</button>
											<button class="btn custom-btn me-2">
												<i class="fa-solid fa-forward-step"></i>
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="tab-2-3">
						<label for="tab2-3">Lượt chia sẻ</label> <input id="tab2-3"
							name="tabs-two" type="radio">
						<div>
							<div class="container">
								<div class="d-flex row justify-content-center mx-1">
									<p class="fs-5">Tiêu đề video</p>
									<select class="form-select mb-3"
										aria-label="Default select example">
										<option selected>Open this select menu</option>
										<option value="1">One</option>
										<option value="2">Two</option>
										<option value="3">Three</option>
									</select>
								</div>
								<table class="table table-striped table-hover">
									<thead>
										<tr>
											<th>Tiêu đề video</th>
											<th>Số lượt thích</th>
											<th>Gần đây nhất</th>
											<th>Lần đầu</th>
										</tr>
									</thead>
									<tbody>
										<tr class="align-middle">
											<td>Cinnamon girl - Lanna Del Grey</td>
											<td>388</td>
											<td>17/07/2023</td>
											<td>10/07/2023</td>
										</tr>

										<tr class="align-middle">
											<td>Cinnamon girl - Lanna Del Grey</td>
											<td>388</td>
											<td>17/07/2023</td>
											<td>10/07/2023</td>
										</tr>

										<tr class="align-middle">
											<td>Cinnamon girl - Lanna Del Grey</td>
											<td>388</td>
											<td>17/07/2023</td>
											<td>10/07/2023</td>
										</tr>
									</tbody>
								</table>
								<div class="row">
									<div class="d-flex justify-content-center">
										<button class="btn custom-btn me-2">
											<i class="fa-solid fa-backward-step"></i>
										</button>
										<button class="btn custom-btn me-2">
											<i class="fa-solid fa-backward"></i>
										</button>
										<button class="btn custom-btn me-2">
											<i class="fa-solid fa-forward"></i>
										</button>
										<button class="btn custom-btn me-2">
											<i class="fa-solid fa-forward-step"></i>
										</button>
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