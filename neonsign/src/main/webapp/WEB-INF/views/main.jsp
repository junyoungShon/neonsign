<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="itjaSlide">
	<h2 class="itjaMainTitle">베스트 잇자!</h2>
	<div class="container-fluid">
		<div class="gallery js-flickity"
			data-flickity-options='{ "freeScroll": true, "wrapAround": true ,"pageDots": false}'>
			<!-- el 문 및 ajax로 베스트글이 표시되는 슬라이드 지역 -->
			<!-- 카드 1개 -->
			<c:forEach var="bestMainArticle"
				items="${requestScope.bestMainArticleVOListOrderByDate}">
				<div class="card-box col-lg-2">
					<div class="card card-with-border" data-background="image"
						data-src="${initParam.root}resources/img/snow.jpg">
						<div class="content">
							<h6 class="category">${bestMainArticle.tagName}</h6>
							<br>
							<h4 class="title">${bestMainArticle.mainArticleTitle}</h4>
							<p class="description">${bestMainArticle.mainArticleContent}
							</p>
							<span class="writersNickName">-
								${bestMainArticle.memberVO.memberNickName} -</span> <input
								type="hidden" class="mainArticleTitleNO"
								value="${bestMainArticle.mainArticleNo}">
							<div class="actions">
								<button class="btn btn-round btn-fill btn-neutral btn-modern"
									data-toggle="modal" data-target="#cardDetailView">
									Read Article</button>
							</div>
						</div>
						<div class="social-line social-line-visible" data-buttons="4">
							<button class="btn btn-social btn-pinterest">
								05:22<br> 빨리!
							</button>
							<button class="btn btn-social btn-twitter itja">
                              <c:set var="count" value="false" />
								<c:forEach var="itjaList" items="${sessionScope.memberVO.itjaMemberList}">
									<c:choose>
										<c:when test="${itjaList.mainArticleNo== bestMainArticle.mainArticleNo}">
											<c:set var="count" value="true" />
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${count==true}">
										<span class="itjaCount"><i class="fa fa-link"></i><br>${bestMainArticle.mainArticleTotalLike }it</span>
									</c:when>
									<c:otherwise>
										<span class="itjaCount"><i class="fa fa-chain-broken"></i><br>${bestMainArticle.mainArticleTotalLike }it</span>
									</c:otherwise>
								</c:choose>
                            </button>
                                <%--
                            	잇자 버튼 클릭시 전달 할 정보를 위한 히든 폼
                            	주제글의 잇자 클릭이므로 subArticleNo=0으로 넘어간다.
                             --%>
							
										
                            <form name="itJaInfo">
                            	<input type="hidden" name="memberEmail" value="${sessionScope.memberVO.memberEmail}">
                            	<input type="hidden" name="mainArticleNo" value="${bestMainArticle.mainArticleNo}">
                            	<input type="hidden" name="subArticleNo" value=0>
                            </form>
                            <%--
                            	잇자 버튼 클릭시 전달 할 정보를 위한 히든 폼 끝
                             --%>
							<button class="btn btn-social btn-google">
								<i class="fa fa-heart-o"></i><br> 찜하자!
							</button>
							<button class="btn btn-social btn-facebook">
								<i class="fa fa-facebook-official"></i><br> 공유하자!
							</button>
						</div>
						<!-- end social-line social-line-visible -->
						<div class="filter"></div>
					</div>
					<!-- end card -->
				</div>
				<!-- card-box col-md-4 -->
			</c:forEach>
			<!--끝!! 카드 1개 -->
		</div>
		<!--  end gallery js-flickity -->
	</div>
	<!-- end container -->
</div>
<!-- end jumbotron itjaSlide -->

<!-- 끝!! el 문 및 ajax로 베스트글이 표시되는 슬라이드 지역 -->

<!-- 태그 소트 버튼 부분 -->
<div class="container tags-container">
	<c:forEach items="${requestScope.tagVOList}" var="tagList">
		<span><a
			href="arrayNewMainArticle.do?tagName=${tagList.tagName}">#${tagList.tagName}</a></span>
	</c:forEach>
</div>
<!--  태그 소트 버튼 끝 -->

