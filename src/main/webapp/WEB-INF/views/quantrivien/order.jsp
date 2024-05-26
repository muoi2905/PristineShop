<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>User</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/views/quantrivien/layouts/css.jsp"></jsp:include>

</head>

<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- preloader area start -->
	<div id="preloader">
		<div class="loader"></div>
	</div>
	<jsp:include page="/WEB-INF/views/quantrivien/layouts/sidebar.jsp"></jsp:include>
		<!-- sidebar menu area end -->
	<jsp:include page="/WEB-INF/views/quantrivien/layouts/header.jsp"></jsp:include>
	<!-- preloader area end -->
	<!-- page container area start -->
	<div class="page-container">
		<!-- sidebar menu area start -->
		<!-- main content area start -->
		<div class="main-content">
			<!-- header area start -->
		
			<!-- header area end -->
			<!-- page title area start -->
			<!-- page title area end -->
			<form class="content list" action="${base }/admin/order" method="get">
				<!-- Dark table start -->
				<!-- Dark table end -->

				<div class="single-table"
					style="margin: 0px 30px; padding-bottom: 15px">
					<div class="table-responsive">
						<table class="table text-center">
							<thead class="text-uppercase bg-primary">
								<tr class="text-white">
									<th scope="col">ID</th>
									<th scope="col">Mã đơn</th>									
									
									<th scope="col">Khách hàng</th>
									<th scope="col">Điện thoại</th>
									<th scope="col">Email</th>
									<th scope="col">Địa chỉ</th>
									<th scope="col">Trạng thái</th>
									<th scope="col">Lựa chọn</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${orderWithPaging.data}" var="orders"
									varStatus="loop">
									<tr>
										<th scope="row">${loop.index + 1}</th>
										<td>${orders.code }</td>
										
										<td>${orders.customer_name }</td>
										<td>${orders.customer_phone }</td>
										<td>${orders.customer_email }</td>
										<td>${orders.customer_address }</td>
										<c:if test="${orders.orderStatus == 0}"><td>Chờ xử lý</td></c:if>
                                    	<c:if test="${orders.orderStatus == 1}"><td>Đang giao</td></c:if>
                                    	<c:if test="${orders.orderStatus == 2}"><td>Thành công</td></c:if>
                                    	<c:if test="${orders.orderStatus == 3}"><td>Đã hủy</td></c:if>
										<td>
											<c:if test="${orders.orderStatus == 0}">
												<a href="${base}/admin/orders/update-status/${orders.id}">Duyệt</a>
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
				</div>
				<!-- Paging -->
				<div class="row">
					<div class="col-12 d-flex justify-content-center">
						<div id="paging"></div>
					</div>
				</div>
			</form>
		</div>

		<!-- main content area end -->
		<!-- footer area start-->
		<footer>
			<div class="footer-area">
				<p>
					© Copyright 2024. All right reserved. Template by <a
						href="https://colorlib.com/wp/">Colorlib</a>.
				</p>
			</div>
		</footer>
		<!-- footer area end-->
	</div>
	<!-- page container area end -->
	<!-- offset area start -->
	<jsp:include page="/WEB-INF/views/quantrivien/layouts/offset.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/quantrivien/layouts/js.jsp"></jsp:include>
</body>
<script type="text/javascript">

			$( document ).ready(function() {
				
				$("#paging").pagination({
					currentPage: ${orderWithPaging.currentPage},
			        items: ${orderWithPaging.totalItems},
			        itemsOnPage: 5,
			        cssStyle: 'dark-theme',
					prevText: 'Trang trước',
					nextText: 'Trang sau',
			        onPageClick: function(pageNumber, event) {
			        	$('#page').val(pageNumber);
			        	$('#btnSearch').trigger('click');
					},
			    });
			});
</script>

</html>
