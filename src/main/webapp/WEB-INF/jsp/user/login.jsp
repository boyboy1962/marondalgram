<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="contents d-flex">
	<div class="col-3"></div>
	<div class="col-6">
		<h1 class="mt-3">로그인</h1>
		<form method="POST" action="/servlet/quiz10" class="center-box p-5">
			<div class="input-group w-100 mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">ID</span>
				</div>
				<input type="text" class="form-control" id="id" name="id"
					placeholder="Username">
			</div>
			<div class="input-group w-100 mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">PW</span>
				</div>
				<input type="password" class="form-control" id="pw" name="pw"
					placeholder="····">
			</div>
			<div class="d-flex">
				<a href="/user/sign_up_view" class="btn btn-secondary mr-3 w-50">회원가입</a>
				<button type="button" class="btn btn-primary ml-3 w-50">로그인</button>
			</div>
		</form>
	</div>
	<div class="col-3"></div>
</div>
