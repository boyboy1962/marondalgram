<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="type-in-box write-box border rounded">
	<textarea  style="border: none" id="content" rows="3" cols="100" class="form-control" placeholder="오늘 좋았던 일이 있나요?"></textarea>
	<div class="d-flex justify-content-between">
		<div class="file-upload d-flex">
			<%-- file 태그는 숨겨두고 이미지를 클릭하면 file 태그를 클릭한 것처럼 이벤트를 줄 것이다. --%>
			<input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
			<%-- 이미지에 마우스 올리면 마우스커서가 링크 커서가 변하도록 a 태그 사용 --%>
			<a href="#" id="fileUploadBtn"><img width="40" src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png"></a>
			<div id="fileName" class=""></div>
		</div>
		<button id="uploadBtn" class="btn btn-primary">업로드</button>
	</div>
</div>
<script>
$(document).ready(function(){
	// 파일 업로드 이미지 버튼 클릭 - 사용자가 업로드를 할 수 있게 해줌
	$('#fileUploadBtn').on('click', function(e) {
		e.preventDefault(); // 기본 작동 중지
		$('#file').click(); // input file을 클릭한 것과 같은 동작
	});
	
	// 사용자가 파일 업로드를 했을 때 유효성 확인 및 업로드 된 파일 이름을 노출
	$('#file').on('change', function(e) {
		var name = e.target.files[0].name;
		
		// 확장자 유효성 확인
		var extension = name.split('.');
		if (extension.length < 2 || 
		 	(extension[extension.length - 1] != 'gif' 
		 	&& extension[extension.length - 1] != 'png' 
		 	&& extension[extension.length - 1] != 'jpg'
		 	&& extension[extension.length - 1] != 'jpeg')) {
		 	
		 	alert("이미지 파일만 업로드 할 수 있습니다.");
		 	$(this).val(""); // 이미 올라간 것을 확인한 것이기 때문에 비워주어야 한다.
		 	return;
		 }
		 
		 $("#fileName").text(name);
	});
	
	// 업로드하기 
	$('#uploadBtn').on('click', function(e){
		let content = $("#content").val();
		let file = $('#file').val();
		alert("T# content: " + content + " file: " + file );
		
		// 글이 없으면 해당사항 물어보기
		if (content.trim() == ""){
			if(confirm("오늘은 아무것도 쓰지 않을꺼니?")){
				alert("알겠엉 오늘은 조용한 하루를 보냈구나.");
				content = $("#content").val("");
			} else {
				alert("그래 그럼 오늘은 뭘 했는지 알려줘.");
				return;
			}
		}
		
		alert("T#2 content: " + content + " file: " + file );
		// 인공 폼테그
		let formData = new FormData();
		formData.append("content", content);
		formData.append("file", $('#file')[0].files[0]);
		alert(formData.get("content"));
		
		// ajax
		$.ajax({
			type: 'post'
			, url: '/post/create'
			, data: formData
			, enctype: 'multipart/form-data'
			, processData: false
			, contentType: false
			, success: function(data) {
				if (data.result == 'success'){
					alert("오늘의 하루를 저장했어요.");
					location.reload();
				} else if (data.result == 'userIdIsNull') {
					alert("이런 미안 너 이름이 뭐였지?(로그아웃 되셨습니다.)")
					location.href = "/user/login_view";
					// 여기에 작성 내용 및 파일을 임시로 저장했으면 좋겠다.
				}
			}
			, error: function(e) {
				alert("미안 에러가 났어. 관리자에게 해당 코드를 보내줘: + " + e);
			}
		})
		
		
	}) 
});


</script>