<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


   
<%--    <!-- 누구페이지인지 -->
   
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
   </div> --%>
   
   <!-- 마이페이지  -->
<div class="container-fluid">
<div class="col-lg-12 col-sm-12 myprofile">
    <div class="profileCard hovercard">
        <div class="profileCard-background">
            <img class="profileCard-bkimg" alt="" src="http://lorempixel.com/100/100/people/9/">
            <!-- http://lorempixel.com/850/280/people/9/ -->
        </div>
        <div class="useravatar">
       		<img src="http://vignette1.wikia.nocookie.net/pokemon/images/b/b4/%EB%A1%9C%EC%82%AC%EC%9D%98_%EC%95%84%EB%B3%B4%ED%81%AC.png/revision/latest?cb=20110121121520&path-prefix=ko" >
        </div>
        <div class="profileCard-info">
         <span class="profileCard-title">
         ${requestScope.rankMemberVO.memberNickName}님 [${requestScope.rankMemberVO.memberEmail}]
         </span>
         </div>
         <div class="profileCard-titleGrade">
         <span class="profileCard-gradePoint">
         <c:forEach var="rankingList" items="${requestScope.rankingVOList}">
         <c:if test="${rankingList.memberGrade == requestScope.rankMemberVO.rankingVO.memberGrade}">
            <img class="gradeImg" src="${initParam.root}resources/img/GRADE_${requestScope.rankMemberVO.rankingVO.memberGrade}.png">
         </c:if>
      </c:forEach>
      ${requestScope.rankMemberVO.rankingVO.memberGrade} 
         PTS(${requestScope.rankMemberVO.memberPoint} / ${requestScope.rankMemberVO.rankingVO.maxPoint})
         </span>
         </div>
        
    </div>
    <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="...">
        <div class="btn-group" role="group">
            <button type="button" id="stars" class="btn btn-primary" href="#tab1" data-toggle="tab"><i class="fa fa-th-large"></i>
                <div class="hidden-xs">잇자! Action Info</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="favorites" class="btn btn-default" href="#tab2" data-toggle="tab"><i class="fa fa-child"></i>
                <div class="hidden-xs">Profile</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="following" class="btn btn-default" href="#tab3" data-toggle="tab"><i class="fa fa-users"></i>
                <div class="hidden-xs">Following</div>
            </button>
        </div>
    </div>

        <div class="well">
      <div class="tab-content">
        <div class="tab-pane fade in active" id="tab1">
          <!-- 찜한 주제글 -->
          <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="itjaSlide">
      <h2 class="itjaMainTitle">${requestScope.rankMemberVO.memberNickName}이 찜한 주제글!<br></h2>
      <div class="container-fluid">
        <div class="gallery js-flickity" data-flickity-options='{ "freeScroll": true, "wrapAround": true ,"pageDots": false}'>
        <!-- 카드 1개 -->
          <c:forEach var="pickMainArticle" items="${requestScope.pickedMainArticleList}">
            <div class="card-box col-lg-2">  
                <div class="card card-with-border" data-background="image" data-src="${initParam.root}resources/img/snow.jpg">    
                    <div class="content">
                        <h6 class="category">
                            ${pickMainArticle.tagName}
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
    <!-- 끝!! 찜한 주제글 --> 
    
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
                            ${writeMainArticle.tagName}
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
    <!-- 끝 작성한 주제글 -->
    
    <!-- 참여, 이은 주제글 -->
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
                            ${joinMainArticle.tagName}
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
    <!-- 끝 참여주제글 -->
        </div> <!-- Tab1 끝 -->
        
      <!-- Tab2 개인정보 시작 -->
      <div class="tab-pane fade in" id="tab2">

      </div> <!-- Tab2 끝 -->
        
       <!-- Tab3 구독 정보 시작 -->
        <div class="tab-pane fade in" id="tab3">
        
        </div> <!-- Tab3 끝 -->
      </div>
    </div>
    
    </div>
</div>

<!-- 여기까지 마이프로필 -->
   
   
    
    
    
    
    
    
    