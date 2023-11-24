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
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script>
  
        <link rel="stylesheet" href="css/fontAwesome.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
		 <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <a class="navbar-brand" href="index.html">
                <div class="d-flex justify-content-center ms-5 mt-5">
                    <img src="images/logo.png"
                        alt="" width="25%">
                </div>
                <div class="d-flex justify-content-center ms-5 mt-3">
                    <span class="hi">ONLINE ENTERTAINMENT</span>
                </div>
            </a>
            <c:url var="url" value="account"/>
        <form class="ms-4">
                    <div class="form-outline mb-4">
                        <label class="form-label" for="form2Example1">Họ tên</label>
                        <input type="text" id="form2Example1" class="form-control rounded" placeholder="Họ tên..." name="fullname"  value="${form.fullname}"/>
                    </div>

                    <div class="form-outline mb-4">
                        <label class="form-label" for="form2Example1">Email</label>
                        <input type="email" id="form2Example1" class="form-control rounded" placeholder="Email..." name="email"pattern="[^ @]*@[^ @]*" value="${form.email}"/>
                    </div>

                    <div class="form-outline mb-4">
                        <label class="form-label" for="form2Example1">Tên đăng nhập</label>
                        <input type="text" id="form2Example1" class="form-control rounded" placeholder="Tên đăng nhập..." name="id"  value="${form.id}"/>
                    </div>

                    <div class="form-outline mb-4">
                        <label class="form-label" for="form2Example2">Mật khẩu</label>
                        <input type="password" id="form2Example2" class="form-control rounded"
                            placeholder="Mật khẩu..." name="password" value="${form.password}"/>
                    </div>
                    <button type="submit" class="col-12 btn custom-border-btn mb-4" formaction="${url}/sign-up" formmethod="post">Đăng ký</button>
                    <div class="text-center">
                        <p>Bạn đã có tài khoản? <a href="login.jsp"
                                class="text-decoration-none fw-bold">Đăng nhập TẠI ĐÂY</a></p>
                        <p>hoặc đăng nhập với: </p>
                        <button type="button" class="btn social-icon-item custom-border-btn mb-3">
                            <i class="fab fa-facebook-f"></i>
                        </button>

                        <button type="button" class="btn social-icon-item custom-border-btn mb-3">
                            <i class="fab fa-google"></i>
                        </button>

                        <button type="button" class="btn social-icon-item custom-border-btn mb-3">
                            <i class="fa-brands fa-instagram"></i>
                        </button>
                    </div>
                </form>
            </div>

            <div class="col-md-8">
                <div id="carouselExampleAutoplaying" class="carousel slide mt-5 mb-5" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="images/slide/inter.jpg" class="d-block w-100" alt="" width="100%">
                        </div>
                        <div class="carousel-item">
                            <img src="images/slide/cloud.jpg" class="d-block w-100" alt="" width="100%">
                        </div>
                        <div class="carousel-item">
                            <img src="images/slide/max.jpg" class="d-block w-100" alt="" width="100%">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying"
                        data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying"
                        data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
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
  
</body>


</html>