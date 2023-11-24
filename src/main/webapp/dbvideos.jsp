<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<section class="mb-5 mt-5" id="section3">
	<div class="tabs">
		<div class="tab-1">
			<label for="tab1-1">Video Edition</label> <input id="tab1-1"
				name="tabs-1" type="radio" checked="checked">
			<div>
				<c:url var="url" value="DashboardServlet" />
				<form action="${url}/index" method="post"
					enctype="multipart/form-data">
					<div class="row">
						<div class="col-lg-6 col-12">
							<div class="news-block">
								<div class="news-block-top">
									<div class="mt-3">
										<c:choose>
											<c:when test="${not empty form.poster}">
												<img class="ms-5" alt="" src="images/${form.poster}"
													style="height: 300px; width: 80%;">
												<input class="form-control mt-3" type="file" id="formFile"
													name="poster" value="${form.poster}">
											</c:when>
											<c:otherwise>
												<input class="form-control" type="file" id="formFile"
													name="poster" value="${form.poster}">
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								<div class="news-block-info">
									<div class="custom-form comment-form mt-4">
										<h6 class="mb-3">Mô tả video</h6>
										<textarea name="description" rows="4" cols="100"
											class="form-control">${form.description}</textarea>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-6 col-12 mt-0">
							<div class="custom-form search-form">
								<div class="d-flex row">
									<p for="formGroupExampleInput" class="form-label">Video ID</p>
									<input type="text" class="form-control" name="id"
										value="${form.id}" ${not empty form.id ? 'readonly' : ''}>

								</div>

								<div class="d-flex row">
									<p for="formGroupExampleInput" class="form-label">Tiêu đề
										video</p>
									<input type="text" class="form-control" name="title"
										value="${form.title}">
								</div>

								<div class="d-flex row">
									<p for="formGroupExampleInput" class="form-label">Lượt view</p>
									<input type="number" class="form-control" name="view" disabled
										value="${form.view}" readonly>
								</div>
								<div class="d-flex">
									<div
										class="col-lg-6 col-6 mb-5 form-check-group form-check-group-donation-frequency">
										<div class="form-check form-check-radio">
											<input class="form-check-input" type="radio" name="active"
												value="true"
												<c:if test="${form.active == true}"> checked </c:if> checked>
											<label class="form-check-label"> Đang hoạt động </label>
										</div>
									</div>

									<div
										class="col-lg-6 col-6 mb-5 form-check-group form-check-group-donation-frequency">
										<div class="form-check form-check-radio">
											<input class="form-check-input" type="radio" name="active"
												value="false"
												<c:if test="${form.active == false}"> checked </c:if>>
											<label class="form-check-label"> Dừng hoạt động </label>
										</div>
									</div>

								</div>
								<div class="d-flex row">
									<div class="d-flex">
										<button class="btn custom-border-btn me-2"
											formaction="${url}/add" formmethod="post">Thêm video</button>
										<button class="btn custom-border-btn me-2"formaction="${url}/delete" formmethod="post">Xóa video</button>
										<button class="btn custom-border-btn me-2"
											formaction="${url}/update" formmethod="post">Cập
											nhật</button>
										<button class="btn custom-border-btn me-2"
											formaction="${url}/index" formmethod="post">Reset</button>
									</div>
								</div>
							</div>
						</div>
					</div>

					<p>${msg}</p>

				</form>
			</div>
		</div>

		<div class="tab-1">
			<label for="tab1-2">Danh sách Video</label> <input id="tab1-2"
				name="tabs-1" type="radio">
			<div>
				<div class="container">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Poster</th>
								<th>Mã Phim</th>
								<th>Tên Phim</th>
								<th>Trạng Thái</th>
								<th>Lượt xem</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="pd" items="${vd}">
								<tr class="align-middle">
									<td><img src="/ASM/images/${pd.poster}" width="150px"
										class="img-fluid" alt=""></td>
									<td>${pd.id}</td>
									<td>${pd.title}</td>
									<td><c:choose>
											<c:when test="${pd.active == true}">
                                        Hoạt động
                                    </c:when>
											<c:otherwise>
                                        Dừng hoạt động
                                    </c:otherwise>
										</c:choose></td>
									<td>${pd.view}</td>
									<td>
										<form action="DashboardServlet/edit" method="post">
											<div class="d-flex gap-2">
												<input type="hidden" name="id" value="${pd.id}">
												<button class="btn custom-border-btn ps-4 pe-4"
													type="submit">Sửa</button>
											</div>
										</form>
									</td>
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

	</div>
</section>
