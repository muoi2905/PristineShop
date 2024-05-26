<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!--import JSTL-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- import SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Giới thiệu</title>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<jsp:include page="/WEB-INF/views/khachhang/layouts/css.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${base}/css/introduction.css">

</head>
<body>
	<main class="container">

		<div class="free">Miễn phí vận chuyển với đơn hàng trên 1000k</div>
		<!--open header-->
		<jsp:include page="/WEB-INF/views/khachhang/layouts/header.jsp"></jsp:include>
		<!--close header-->

		<div class="navigation">
			<ul>
				<li><a href="${base }/home">Trang chủ </a></li>

				<li>/</li>

				<li>Giới thiệu</li>

				
			</ul>
		</div>
		<!-- open content -->
		<div class="content">
			<div class="content-title">
				<h4>Danh mục trang</h4>
				<div class="layer">
					<ul>
						<li><a href="#">Tìm kiếm</a></li>
						<li><a href="${base }/introduction">Giới thiệu</a></li>
						<li><a href="#">Chính sách đổi trả</a></li>
						<li><a href="#">Chính sách bảo mật</a></li>
						<li><a href="#">Điều khoản dịch vụ</a></li>
					</ul>
				</div>
			</div>
			<div class="content-intro">
				<h3>Lời giới thiệu</h3>
				<div class="about-us">
					<p>PRISTINE là thương hiệu được thành lập từ
						25/03/2024.</p>

					<p>Chào mừng đến với Pristine - điểm đến lý tưởng cho những người yêu thích và tìm kiếm những món trang sức tinh tế và sang trọng. Pristine không chỉ là một trang web bán hàng, mà còn là một điểm đến tinh tế và đầy sức hút cho những người đam mê thời trang.</p>

					<p>Với một bộ sưu tập đa dạng các loại trang sức, từ nhẫn đính đá lấp lánh, dây chuyền thanh lịch, đến bông tai tinh tế và vòng cổ quyến rũ, Pristine cung cấp một loạt các sản phẩm độc đáo được thiết kế với tinh thần sáng tạo và tinh tế.</p>

					<p>Sứ mệnh của chúng tôi là mang lại trải nghiệm mua sắm trực tuyến hoàn hảo, nơi mọi khách hàng đều có thể tìm thấy những món trang sức phản ánh phong cách và cá tính riêng của mình. Chúng tôi cam kết mang đến sự hài lòng cao nhất cho khách hàng thông qua chất lượng sản phẩm, dịch vụ chăm sóc khách hàng tận tâm và trải nghiệm mua sắm trực tuyến thuận tiện và an toàn.</p>

					<p>Hãy khám phá bộ sưu tập độc đáo của chúng tôi và tạo ra phong cách riêng của bạn với Pristine - nơi nâng tầm vẻ đẹp và phong cách của bạn!</p>
				</div>
			</div>
		</div>
		<!--close content-->

		<!--open footer -->
		<jsp:include page="/WEB-INF/views/khachhang/layouts/footer.jsp"></jsp:include>
		<!--close footer-->
		<div class="copyright">
			Copyright <i class="far fa-copyright"></i> <a href="#">pristine.</a> <a
				href="#">Powered by Haravan</a>
		</div>
	</main>
</body>

<jsp:include page="/WEB-INF/views/khachhang/layouts/js.jsp"></jsp:include>
<script type="text/javascript">
	
</script>
</html>