<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="container">
	<!-- Example row of columns -->
	<div class="row newItjaList" style="margin-top: 60px;">
		<input type="hidden" id="articleType" value="completeArticle">
		<h2 class="itjaMainTitle">완결된 잇자!</h2>
		<c:forEach items="${requestScope.mainArticleList}" var="list"
			begin="0" end="8">
			<!-- 카드 1개 -->
			<div class="card-box col-md-4" name="completeCardBox">
				<div class="card card-with-border" data-background="image"
					data-src="${initParam.root}resources/img/fashion-1.jpg">
					<div class="content">
						<h6 class="category">${list.tagName}</h6>
						<br>
						<c:set var="mainArticleContentTitle"
							value="${list.mainArticleTitle}" />
						<h5 class="title">
							[완결]
							<c:choose>
								<c:when test="${fn:length(mainArticleContentTitle)>12}">
								${fn:substring(mainArticleContentTitle, 0, 11)} ...
							</c:when>
								<c:otherwise>
								${list.mainArticleTitle}
							</c:otherwise>
							</c:choose>
						</h5>
						<c:set var="mainArticleContentContent"
							value="${list.mainArticleContent}" />
						<p class="description">
							<c:choose>
								<c:when test="${fn:length(mainArticleContentContent)>18}">
								${fn:substring(mainArticleContentContent, 0, 15)} ...
							</c:when>
								<c:otherwise>
								${list.mainArticleContent}
							</c:otherwise>
							</c:choose>
						</p>
						<span class="writersNickName">-
							${list.memberVO.memberNickName} -</span>
						<input type="hidden" name=""> <input type="hidden"
							class="mainArticleTitleNO" value="${list.mainArticleNo}">
						<div class="actions">
							<button class="btn btn-round btn-fill btn-neutral btn-modern"
								data-toggle="modal" data-target="#cardDetailView">Read
								Article</button>
						</div>
					</div>
					<div class="social-line social-line-visible" data-buttons="4">
						<button class="btn btn-social btn-pinterest">
							완결된<br>잇자!
						</button>
						 <button class="btn btn-social btn-twitter itja">
                                  <c:set var="count" value="false" />
								<c:forEach var="itjaList" items="${sessionScope.memberVO.itjaMemberList}">
									<c:choose>
										<c:when test="${itjaList.mainArticleNo== list.mainArticleNo}">
											<c:set var="count" value="true" />
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${count==true}">
										<span class="itjaCount"><i class="fa fa-link"></i><br>${list.mainArticleTotalLike }it</span>
									</c:when>
									<c:otherwise>
										<span class="itjaCount"><i class="fa fa-chain-broken"></i><br>${list.mainArticleTotalLike }it</span>
									</c:otherwise>
								</c:choose>
                            </button>
                            <form name="itJaInfo">
                            	<input type="hidden" name="memberEmail" value="${sessionScope.memberVO.memberEmail}">
                            	<input type="hidden" name="mainArticleNo" value="${list.mainArticleNo}">
                            	<input type="hidden" name="subArticleNo" value=0>
                            </form>
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
			<!--끝!! 카드 1개 -->
		</c:forEach>
	</div>
	<hr>
</div>
<!-- /container -->




