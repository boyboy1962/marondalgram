<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="contents d-flex">
	<div class="col-2"></div>
	<div class="col-8">
		<h1 class="mt-3">회원 가입</h1>
		<div class="center-box p-3">
			<form id="signUpForm" method="post" action="/user/sign_up">
				<!-- 아이디 입력 구간 -->
				<div class="d-flex">
					<div class="input-group col-9">
						<div class="input-group-prepend">
							<span class="input-group-text">아이디</span>
						</div>
						<input type="text" class="form-control" id="loginId" name="loginId"
							placeholder="아이디 입력">
					</div>
					<button type="button" id="loginIdCheckBtn" class="btn btn-success">중복확인</button>
				</div>
				
				<!-- 아이디 체그 결과 -->
				<div class="ml-3 mb-3">
					<div id="checkId" class="small">아이디 중복확인을 해주세요.</div>
					<div id="idCheckLength" class="small text-danger d-none">ID를 4자 이상 입력해주세요.</div>
					<div id="idCheckDuplicated" class="small text-danger d-none">이미 사용중인 ID입니다.</div>
					<div id="idCheckOk" class="small text-success d-none">사용 가능한 ID 입니다.</div>
				</div>
				
				
				<!-- 비밀번호 입력 구간 -->
				<div class="d-flex mb-3">
					<div class="input-group col-11">
						<div class="input-group-prepend">
							<span class="input-group-text">비밀번호</span>
						</div>
						<input type="password" class="form-control" id="password" name="password"
							placeholder="비밀번호 입력">
					</div>
				</div>
				
				
				<!-- 비번확인 입력 구간 -->
				<div class="d-flex mb-3">
					<div class="input-group col-11">
						<div class="input-group-prepend">
							<span class="input-group-text">비번확인</span>
						</div>
						<input type="password" class="form-control" id="passwordConfirm" name="passwordConfirm"
							placeholder="비밀번호 확인">
					</div>
				</div>
				
				
				<!-- 이름 입력 구간 -->
				<div class="d-flex mb-3">
					<div class="input-group col-11">
						<div class="input-group-prepend">
							<span class="input-group-text">유저이름</span>
						</div>
						<input type="text" class="form-control" id="name" name="name"
							placeholder="사용자 이름 입력">
					</div>
				</div>
				
				
				<!-- 이메일 입력 구간 -->
				<div class="d-flex mb-3">
					<div class="input-group col-11">
						<div class="input-group-prepend">
							<span class="input-group-text">웹이메일</span>
						</div>
						<input type="text" class="form-control" id="email" name="email"
							placeholder="이메일 주소 입력">
					</div>
				</div>
				
				<div class="d-flex justify-content-center">
					<button type="button" id="signUpBtn" class="btn btn-info">가입하기</button>
				</div>
			</form>
		</div>
	</div>
	<div class="col-2"></div>
</div>

<script>
	$(document).ready(function(){
		// 아이디 중복확인
		$('#loginIdCheckBtn').on('click', function(e){
			let loginId = $('#loginId').val().trim();
			
			// alert(loginId); 확인 완료
			// "checkId" "idCheckLength" "idCheckDuplicated" "idCheckOk"
			if (loginId.length < 4) {
				$('#checkId').addClass('d-none');
				$('#idCheckLength').removeClass('d-none'); // 경고문구 노출
				$('#idCheckDuplicated').addClass('d-none'); // 숨김
				$('#idCheckOk').addClass('d-none'); // 숨김
				return;
			}
			
			// ajax 서버 호출(중복여부)
			$.ajax({
				type:'post'
				, url: '/user/is_duplicated_id'
				, data: {'loginId':loginId}
				, success: function(data){
					
					if (data.result) {
						// 중복이다.
						$('#checkId').addClass('d-none');
						$('#idCheckLength').addClass('d-none');
						$('#idCheckDuplicated').removeClass('d-none'); // 경고문구 노출
						$('#idCheckOk').addClass('d-none'); 
					} else {
						// 가능하다. 	
						$('#checkId').addClass('d-none');
						$('#idCheckLength').addClass('d-none'); 
						$('#idCheckDuplicated').addClass('d-none'); 
						$('#idCheckOk').removeClass('d-none'); // 경고?문구 노출
						signUpForm.loginId.readOnly = true; // 아이디를 바꾸지 못하게 만듬(하하 이제는 고정이란다.)
					}
				}
				, error: function(e){
					alert("아이디 중복확인에 실패했습니다. 관리자에게 문의해주세요.")
				}
			});
		});
		
		
		$('#signUpBtn').on('click', function(e){
			let loginId = $('#loginId').val().trim();
			
			if(loginId == ''){
				alert ('아이디를 입력하세요.');
				return;
			}
			
			let password = $('#password').val();
			let passwordConfirm = $('#passwordConfirm').val();
			
			if(password == '' || passwordConfirm == ''){
				alert ('비밀번호를 입력하세요.');
				return;
			}
			
			if(password != passwordConfirm){
				alert ('비밀번호가 일치하지 않습니다.');
				$('#password').val("");
				$('#passwordConfirm').val("");
				return;
			}
			
			
			let name = $('#name').val().trim();
			
			if(name == ''){
				alert ('이름을 입력하세요.');
				return;
			}
			
			let email = $('#email').val().trim();
			
			if(email == ''){
				alert ('이메일을 입력하세요.');
				return;
			}
			
			//아이디 중복확인 완료됐는지 확인
			// #idCheckOk <div> 클레스에 d-none이 없으면 사용가능
			if ($('#idCheckOk').hasClass('d-none')){
				alert('아이디 중복확인을 해주세요.');
				return;
			}
			
			// 서버에 요청
			// $.ajax 다른 모양 jquary post함수
			let url = $('#signUpForm').attr('action');
			//alert(url);
			let data = $('#signUpForm').serialize(); // 폼테그에 있는 데이터를 한번에 보낼 수 있게 구성한다. 그렇지 않으면 json으로 구성해야한다. 나열한다. 쿼리 스트링을 구성한다.
			//alert(data);
			
			$.post(url, data)
			.done(function(data){
				if (data.result == 'success') {
					alert("로그인 해주세요");
					location.href = '/user/login_view';
				}else{
					alert("가입에 실패했습니다.");
				} 
			});
		});
	});
</script>