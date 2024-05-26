<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<section id="content">
	<nav style="justify-content: end;">
		<input type="checkbox" id="switch-mode" hidden>
		<label for="switch-mode" class="switch-mode"></label>
		<p>${not empty userLogined.username ? userLogined.username : 'ADMIN'}</p>
	</nav>
</section>