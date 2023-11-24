<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<section class="news-section mt-5">
	<div class="container">
		<div class="row">
			<div class="col-lg-7 col-12">
				<div class="news-block">
					<div class="news-block-top">
						<iframe src="https://www.youtube.com/embed/${pr.id}"
							class="w-100" height="400px" controls autoplay muted></iframe>
					</div>
					<div class="news-block-info">
						<!-- <div class="row"> -->
						<div class="d-flex mt-2">
							<div class="news-block-date">
								<p>
									<i class="bi-calendar custom-icon me-1"></i> October 12, 2036
								</p>
							</div>
							<div class="news-block-author mx-5">
								<p>
									<i class="far fa-eye"></i> ${pr.view}
								</p>
							</div>
							<div class="news-block-comment">
								<a class=""> <i class="fa-regular fa-thumbs-up"></i>
									Like
								</a>
							</div>
							<div class="news-block-like mx-5">
								<a href="#" class="" data-bs-toggle="modal"
									data-bs-target="#exampleModal"> <i class="fas fa-share"></i>
									Share
								</a>
							</div>
						</div>
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Chia sẻ
											đến bạn bè</h5>

										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form class="custom-form share-form mt-3" action="#"
											method="post" role="form">
											<p class="mb-3">Nhập vào email của bạn</p>
											<input type="email" name="subscribe-email"
												id="subscribe-email" pattern="[^ @]*@[^ @]*"
												class="form-control" placeholder="Email Address" required>
										</form>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn custom-border-btn">Gửi</button>
									</div>
								</div>
							</div>
						</div>
						<div class="news-block-title mb-2">
							<h4>${pr.title}</h4>
						</div>
						<div class="news-block-body">
							<p>
								<strong>Lorem Ipsum</strong> ${pr.description}
							</p>

							<p>
								<strong>Sed leo</strong> nisl, This is a Bootstrap 5.2.2 CSS
								template for charity organization websites. You can feel free to
								use it. Please tell your friends about TemplateMo website. Thank
								you.
							</p>
						</div>


						<h6>Bình luận</h6>
						<hr>
						<div class="author-comment d-flex mt-3 mb-4">
							<img
								src="images/avatar/studio-portrait-emotional-happy-funny.jpg"
								class="img-fluid avatar-image" alt="">

							<div class="author-comment-info ms-3">
								<h6 class="mb-1">Jack</h6>

								<p class="mb-0">Kind Heart Charity is the most supportive
									organization. This is Bootstrap 5 HTML CSS template for
									everyone. Thank you.</p>

								<div class="d-flex mt-2">
									<a href="#" class="author-comment-link me-3">Like</a> <a
										href="#" class="author-comment-link">Reply</a>
								</div>
							</div>
						</div>

						<div class="author-comment d-flex ms-5 ps-3">
							<img
								src="images/avatar/pretty-blonde-woman-wearing-white-t-shirt.jpg"
								class="img-fluid avatar-image" alt="">

							<div class="author-comment-info ms-3">
								<h6 class="mb-1">Daisy</h6>

								<p class="mb-0">Sed leo nisl, posuere at molestie ac,
									suscipit auctor mauris. Etiam quis metus elementum, tempor
									risus vel, condimentum orci</p>

								<div class="d-flex mt-2">
									<a href="#" class="author-comment-link me-3">Like</a> <a
										href="#" class="author-comment-link">Reply</a>
								</div>
							</div>
						</div>

						<div class="author-comment d-flex mt-3 mb-4">
							<img src="images/avatar/portrait-young-redhead-bearded-male.jpg"
								class="img-fluid avatar-image" alt="">

							<div class="author-comment-info ms-3">
								<h6 class="mb-1">Wilson</h6>

								<p class="mb-0">Lorem Ipsum dolor sit amet, consectetur
									adipsicing kengan omeg kohm tokito Professional charity theme
									based on Bootstrap</p>

								<div class="d-flex mt-2">
									<a href="#" class="author-comment-link me-3">Like</a> <a
										href="#" class="author-comment-link">Reply</a>
								</div>
							</div>
						</div>

						<form class="custom-form comment-form mt-4" action="#"
							method="post" role="form">
							<h6 class="mb-3">Write a comment</h6>

							<textarea name="comment-message" rows="4" class="form-control"
								id="comment-message" placeholder="Your comment here"></textarea>

							<div class="col-lg-3 col-md-4 col-6 ms-auto">
								<button type="submit" class="form-control">Comment</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-12 mx-auto mt-0">
				<form class="custom-form search-form" action="#" method="post"
					role="form">
					<input class="form-control" type="search" placeholder="Search"
						aria-label="Search">

					<button type="submit" class="form-control">
						<i class="bi-search"></i>
					</button>
				</form>

				<h5 class="mt-5 mb-3">Video gần đây</h5>
				<c:forEach var="vi" items="${videos}">
				<div class="news-block news-block-two-col d-flex mt-4">
					<div class="news-block-two-col-image-wrap">
						<a href="VideoServlet/detail?&id=${vi.id}"> <img
							src="images/${vi.poster}" class="news-image img-fluid"
							alt="">
						</a>
					</div>

					<div class="news-block-two-col-info">
						<div class="news-block-title mb-2">
							<h6>
								<a href="VideoServlet/detail?&id=${vi.id}" class="news-block-title-link">${vi.title}</a>
							</h6>
						</div>

						<div class="news-block-date">
							<!-- <div class="news-block-author mx-5"> -->
							<p>
								<i class="far fa-eye"></i> ${vi.view}
							</p>
							<!-- </div> -->
						</div>
					</div>
				</div>
				</c:forEach>


				<div class="tags-block mt-5">
					<h5 class="mb-3">Tags</h5>

					<a href="#" class="tags-block-link"> Âm nhạc </a> <a href="#"
						class="tags-block-link"> Lanna Del Grey </a> <a href="#"
						class="tags-block-link"> Indie </a> <a href="#"
						class="tags-block-link"> Vape </a> <a href="#"
						class="tags-block-link"> Creeping </a> <a href="#"
						class="tags-block-link"> Nhạc Ballad </a> <a href="#"
						class="tags-block-link"> Chữa lành </a>
				</div>
			</div>

		</div>
	</div>
</section>