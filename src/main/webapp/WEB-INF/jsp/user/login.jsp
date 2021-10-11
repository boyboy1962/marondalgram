<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="contents d-flex">
	<div class="col-3"></div>
	<div class="col-6">
		<h1 class="mt-3">로그인</h1>
		<form id="loginForm" method="POST" action="/user/sign_in" class="center-box p-5">
			<div class="input-group w-100 mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">ID</span>
				</div>
				<input type="text" class="form-control" id="id" name="loginId"
					placeholder="Username">
			</div>
			<div class="input-group w-100 mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">PW</span>
				</div>
				<input type="password" class="form-control" id="pw" name="password"
					placeholder="····">
			</div>
			<div class="d-flex">
				<a href="/user/sign_up_view" class="btn btn-secondary mr-3 w-50">회원가입</a>
				<button type="submit" class="btn btn-primary ml-3 w-50">로그인</button>
			</div>
		</form>
	</div>
	<div class="col-3"></div>
</div>

<script>
	$(document).ready(function(e){
		$('#loginForm').submit(function(e){
			e.preventDefault();
			
			// validation
			let loginId = $("#id").val().trim();
			if (loginId == ''){
				alert("아이디를 입력해주세요.");
				return false;
			}
			
			let password = $("#pw").val();
			if (password == ''){
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			
			let url = $('#loginForm').attr('action');
			let data = $('#loginForm').serialize();
			console.log("url: " + url);
			console.log("data: " + data);
			
			$.post(url, data)
			.done(function(data){
				if (data.result == 'success') {
					location.href = "/post/post_timeline_view";
				} else {
					alert("입력하신 아이디 혹은 비밀번호가 맞지 않습니다.");
				}
			})
		});
		
	})
</script>
