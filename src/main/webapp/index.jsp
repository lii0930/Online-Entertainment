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

<link href="https://fonts.googleapis.com/css2?family=Anton&family=Dosis:wght@200&family=Oswald&family=Quicksand:wght@300;400&family=Raleway:wght@200&display=swap"
	rel="stylesheet">

<link href="css/templatemo-kind-heart-charity.css" rel="stylesheet">
</head>
<body id="section_1">
	<%@include file="header.jsp"%>
	<main>
	
		<%@include file="item.jsp"%>
		<%-- 		<%@include file="detail.jsp"%> --%>
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