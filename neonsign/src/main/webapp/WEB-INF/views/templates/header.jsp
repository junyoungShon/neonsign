<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    $(document).ready(function(){
    	$("#logout").click(function(){
    		if(confirm("로그아웃하시겠습니까?")){
    			location.href="${initParam.root}/logout.do";
    		}
    	});
    });	
</script>
<div class="container header">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">뇌  On Sign</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
       			 <form class="navbar-form navbar-left" role="search" >
			        <div class="form-group" >
			          <input type="text" class="form-control" placeholder="Search" style="width:500px;">
			        </div>
			        <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
    			  </form>
    			  
			<!-- 	<form class="navbar-form navbar-center">
           			 <div class="form-group">
             		 	<input type="text" placeholder="Email" class="form-control">
           			 </div>
          			  <div class="form-group">
             			 <input type="password" placeholder="Password" class="form-control">
           			 </div>
           			 <button type="submit" class="btn btn-success">Sign in</button>
         			 </form>
         		 -->
    		<ul class="nav navbar-nav navbar-right">
		 <c:choose>
			<c:when test="${sessionScope.memberVO==null}">
    			<li><a href="#" class="memberLogin"> 로그인</a></li>
    			<li><a href="#" class="memberJoinByEmailBtn"> 가입</a></li>
    		</c:when>
  	 	 	<c:otherwise>

  	 	 		<li><a href="#" id="logout">로그아웃</a></li>

  	 	 	</c:otherwise>
  	 	 </c:choose>
    		
    			  <!-- 완결글 보기를 누르면 추천순으로 정렬된다. -대협 -->
    			  <li><a href="${initParam.root}selectListCompleteMainArticleOrderByTotalLike.neon">완결 글 보기</a></li>
    			  <li><a href="#" class="writeMainArticle">글쓰기</a></li>
     		</ul>
        </div><!--/.navbar-collapse -->
      </div>