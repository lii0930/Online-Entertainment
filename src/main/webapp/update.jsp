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
		 <main style="display: flex;
  align-items: center;
  justify-content: center;
  min-height: 80vh;
  padding: 10px;
  font-family: 'Poppins', sans-serif;
  background: linear-gradient(115deg, #56d8e4 10%,#5bc1ac 90%);">
        <div class="container2">
            <div class="text">
                Cập nhật thông tin
            </div>
            <c:url var="url" value="account"/>
            <form method="post">
                <div class="form-row">
                    <div class="input-data">
                        <input type="text" required name="fullname"  value="${user.fullname}">
                        <div class="underline"></div>
                        <label for="">Họ tên</label>
                    </div>
                    <div class="input-data">
                        <input type="text" required name="id" value="${user.id}">
                        <div class="underline"></div>
                        <label for="">Tên đăng nhập</label>
                    </div>
                </div>
                <div class="form-row">
                    <div class="input-data">
                        <input type="email" required name="email" pattern="[^ @]*@[^ @]*" value="${user.email}">
                        <div class="underline"></div>
                        <label for="">Email</label>
                    </div>
                    <div class="input-data">
                        <input type="password" disabled name="password" class="bg-white"  value="${user.password}">
                        <div class="underline"></div>
                        <label for="">Mật khẩu</label>
                    </div>
                </div>
                <div class="row">
                    <div class="d-flex justify-content-center pb-5 pt-4">
                        <button class="btn custom-border-btn ps-5 pe-5 " formaction="${url}/edit-profile" formmethod="post">Cập nhật</button>
                    </div>
                </div>
                <mark>${msg}</mark>
            </form>
        </div>

    </main>
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