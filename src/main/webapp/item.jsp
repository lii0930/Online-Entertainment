
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="slide.jsp"%>
<%@include file="category.jsp"%>
<section class="section-padding" id="section_3">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-12 text-center mb-4">
				<h2>Video nổi bật</h2>
			</div>
			<c:url var="url" value="VideoServlet/" />
			<div id="slider">
				<div class="owl-carousel owl-theme">
					<c:forEach var="pd" items="${vd}">
						<c:if test="${pd.active==true}">
							<form action="" method="post">
								<div class="item">
									<div class="">
										<div class="custom-block-wrap">
											<img src="images/${pd.poster}"
												class="custom-block-image img-fluid" alt=""
												style="height: 250px;">
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
															<c:set var="likeButtonUri" value="like" />
															<c:set var="likeButtonIcon" value="far fa-thumbs-up" />
															<c:forEach var="likedItem" items="${like}">
																<c:choose>
																	<c:when
																		test="${likedItem.video.id eq pd.id && likedItem.user.id eq sessionScope.user.id}">
																		<c:set var="likeButtonLabel" value="Unlike" />
																		<c:set var="likeButtonUri" value="un" />
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
																value="${pd.id}">
																<i class="far fa-thumbs-up"></i> Like
															</button>
														</c:otherwise>
													</c:choose>

													<a class="share-button" data-bs-toggle="modal"
														data-bs-target="#exampleModal"
														href="#exampleModal?&videoId=${pd.id}" value="${pd.id}" name= "videoId" onclick="" type="button"> <i
														class='fas fa-share'></i> Share
													</a>


												</div>
												<a href="VideoServlet/detail?&id=${pd.id}"
													class="custom-btn btn" name="videoid" value="${pd.id}">Xem
													ngay</a>
											</div>
										</div>
									</div>
								</div>
							</form>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Chia sẻ đến bạn
					bè</h5>

				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form class="custom-form share-form mt-3" action="#" method="post">
				<input type="hidden" name="videoId" value="${param.videoId}">
				<div class="modal-body">
					<p class="mb-3">Nhập vào email của bạn</p>
					<input type="email" name="email" id="subscribe-email"
						pattern="[^ @]*@[^ @]*" class="form-control"
						placeholder="Email Address" required>
				</div>
				<div class="modal-footer">
						<input class="btn custom-border-btn float-end" type="submit" value="Gửi" formaction="account/chiase" formmethod="post">
					</div>
			</form>
		</div>
	</div>
</div>

</div>
