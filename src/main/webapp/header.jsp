<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-lg bg-light shadow-lg sticky-top">
	<div class="container">
		<a class="navbar-brand" href="account/index"> <img
			src="images/logo.png" class="logo img-fluid"> <span>
				Online Entertainment </span>
		</a>

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ms-auto">
			<c:choose>
				<c:when test="${sessionScope.user.admin==false}">
					<li class="nav-item"><a class="nav-link click-scroll"
					href="account/index">Trang chủ</a></li>
				<li class="nav-item"><a class="nav-link click-scroll"
					href="account/yeuthich">List yêu thích</a>
				<li class="nav-item dropdown"><a
					class="nav-link click-scroll dropdown-toggle text-decoration-none"
					href="#section_3" id="navbarLightDropdownMenuLink" role="button"
					data-bs-toggle="dropdown">Tài khoản</a>
					<ul class="dropdown-menu dropdown-menu-light text-decoration-none">
						<li><a class="dropdown-item" href="DashboardServlet/index">Dashboard</a></li>
						<li><a class="dropdown-item" href="update.jsp">Cập nhật</a></li>
						<li><a class="dropdown-item" href="#" data-bs-toggle="modal"
							data-bs-target="#exampleModal1">Đổi mật khẩu</a></li>
						<li><a class="dropdown-item" href="account/sign-out">Đăng xuất</a></li>
						<li><a class="dropdown-item disabled"></a></li>

					</ul></li>
				</c:when>
				<c:when test="${sessionScope.user.admin==true}">
					<li class="nav-item"><a class="nav-link click-scroll"
					href="index.jsp">Trang chủ</a></li>
				<li class="nav-item"><a class="nav-link click-scroll"
					href="account/yeuthich">List yêu thích</a>
				<li class="nav-item dropdown"><a
					class="nav-link click-scroll dropdown-toggle text-decoration-none"
					href="#section_3" id="navbarLightDropdownMenuLink" role="button"
					data-bs-toggle="dropdown">Tài khoản</a>
					<ul class="dropdown-menu dropdown-menu-light text-decoration-none">
						<li><a class="dropdown-item" href="update.jsp">Cập nhật</a></li>
						<li><a class="dropdown-item" href="#" data-bs-toggle="modal"
							data-bs-target="#exampleModal1">Đổi mật khẩu</a></li>
						<li><a class="dropdown-item" href="account/sign-out">Đăng xuất</a></li>
						<li><a class="dropdown-item disabled"></a></li>

					</ul></li>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a class="nav-link click-scroll"
					href="index.jsp">Trang chủ</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link click-scroll dropdown-toggle text-decoration-none"
					href="#section_3" id="navbarLightDropdownMenuLink" role="button"
					data-bs-toggle="dropdown">Tài khoản</a>

					<ul class="dropdown-menu dropdown-menu-light text-decoration-none">
						<li><a class="dropdown-item" href="login.jsp">Đăng nhập</a></li>
						<li><a class="dropdown-item" href="signup.jsp">Đăng ký</a></li>
						<li><a class="dropdown-item" href="#" data-bs-toggle="modal"
							data-bs-target="#exampleModal1">Đổi mật khẩu</a></li>
						<li><a class="dropdown-item" href="update.jsp">Cập
								nhật</a></li>
						<li><a class="dropdown-item disabled"></a></li>

					</ul></li>
				</c:otherwise>
			</c:choose>
				
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
				<form action="ExampleServlet" class="custom-form share-form mt-3" method="POST"
					role="form">
					<div class="row">
						<div class="col">
							<input type="text" class="form-control" placeholder="Tên đăng nhập"
								name="id">
						</div>
						<div class="col">
							<input type="password" class="form-control" placeholder="Mật khẩu hiện tại"
								name="password">
						</div>
					</div>
					<div class="row">
						<div class="col">
							<input type="password" class="form-control" placeholder="Mật khẩu mới"
								name="newpassword">
						</div>
						<div class="col">
							<input type="password" class="form-control" placeholder="Xác nhận mật khẩu"
								name="renew">
						</div>
					</div>
					<input class="btn custom-border-btn float-end" type="submit" value="Lưu mật khẩu" formaction="account/change-password" formmethod="post">
				</form>
			</div>
			<%-- <c:url var="url" value="account"/>
			<div class="modal-footer">
				<a class="btn custom-border-btn" type="submit" formmethod="post">Lưu mật khẩu</a>
			</div> --%>
		</div>
	</div>
</div>