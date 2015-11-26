<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="itjaSlide">
      <h2 class="itjaMainTitle">베스트 잇자!</h2>
      <div class="container-fluid">
        <div class="gallery js-flickity" data-flickity-options='{ "freeScroll": true, "wrapAround": true ,"pageDots": false}'>
            <!-- el 문 및 ajax로 베스트글이 표시되는 슬라이드 지역 --> 
            <!-- 카드 1개 -->
 	<c:forEach var="bestMainArticle" items="${requestScope.bestMainArticleVOListOrderByDate}">
         	<div class="card-box col-lg-2">  
                <div class="card card-with-border" data-background="image" data-src="${initParam.root}resources/img/snow.jpg">    
                    <div class="content">
                        <h6 class="category">#Tag,</h6>
                        <br>
                        <h4 class="title">${bestMainArticle.mainArticleTitle}</h4>
                        <p class="description">
		                    ${bestMainArticle.mainArticleContent}
                  		</p>
                     <span class="writersNickName">${bestMainArticle.memberVO.memberNickName}</span>
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
                                  ${bestMainArticle.mainArticleTotalLike}
                                  <br>
                                  잇자!
                            </button>
                            <button class="btn btn-social btn-google">
                                  <i class="fa fa-heart-o"></i><br>
                                  찜하자!
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
    
   <!-- 태그 소트 버튼 부분 -->
   <div class="container tags-container">
   <c:forEach items="${requestScope.tagVOList}" var="tagList">
      <span><a href="arrayNewMainArticle.do?tagName=${tagList.tagName}">#${tagList.tagName}</a></span>
   </c:forEach>
   </div>
   <!--  태그 소트 버튼 끝 -->   
   
    <div class="container">
      <!-- Example row of columns -->
      <div class="row newItjaList">
         <h2 class="itjaMainTitle">새로운 잇자!</h2>
            
        <!-- *** new Main 카드 1개 -->
      <c:forEach var="newMainArticle" items="${requestScope.newMainArticleVOListOrderByDate}">
         <div class="card-box col-md-4">  
                <div class="card card-with-border" data-background="image" data-src="${initParam.root}resources/img/fashion-1.jpg">    
                    <div class="content">
                    
                        <h6 class="category">
                        #Tag, 
                        <%-- <c:forEach items="${newMainArticle.tagBoardVOList}" var="tagBoard">
                        	#${tagBoard.tagName}, 
                       	</c:forEach> --%>
                        </h6>
                        
                        <br>
                        <h4 class="title">${newMainArticle.mainArticleTitle}</h4>
                        <p class="description">
		             		${newMainArticle.mainArticleContent}
		                </p>
		                <span class="writersNickName">${newMainArticle.memberVO.memberNickName}</span>
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
                                   ${newMainArticle.mainArticleTotalLike}
                                   <br>
                                  잇자!
                            </button>
                            <button class="btn btn-social btn-google">
                                  <i class="fa fa-heart-o"></i><br>
                                  찜하자!
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
  		 </div>
      <hr>
    </div> <!-- /container -->
