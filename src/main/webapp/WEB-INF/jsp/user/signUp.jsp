<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="contents d-flex">
	<div class="col-2"></div>
	<div class="col-8">
		<h1 class="mt-3">회원 가입</h1>
		<div class="center-box p-3">
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
					<input type="text" class="form-control" id="password" name="password"
						placeholder="비밀번호 입력">
				</div>
			</div>
			
			
			<!-- 비번확인 입력 구간 -->
			<div class="d-flex mb-3">
				<div class="input-group col-11">
					<div class="input-group-prepend">
						<span class="input-group-text">비번확인</span>
					</div>
					<input type="text" class="form-control" id="passwordConfirm" name="passwordConfirm"
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
					alert(data.result)
					//alert(data.result)
					
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
					}
				}
				, error: function(e){
					alert("아이디 중복확인에 실패했습니다. 관리자에게 문의해주세요.")
				}
			});
		});
	});
</script>