<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!-- 누구페이지인지 -->
	
	<div class="myPage">
	<a href="mypage.neon?memberEmail=${requestScope.rankMemberVO.memberEmail}" style="" 
	tabindex="0" class="btn btn-lg btn-warning myProfileDetail" role="button" data-toggle="popover" 
	title="${requestScope.rankMemberVO.memberNickName}님, PTS(${requestScope.rankMemberVO.memberPoint} / ${requestScope.rankMemberVO.rankingVO.maxPoint})" 
	data-content="${requestScope.rankMemberVO.memberNickName}님 Click하여 페이지 보기">
	<span class="myProfile"> 
		${requestScope.rankMemberVO.memberNickName}님 의 페이지 [
		<c:forEach var="rankingList" items="${requestScope.rankingVOList}">
			<c:if test="${rankingList.memberGrade == requestScope.rankMemberVO.rankingVO.memberGrade}">
				<img class="gradeImg" src="${initParam.root}resources/img/GRADE_${requestScope.rankMemberVO.rankingVO.memberGrade}.png"> ${requestScope.rankMemberVO.rankingVO.memberGrade} ]
			</c:if>
		</c:forEach>
	</span>
	</a>
	</div>
	
   <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="itjaSlide">
      <h2 class="itjaMainTitle">${requestScope.rankMemberVO.memberNickName}이 찜한 주제글!<br></h2>
      <div class="container-fluid">
        <div class="gallery js-flickity" data-flickity-options='{ "freeScroll": true, "wrapAround": true ,"pageDots": false}'>
            <!-- el 문 및 ajax로 베스트글이 표시되는 슬라이드 지역 --> 
            <!-- 카드 1개 -->
          <c:forEach var="pickMainArticle" items="${requestScope.pickedMainArticleList}">
         	<div class="card-box col-lg-2">  
                <div class="card card-with-border" data-background="image" data-src="${initParam.root}resources/img/snow.jpg">    
                    <div class="content">
                        <h6 class="category">
                        	<c:forEach var="tagList" items="${pickMainArticle.tagBoardVOList}">
                        			#${tagList.tagName}
                        	</c:forEach>
                        </h6>
                        <br>
                        <h4 class="title">${pickMainArticle.mainArticleTitle}</h4>
                        <p class="description">
		                    ${pickMainArticle.mainArticleContent}
                  		</p>
			       	<a href="mypage.neon?memberEmail=${pickMainArticle.memberVO.memberEmail}" style="" tabindex="1" class="btn btn-lg btn-warning myNickDetail" role="button" 
					data-toggle="popover" 
					title="${pickMainArticle.memberVO.memberNickName}님, ${pickMainArticle.memberVO.rankingVO.memberGrade} PTS(${pickMainArticle.memberVO.memberPoint} / ${pickMainArticle.memberVO.rankingVO. maxPoint})" 
					data-content="${pickMainArticle.memberVO.memberNickName}님 Click하여 페이지 보기" >
                     <span class="writersNickName">- ${pickMainArticle.memberVO.memberNickName} -</span>
                     </a>
                     <input type="hidden" class="mainArticleTitleNO" value="${pickMainArticle.mainArticleNo}">
                     <input type="hidden" class="loginMemberEmail" value="${sessionScope.memberVO.memberEmail}">
                        <div class="actions">
                            <button class="btn btn-round btn-fill btn-neutral btn-modern" data-toggle="modal" data-target="#cardDetailView">
                                Read Article
                            </button>
                        </div>
                    </div>
                    
                    <div class="social-line social-line-visible" data-buttons="4">
                            <button class="btn btn-social btn-pinterest">
                                 05:22<br>
                                 빨리!
                            </button>
                            <button class="btn btn-social btn-twitter">
                                  51
                                  <br>
                                  잇자!
                            </button>
                            
                        <button class="btn btn-social btn-google pickBtn">
	                        <c:set var="breakCheck" value="false"/>
							<c:forEach var="pickCheck" items="${sessionScope.memberVO.pickedVOList}">
							<c:choose>
								<c:when test="${pickCheck.mainArticleNo == pickMainArticle.mainArticleNo}">
		                        	<c:set var="breakCheck" value="true"/>
		                      	</c:when>
		                      	<c:otherwise>
		                      	</c:otherwise>
							</c:choose>
	                      	</c:forEach>
	                      	<c:choose>
		                      	<c:when test="${breakCheck == true}">
		                      		<i class="fa fa-heart"></i><br>찜!
		                      	</c:when>
		                      	<c:otherwise>
		                      		<i class="fa fa-heart-o"></i><br>찜하자!
		                      	</c:otherwise>
	                      	</c:choose>
                        </button>
                        
                        <button class="btn btn-social btn-facebook">
                               <i class="fa fa-facebook-official"></i><br>
                                 공유하자!
                        </button>
                    </div>  <!-- end social-line social-line-visible -->
                  <div class="filter"></div>
                </div> <!-- end card -->
            </div><!-- card-box col-md-4 -->
            </c:forEach>
            <!--끝!! 카드 1개 -->
      </div><!--  end gallery js-flickity -->
      </div><!-- end container -->
    </div><!-- end jumbotron itjaSlide -->
   
    <!-- 끝!! el 문 및 ajax로 베스트글이 표시되는 슬라이드 지역 --> 
    
    
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="itjaSlide">
      <h2 class="itjaMainTitle">${requestScope.rankMemberVO.memberNickName}이 작성한 주제글!<br></h2>
        <div class="container-fluid">
        <div class="gallery js-flickity" data-flickity-options='{ "freeScroll": true, "wrapAround": true ,"pageDots": false}'>
            <!-- el 문 및 ajax로 베스트글이 표시되는 슬라이드 지역 --> 
            <!-- 카드 1개 -->
          <c:forEach var="writeMainArticle" items="${requestScope.writeMainArticleList}">
         	<div class="card-box col-lg-2">  
                <div class="card card-with-border" data-background="image" data-src="${initParam.root}resources/img/snow.jpg">    
                    <div class="content">
                        <h6 class="category">
                        	<c:forEach var="tagList" items="${writeMainArticle.tagBoardVOList}">
                        			#${tagList.tagName}
                        	</c:forEach>
                        </h6>
                        <br>
                        <h4 class="title">${writeMainArticle.mainArticleTitle}</h4>
                        <p class="description">
		                    ${writeMainArticle.mainArticleContent}
                  		</p>
                  	<a href="mypage.neon?memberEmail=${writeMainArticle.memberVO.memberEmail}" style="" tabindex="1" class="btn btn-lg btn-warning myNickDetail" role="button" 
					data-toggle="popover" 
					title="${writeMainArticle.memberVO.memberNickName}님, ${writeMainArticle.memberVO.rankingVO.memberGrade} PTS(${writeMainArticle.memberVO.memberPoint} / ${writeMainArticle.memberVO.rankingVO. maxPoint})" 
					data-content="${writeMainArticle.memberVO.memberNickName}님 Click하여 페이지 보기" >
                     <span class="writersNickName">- ${writeMainArticle.memberVO.memberNickName} -</span>
                     </a>
                     <input type="hidden" class="mainArticleTitleNO" value="${writeMainArticle.mainArticleNo}">
                     <input type="hidden" class="loginMemberEmail" value="${sessionScope.memberVO.memberEmail}">
                        <div class="actions">
                            <button class="btn btn-round btn-fill btn-neutral btn-modern" data-toggle="modal" data-target="#cardDetailView">
                                Read Article
                            </button>
                        </div>
                    </div>
                    
                    <div class="social-line social-line-visible" data-buttons="4">
                            <button class="btn btn-social btn-pinterest">
                                 05:22<br>
                                 빨리!
                            </button>
                            <button class="btn btn-social btn-twitter">
                                  51
                                  <br>
                                  잇자!
                            </button>
                            
                        <button class="btn btn-social btn-google pickBtn">
	                        <c:set var="breakCheck" value="false"/>
							<c:forEach var="pickCheck" items="${sessionScope.memberVO.pickedVOList}">
							<c:choose>
								<c:when test="${pickCheck.mainArticleNo == writeMainArticle.mainArticleNo}">
		                        	<c:set var="breakCheck" value="true"/>
		                      	</c:when>
		                      	<c:otherwise>
		                      	</c:otherwise>
							</c:choose>
	                      	</c:forEach>
	                      	<c:choose>
		                      	<c:when test="${breakCheck == true}">
		                      		<i class="fa fa-heart"></i><br>찜!
		                      	</c:when>
		                      	<c:otherwise>
		                      		<i class="fa fa-heart-o"></i><br>찜하자!
		                      	</c:otherwise>
	                      	</c:choose>
                        </button>
                        
                        <button class="btn btn-social btn-facebook">
                               <i class="fa fa-facebook-official"></i><br>
                                 공유하자!
                        </button>
                    </div>  <!-- end social-line social-line-visible -->
                  <div class="filter"></div>
                </div> <!-- end card -->
            </div><!-- card-box col-md-4 -->
            </c:forEach>
            <!--끝!! 카드 1개 -->
      </div><!--  end gallery js-flickity -->
      </div><!-- end container -->
    </div><!-- end jumbotron itjaSlide -->
    
    
       <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="itjaSlide">
      <h2 class="itjaMainTitle">${requestScope.rankMemberVO.memberNickName}이 이은 주제글!<br></h2>
      <div class="container-fluid">
        <div class="gallery js-flickity" data-flickity-options='{ "freeScroll": true, "wrapAround": true ,"pageDots": false}'>
            <!-- el 문 및 ajax로 베스트글이 표시되는 슬라이드 지역 --> 
            <!-- 카드 1개 -->
   	         <c:forEach var="joinMainArticle" items="${requestScope.joinMainArticleList}">
         	<div class="card-box col-lg-2">  
                <div class="card card-with-border" data-background="image" data-src="${initParam.root}resources/img/snow.jpg">    
                    <div class="content">
                        <h6 class="category">
                        	<c:forEach var="tagList" items="${joinMainArticle.tagBoardVOList}">
                        			#${tagList.tagName}
                        	</c:forEach>
                        </h6>
                        <br>
                        <h4 class="title">${joinMainArticle.mainArticleTitle}</h4>
                        <p class="description">
		                    ${joinMainArticle.mainArticleContent}
                  		</p>
                  	<a href="mypage.neon?memberEmail=${joinMainArticle.memberVO.memberEmail}" style="" tabindex="1" class="btn btn-lg btn-warning myNickDetail" role="button" 
					data-toggle="popover" 
					title="${joinMainArticle.memberVO.memberNickName}님, ${joinMainArticle.memberVO.rankingVO.memberGrade} PTS(${joinMainArticle.memberVO.memberPoint} / ${joinMainArticle.memberVO.rankingVO. maxPoint})" 
					data-content="${joinMainArticle.memberVO.memberNickName}님 Click하여 페이지 보기" >
                     <span class="writersNickName">- ${joinMainArticle.memberVO.memberNickName} -</span>
                     </a>
                     <input type="hidden" class="mainArticleTitleNO" value="${joinMainArticle.mainArticleNo}">
                     <input type="hidden" class="loginMemberEmail" value="${sessionScope.memberVO.memberEmail}">
                        <div class="actions">
                            <button class="btn btn-round btn-fill btn-neutral btn-modern" data-toggle="modal" data-target="#cardDetailView">
                                Read Article
                            </button>
                        </div>
                    </div>
                    
                    <div class="social-line social-line-visible" data-buttons="4">
                            <button class="btn btn-social btn-pinterest">
                                 05:22<br>
                                 빨리!
                            </button>
                            <button class="btn btn-social btn-twitter">
                                  51
                                  <br>
                                  잇자!
                            </button>
                            
                        <button class="btn btn-social btn-google pickBtn">
	                        <c:set var="breakCheck" value="false"/>
							<c:forEach var="pickCheck" items="${sessionScope.memberVO.pickedVOList}">
							<c:choose>
								<c:when test="${pickCheck.mainArticleNo == joinMainArticle.mainArticleNo}">
		                        	<c:set var="breakCheck" value="true"/>
		                      	</c:when>
		                      	<c:otherwise>
		                      	</c:otherwise>
							</c:choose>
	                      	</c:forEach>
	                      	<c:choose>
		                      	<c:when test="${breakCheck == true}">
		                      		<i class="fa fa-heart"></i><br>찜!
		                      	</c:when>
		                      	<c:otherwise>
		                      		<i class="fa fa-heart-o"></i><br>찜하자!
		                      	</c:otherwise>
	                      	</c:choose>
                        </button>
                        
                        <button class="btn btn-social btn-facebook">
                               <i class="fa fa-facebook-official"></i><br>
                                 공유하자!
                        </button>
                    </div>  <!-- end social-line social-line-visible -->
                  <div class="filter"></div>
                </div> <!-- end card -->
            </div><!-- card-box col-md-4 -->
            </c:forEach>
            <!--끝!! 카드 1개 -->
      </div><!--  end gallery js-flickity -->
      </div><!-- end container -->
    </div><!-- end jumbotron itjaSlide -->
    
