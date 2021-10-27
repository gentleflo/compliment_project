<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header>
	<div class="d-flex align-items-end justify-content-between mt-3">
		<div class="d-flex align-items-end">
			<img src="/static/image/award_icon_22.png" width="45px" class="header-img mt-3 ml-4" alt="상단 칭찬 아이콘">
			<div class="header-slogan ml-1">give compliments on yourself!</div>
		</div>
		<c:if test="${not empty userName }" >
			<div>
				<i class="bi bi-brightness-alt-high-fill mr-1"></i><small><b>${userName }</b> 님
				<a href="/user/sign_out" class="ml-1 mr-3 text-info"><b>[로그아웃]</b></a></small>
			</div>
		</c:if>
	</div>
</header>