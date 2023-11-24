<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<base href="/ASM/">
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
</head>
<body id="section_1">
	<%@include file="header.jsp"%>
	<main>
		<section class="news-detail-header-section text-center">
			<div class="section-overlay"></div>

			<div class="container">
				<div class="row">

					<div class="col-lg-12 col-12">
						<h1 class="text-white">List Video Yêu thích</h1>
					</div>
				</div>
			</div>
		</section>

		<section class="section-padding" id="section_5">
			<div class="container">
				<div class="row">

					<div class="col-lg-12 col-12 text-center mb-4">
						<h2>List video dành cho BẠN</h2>
					</div>
					<c:forEach var="pd" items="${favorites}">
						<div class="col-lg-4 col-md-6 col-12 mb-4 mb-lg-0 mt-5">
							<form action="account/index" method="post">
								<div class="custom-block-wrap">
									<img src="images/${pd.poster}"
										class="custom-block-image img-fluid" alt="" style="height: 250px;">
									<div class="custom-block">
										<div class="custom-block-body">
											<h5 class="mb-3">${pd.title}</h5>
											<div class="progress mt-4">
												<div class="progress-bar w-75" role="progressbar"
													aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
											</div>
											<div class="d-flex align-items-center my-2">
												<p class="mb-0">
													<strong>Likes:</strong> 18,500
												</p>
												<p class="ms-auto mb-0">
													<strong>Views:</strong> ${pd.view}
												</p>
											</div>
											<c:choose>
												<c:when test="${not empty sessionScope.user}">
													<c:set var="likeButtonLabel" value="Like" />
													<c:set var="likeButtonUri" value="khac" />
													<c:set var="likeButtonIcon" value="far fa-thumbs-up" />
													<c:forEach var="likedItem" items="${like}">
														<c:choose>
															<c:when
																test="${likedItem.video.id eq pd.id && likedItem.user.id eq sessionScope.user.id}">
																<c:set var="likeButtonLabel" value="Unlike" />
																<c:set var="likeButtonUri" value="list" />
																<c:set var="likeButtonIcon"
																	value="fa-solid fa-thumbs-up" />
															</c:when>
														</c:choose>
													</c:forEach>
													<button class="like-button" type="submit"
														formaction="account/${likeButtonUri.toLowerCase()}"
														formmethod="post" name="id" value="${pd.id}">
														<i class="${likeButtonIcon}"></i> ${likeButtonLabel}
													</button>
												</c:when>
												<c:otherwise>
													<button class="like-button" type="submit" name="id"
														value="${pd.id}" disabled>
														<i class="far fa-thumbs-up"></i> Like
													</button>
												</c:otherwise>
											</c:choose>
											<a class="share-button" data-bs-toggle="modal"
												data-bs-target="#exampleModal" type="button"> <i
												class='fas fa-share'></i>Share
											</a>
										</div>
										<a href="VideoServlet/detail?&id=${pd.id}"
											class="custom-btn btn" name="videoid" value="${pd.id}">Xem
											ngay</a>
									</div>
								</div>
							</form>
						</div>
					</c:forEach>


				</div>
			</div>
		</section>
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Chia sẻ đến
							bạn bè</h5>

						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form class="custom-form share-form mt-3" action="#" method="post"
							role="form">
							<p class="mb-3">Nhập vào email của bạn</p>
							<input type="email" name="subscribe-email" id="subscribe-email"
								pattern="[^ @]*@[^ @]*" class="form-control"
								placeholder="Email Address" required>
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn custom-border-btn">Gửi</button>
					</div>
				</div>
			</div>
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
<script>
	$(document).ready(function() {
		$('#slider .owl-carousel').owlCarousel({
			loop : true,
			margin : 10,
			nav : true,
			items : 1
		})
	});
	$('.owl-carousel').owlCarousel({
		loop : true,
		margin : 20,
		nav : true,
		dots : false,
		responsive : {
			0 : {
				items : 1
			},
			768 : {
				items : 2
			},
			992 : {
				items : 3
			}
		}
	})
	$('#slider .owl-carousel').owlCarousel({
		loop : true,
		margin : 10,
		nav : true,
		navText : [ ">", "<" ],
		items : 1
	})
</script>
</body>


</html>