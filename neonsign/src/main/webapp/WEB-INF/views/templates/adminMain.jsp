<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <br><br><br>




<!-- main -->

  <div class="tab-content" class="mainList"> 
  <!-- 관리자 홈 --> 
  <div role="tabpanel" class="tab-pane active mainList" id="adminPageHome" >
</div>

<!-- 회원 관리--> 

 <div role="tabpanel" class="tab-pane mainList" id="memberBlock" align="center" >
 	<h3>일반회원 리스트</h3>
		<table border=2 class="table table-hover" id="memberAllList"
			align="center">
			<thead align="center">
				<tr class="success">
					<td>메일</td>
					<td>닉네임</td>
					<td>가입일</td>
					<td>포인트</td>
					<td>신고누적</td>
					<td>서비스</td>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach items="${requestScope.adminList.memberList}" var="list">
					<tr>
						<td>${list.memberEmail}</td>
						<td>${list.memberNickName}</td>
						<td>${list.memberJoinDate}</td>
						<td>${list.memberPoint }</td>
						<td>${list.memberReportAmount}</td>
						<td><input type="submit" value="서비스정지" class="memberBlock"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

<div role="tabpanel" class="tab-pane mainList" id="memberBlocked" align="center" >
 	<h3>불량회원 리스트</h3>
<table border=2 class="table table-hover" id="memberAllList"
			align="center">
			<thead align="center">
				<tr class="success">
					<td>메일</td>
					<td>닉네임</td>
					<td>가입일</td>
					<td>포인트</td>
					<td>신고누적</td>
					<td>서비스</td>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach items="${requestScope.adminList.blokcMemberList}" var="list">
					<tr>
						<td>${list.memberEmail}</td>
						<td>${list.memberNickName}</td>
						<td>${list.memberJoinDate}</td>
						<td>${list.memberPoint }</td>
						<td>${list.memberReportAmount}</td>
						<td><input type="submit" value="서비스시작" class="memberService"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>   
</div>

<!-- 게시물 신고 리스트 --> 
    <div role="tabpanel" class="tab-pane mainList"  id="boardReport" >
     	<h3>주제글 신고리스트</h3>
		<table border="1" class="table table-hover">
			<thead align="center">
				<tr class="success">
					<td>신고순서</td>
					<td>신고 번호</td>					
					<td>주제글 번호</td>
					<td>주제글 제목</td>
					<td>주제글 작성자</td>
					<td>신고일</td>
					<td>신고횟수</td>
					<td>처리현황</td>
					<td>신고처리</td>
					<td>반려처리</td>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach items="${requestScope.adminList.mainReportList }"
					var="mainReportList" varStatus="i">
					<tr>
						<td>${i.index+1 }</td>
						<td>${mainReportList.reportNo}</td>
						<td>${mainReportList.mainArticleNo}</td>
						<c:forEach items="${mainReportList.mainArticleVO}"
							var="mainArticleVO">
							<td>${mainArticleVO.mainArticleTitle }</td>
							<td>${mainArticleVO.memberVO.memberNickName }</td>
						</c:forEach>
						<td>${mainReportList.reportDate}</td>
						<td>${mainReportList.reportAmount}</td>
						<td>${mainReportList.stagesOfProcess}</td>
						<td><input type="submit" value="신고처리" class="boardReport"></td>
						<td><input type="submit" value="반려처리" class="ReportCancle"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


<!-- 잇자글 신고 리스트 --> 
<div role="tabpanel" class="tab-pane mainList" id="repleReport" >
     	<h3>잇자글 신고리스트</h3>
		<table border="1" class="table table-hover">
			<thead align="center">
				<tr class="success">
					<td>신고순서</td>
					<td>신고 번호</td>
					<td>주제글 번호</td>
					<td>주제글 제목</td>
					<td>잇자글 번호</td>
					<td>잇자글 내용</td>
					<td>잇자 작성자</td>
					<td>신고일</td>
					<td>신고횟수</td>
					<td>처리현황</td>
					<td>신고처리</td>
					<td>반려처리</td>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach items="${requestScope.adminList.subReportList }"
					var="subReportList" varStatus="i">
					<tr>
						<td>${i.index+1 }</td>
						<td>${subReportList.reportNo}</td>
						<td>${subReportList.mainArticleNo}</td>
						<c:forEach items="${subReportList.mainArticleVO}"
							var="mainArticleVO">
							<td>${mainArticleVO.mainArticleTitle }</td>
							<c:forEach items="${mainArticleVO.subArticleList}"
								var="subArticleList">
								<td>${subArticleList.subArticleNo }</td>
								<td>${subArticleList.subArticleContent }</td>
								<td>${subArticleList.memberVO.memberNickName }</td>
							</c:forEach>
						</c:forEach>
						<td>${subReportList.reportDate}</td>
						<td>${subReportList.reportAmount}</td>
						<td>${subReportList.stagesOfProcess}</td>
						<td><input type="submit" value="신고처리" class="boardReport"></td>
						<td><input type="submit" value="반려처리" class="ReportCancle"></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

<!-- 문의사항 -->
<div role="tabpanel" class="tab-pane mainList" id="Questions">

</div>
  </div>
<!-- 끝 -->
