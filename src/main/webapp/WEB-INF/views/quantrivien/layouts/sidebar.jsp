<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<section id="sidebar">
	<a href="#" class="brand">
		<i class='bx bxs-smile'></i>
		<span class="text">Admin</span>
	</a>
	<ul class="side-menu top">
		<li class="active">
			<a href="${base }/admin">
				<i class='bx bxs-dashboard' ></i>
				<span class="text">Trang chủ</span>
			</a>
		</li>
		<li>
			<a href="${base }/admin/user">
				<i class='bx bxs-shopping-bag-alt' ></i>
				<span class="text">Tài khoản quản trị</span>
			</a>
		</li>
		<li>
			<a href="${base }/admin/order">
				<i class='bx bxs-doughnut-chart' ></i>
				<span class="text">Đơn hàng</span>
			</a>
		</li>
		<li>
			<a href="${base }/admin/product">
				<i class='bx bxs-message-dots' ></i>
				<span class="text">Sản phẩm / Danh mục</span>
			</a>
		</li>
		<li>
			<a href="${base }/admin/contact">
				<i class='bx bxs-group' ></i>
				<span class="text">Liên hệ</span>
			</a>
		</li>
		<li>
			<a href="${base }/admin/subscribe">
				<i class='bx bxs-cog' ></i>
				<span class="text">Đăng ký</span>
			</a>
		</li>
		<li>
			<a href="${base }/logout" class="logout">
				<i class='bx bxs-log-out-circle' ></i>
				<span class="text">Logout</span>
			</a>
		</li>
	</ul>
</section>