<div class="container">
	<!-- Example row of columns -->
	<div class="row newItjaList">
		<h2 class="itjaMainTitle">새로운 잇자!</h2>

		<!-- *** new Main 카드 1개 -->
		<input type="hidden" id="articleType" value="mainArticle">
		<c:forEach var="newMainArticle"
			items="${requestScope.newMainArticleVOListOrderByDate}" begin="0"
			end="8">
			<div class="card-box col-md-4" name="newCardBox">
				<div class="card card-with-border" data-background="image"
					data-src="${initParam.root}resources/img/fashion-1.jpg">
					<div class="content">
						<h6 class="category">${newMainArticle.tagName}</h6>
						<br>
						<c:set var="mainArticleContentTitle"
							value="${newMainArticle.mainArticleTitle}" />
						<h5 class="title">
							[미완]
							<c:choose>
								<c:when test="${fn:length(mainArticleContentTitle)>12}">
								${fn:substring(mainArticleContentTitle, 0, 11)} ...
							</c:when>
								<c:otherwise>
								${newMainArticle.mainArticleTitle}
							</c:otherwise>
							</c:choose>
						</h5>
						<c:set var="mainArticleContentContent"
							value="${newMainArticle.mainArticleContent}" />
						<p class="description">
						<c:choose>
								<c:when test="${fn:length(mainArticleContentContent)>18}">
								${fn:substring(mainArticleContentContent, 0, 15)} ...
							</c:when>
								<c:otherwise>
								${newMainArticle.mainArticleContent}
							</c:otherwise>
							</c:choose></p>
						<span class="writersNickName">-
							${newMainArticle.memberVO.memberNickName} -</span> <input type="hidden"
							class="mainArticleTitleNO"
							value="${newMainArticle.mainArticleNo}">
						<div class="actions">
							<button class="btn btn-round btn-fill btn-neutral btn-modern"
								data-toggle="modal" data-target="#cardDetailView">Read
								Article</button>
						</div>
					</div>
					<div class="social-line social-line-visible" data-buttons="4">
						<button class="btn btn-social btn-pinterest">
							05:22<br> 빨리!
						</button>
						 <button class="btn btn-social btn-twitter itja">
                                  <c:set var="count" value="false" />
								<c:forEach var="itjaList" items="${sessionScope.memberVO.itjaMemberList}">
									<c:choose>
										<c:when test="${itjaList.mainArticleNo== newMainArticle.mainArticleNo}">
											<c:set var="count" value="true" />
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${count==true}">
										<span class="itjaCount"><i class="fa fa-link"></i><br>${newMainArticle.mainArticleTotalLike }it</span>
									</c:when>
									<c:otherwise>
										<span class="itjaCount"><i class="fa fa-chain-broken"></i><br>${newMainArticle.mainArticleTotalLike }it</span>
									</c:otherwise>
								</c:choose>
                            </button>
                                <%--
                            	잇자 버튼 클릭시 전달 할 정보를 위한 히든 폼
                            	주제글의 잇자 클릭이므로 subArticleNo=0으로 넘어간다.
                             --%>
							
										
                            <form name="itJaInfo">
                            	<input type="hidden" name="memberEmail" value="${sessionScope.memberVO.memberEmail}">
                            	<input type="hidden" name="mainArticleNo" value="${newMainArticle.mainArticleNo}">
                            	<input type="hidden" name="subArticleNo" value=0>
                            </form>
                            <%--
                            	잇자 버튼 클릭시 전달 할 정보를 위한 히든 폼 끝
                             --%>
						<button class="btn btn-social btn-google">
							<i class="fa fa-heart-o"></i><br> 찜하자!
						</button>
						<button class="btn btn-social btn-facebook">
							<i class="fa fa-facebook-official"></i><br> 공유하자!
						</button>
					</div>
					<!-- end social-line social-line-visible -->
					<div class="filter"></div>
				</div>
				<!-- end card -->
			</div>
			<!-- card-box col-md-4 -->
		</c:forEach>
		<!--끝!! 카드 1개 -->
	</div>
	<hr>
</div>
<!-- /container -->
