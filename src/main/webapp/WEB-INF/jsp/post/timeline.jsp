<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>

<div class="timeline-box my-5">

	<c:forEach items="${contentList}" var="content">
		<%-- 카드 하나하나마다 영역을 border로 나눔 --%>
		<div class="card border rounded mt-3">
	
			<%-- 글쓴이 아이디 및 ... 버튼(삭제) : 이 둘을 한 행에 멀리 떨어뜨려 나타내기 위해 d-flex, between --%>
			<div class="p-2 d-flex justify-content-between">
				<span class="font-weight-bold">${content.post.userName}</span>
	
				<%-- 클릭할 수 있는 ... 버튼 이미지 --%>
				<c:if test="${content.post.userId eq userId}">
					<a href="#" class="more-btn"> 
						<img src="https://www.iconninja.com/files/860/824/939/more-icon.png"width="24">
					</a>
				</c:if>
			</div>
	
			<%-- 카드 이미지 --%>
			<div class="card-img">
				<img
					src="${content.post.imgUrl}"
					class="w-100">
			</div>
	
			<%-- 좋아요 --%>
			<!-- jsp는 쪼개면 안된다?? 진짜네... -->
			<%-- <jsp:include page="timeline/like.jsp"/> --%>
			<div class="card-like m-3">
				<!-- get으로 끄내서 쓰면 무족건 리프레쉬를 해줘야한다... -->
				<%-- <a class="likeBtn" href="like/like_click?contentId=${content.pocontent.post. --%>
				<a class="likeBtn" href="#" data-post-id="${content.post.id}">
					<c:choose>
					<c:when test="${content.like.likePost eq 1}">
						<img src="https://www.iconninja.com/files/527/809/128/heart-icon.png" width="18px" height="18px">
					</c:when>
					<c:otherwise>
						<img src="https://www.iconninja.com/files/214/518/441/heart-icon.png" width="18px" height="18px">
					</c:otherwise>
					</c:choose>
				</a> 
				<a href="#">
					좋아요 11개
				</a>
			</div>
	
			<%-- 글(Post) --%>
			<div class="card-post m-3">
				<span class="font-weight-bold">${content.post.userName} </span> <span> ${content.post.content}</span>
			</div>
	
			<%-- 댓글(Comment) --%>
	
			<%-- "댓글" --%>
			<div class="card-comment-desc border-bottom">
				<div class="ml-3 mb-1 font-weight-bold">댓글</div>
			</div>
			<div class="card-comment-list m-2">
				<%-- 댓글 목록 --%>
				<div class="card-comment m-1">
					<span class="font-weight-bold">hagulu : </span> <span> 분류가 잘
						되었군요~</span>
	
					<%-- TODO: 댓글쓴이가 본인이면 삭제버튼 노출 --%>
					<a href="#" class="commentDelBtn"> <img
						src="https://www.iconninja.com/files/603/22/506/x-icon.png"
						width="10px" height="10px">
					</a>
				</div>
	
				<div class="card-comment m-1">
					<span class="font-weight-bold">jun_coffee : </span> <span> 철이
						없었죠 분류를 위해 클러스터를 썼다는게</span>
	
					<%-- TODO: 댓글쓴이가 본인이면 삭제버튼 노출 --%>
					<a href="#" class="commentDelBtn"> <img
						src="https://www.iconninja.com/files/603/22/506/x-icon.png"
						width="10px" height="10px">
					</a>
				</div>
			</div>
	
			<%-- 댓글 쓰기 --%>
			<%-- 로그인 된 상태에서만 쓸 수 있다. --%>
			<c:if test="${not empty userId}">
				<div class="comment-write d-flex border-top mt-2">
					<input type="text" id="commentText"
						class="form-control border-0 mr-2" placeholder="댓글 달기" />
					<button type="button" class="btn btn-light commentBtn">게시</button>
				</div>
			</c:if>
		</div>
	</c:forEach>
</div>

<script>
$(document).ready(function(){
	$(".likeBtn").click(function(e){
		e.preventDefault();
		
		let postId = $(this).data('post-id');
		
		console.log(postId);
		 alert("눌림 확인");	
		
		$.ajax({
			type: 'get'
			, url: '/like/like_click'
			, data: {'postId': postId}
			, success: function(data) {
				if(data.result) {
					if (data.result == 'like'){
						alert("좋아요");
						location.reload();
					} else if (data.result == 'dislike'){
						alert("싫어요");
						location.reload();
					} else if (data.result == 'userIdIsNull') {
						alert("이런 미안 너 이름이 뭐였지?(로그아웃 되셨습니다.)")
						location.href = "/user/login_view";
						// 여기에 작성 내용 및 파일을 임시로 저장했으면 좋겠다.
					}
					
				}
			}
		})
	})
})
</script> 
