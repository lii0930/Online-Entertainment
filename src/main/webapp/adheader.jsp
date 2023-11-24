<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-lg bg-light shadow-lg sticky-top">
	<div class="container">
		<a class="navbar-brand" href="account/index"> <img
			src="images/logo.png" class="logo img-fluid"> <span>
				DASHBOARD </span>
		</a>

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ms-auto">
				<li class="nav-item"><a class="nav-link click-scroll"
					href="/ASM/#section1">Trang chủ</a></li>
				<li class="nav-item"><a class="nav-link click-scroll"
					href="DashboardServlet/index">Videos</a></li>
				<li class="nav-item"><a class="nav-link click-scroll"
					href="DashboardServlet/users">Người dùng</a></li>
				<li class="nav-item"><a class="nav-link click-scroll"
					href="DashboardServlet/reports">Báo cáo - Thống kê</a></li>
			</ul>
		</div>
	</div>
</nav>
<div class="modal fade" id="exampleModal1" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Đổi mật khẩu</h5>

				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="custom-form share-form mt-3" action="#" method="post"
					role="form">
					<div class="row">
						<div class="col">
							<input type="text" class="form-control"
								placeholder="Tên đăng nhập" name="username">
						</div>
						<div class="col">
							<input type="text" class="form-control"
								placeholder="Mật khẩu hiện tại" name="password">
						</div>
					</div>
					<div class="row">
						<div class="col">
							<input type="text" class="form-control"
								placeholder="Mật khẩu mới" name="newpassword">
						</div>
						<div class="col">
							<input type="text" class="form-control"
								placeholder="Xác nhận mật khẩu" name="repassword">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn custom-border-btn">Lưu mật
					khẩu</button>
			</div>
		</div>
	</div>
</div>
