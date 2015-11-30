$(document).ready(function(){ //DOM이 준비되고
	
	//main 부분
	//무한 스크롤 (테스트 완료 ajax와 연동 필요)
	// hipster 카드에서 동적으로 style을 입혀주지 못하는 문제점이 있어서 반드시 소스를 넣을 때 style을 수기로 기록해줘야함
	$(window).scroll(function(){
		//alert($(".card-box").length);
        if($(window).scrollTop() == $(document).height() - $(window).height()){  
           setTimeout(function(){loadingItjaCard();}, 800)
        }  
	});  
	function loadingItjaCard(){
		var infinityScrollTestSource = "";
		var mainArticleTitle = "";
		var mainArticleContent = "";
		if($("#articleEnd").val()!='end'){
		if($("#articleType").val()=='completeArticle'){
			var cardBox=$(".card-box[name=completeCardBox]").length;
			//alert(cardBox);
			var pageNo=Math.ceil((cardBox/9)+1);
			//alert("pageNo : " + pageNo);
			$.ajax({
				type:"post",
				url:"getCompleteMainArticle.neon?pageNo="+pageNo,
				dataType:"json",
				success:function(data){
					if(data.length!=0){
					for(var i=0; i<data.length; i++){
						//타이틀 길이제한 조건문
						if(data[i].mainArticleTitle.length>12){
							mainArticleTitle = data[i].mainArticleTitle.substring(0,12) + " ...";
						}else{
							mainArticleTitle = data[i].mainArticleTitle;
						}
						//내용 길이제한 조건문
						if(data[i].mainArticleContent.length>18){
							mainArticleContent = data[i].mainArticleContent.substring(0,15) + " ...";
						}else{
							mainArticleContent = data[i].mainArticleContent;
						}
						//추가될 카드 html문
						infinityScrollTestSource +=
							'<div class="card-box col-md-4" name="completeCardBox">' 
							+ '<div class="card card-with-border" data-background="image" data-src="resources/img/snow.jpg" style="background-image: url(resources/img/snow.jpg); background-size: cover; background-position: 50% 50%;">' 
							+ '<div class="content">' 
							+ '<h6 class="category">' + data[i].tagName + '</h6><br>' 
							+ '<h5 class="title">[완결]' + mainArticleTitle + '</h5>' 
							+ ' <p class="description">' + mainArticleContent + '</p>' 
							+ '<div class="actions">' 
							+ '<button class="btn btn-round btn-fill btn-neutral btn-modern" data-toggle="modal" data-target="#cardDetailView">Read Article</button>' 
							+ '</div>' 
							+ '<div class="social-line social-line-visible" data-buttons="4">' 
							+ '<button class="btn btn-social btn-pinterest">완결된<br>잇자!</button>' 
							+ '<button class="btn btn-social btn-twitter">' + data[i].mainArticleTotalLike + '<br>잇자!</button>' 
							+ '<button class="btn btn-social btn-google"><i class="fa fa-heart-o"></i><br>찜하자!</button>' 
							+ '<button class="btn btn-social btn-facebook"><i class="fa fa-facebook-official"></i><br>공유하자!</button>' 
							+ '</div>  <!-- end social-line social-line-visible --></div></div> <!-- end card --></div><!-- card-box col-md-4 -->'
					}
					}else{
						infinityScrollTestSource +=
							'<div class="card-box col-md-4" name="completeCardBox">'
							+ '<input type="hidden" id="articleEnd" value="end">'
							+ '<div class="card card-with-border" data-background="image" data-src="resources/img/snow.jpg" style="background-image: url(resources/img/snow.jpg); background-size: cover; background-position: 50% 50%;">'
							+ '<h3>마지막 게시물입니다!</h3>'
							+ '</div> <!-- end card --></div><!-- card-box col-md-4 -->'
					}
					$('.ajaxLoader').fadeOut(300);
					$('.newItjaList').append(infinityScrollTestSource);
				}
			});
		}else if($("#articleType").val()=='mainArticle'){ 
			var cardBox=$(".card-box[name=newCardBox]").length;
			var pageNo=Math.ceil((cardBox/9)+1);
			//alert(pageNo);
				$.ajax({
					type:"post",
					url:"getNewMainArticle.neon?pageNo="+pageNo,
					dataType:"json",
					success:function(data){
						if(data.length!=0){
						for(var i=0; i<data.length; i++){
							//타이틀 길이제한 조건문
							if(data[i].mainArticleTitle.length>12){
								mainArticleTitle = data[i].mainArticleTitle.substring(0,12) + " ...";
							}else{
								mainArticleTitle = data[i].mainArticleTitle;
							}
							//내용 길이제한 조건문
							if(data[i].mainArticleContent.length>18){
								mainArticleContent = data[i].mainArticleContent.substring(0,15) + " ...";
							}else{
								mainArticleContent = data[i].mainArticleContent;
							}
							//추가될 카드 html문
							infinityScrollTestSource +=
								'<div class="card-box col-md-4" name="newCardBox">' 
								+ '<div class="card card-with-border" data-background="image" data-src="resources/img/snow.jpg" style="background-image: url(resources/img/snow.jpg); background-size: cover; background-position: 50% 50%;">' 
								+ '<div class="content">' 
								+ '<h6 class="category">' + data[i].tagName + '</h6><br>' 
								+ '<h5 class="title">[미완]' + mainArticleTitle + '</h5>' 
								+ ' <p class="description">' + mainArticleContent + '</p>' 
								+ '<div class="actions">' 
								+ '<button class="btn btn-round btn-fill btn-neutral btn-modern" data-toggle="modal" data-target="#cardDetailView">Read Article</button>' 
								+ '</div>' 
								+ '<div class="social-line social-line-visible" data-buttons="4">' 
								+ '<button class="btn btn-social btn-pinterest">완결된<br>잇자!</button>' 
								+ '<button class="btn btn-social btn-twitter">' + data[i].mainArticleTotalLike + '<br>잇자!</button>' 
								+ '<button class="btn btn-social btn-google"><i class="fa fa-heart-o"></i><br>찜하자!</button>' 
								+ '<button class="btn btn-social btn-facebook"><i class="fa fa-facebook-official"></i><br>공유하자!</button>' 
								+ '</div>  <!-- end social-line social-line-visible --></div></div> <!-- end card --></div><!-- card-box col-md-4 -->'
						}
						}else{
							infinityScrollTestSource +=
								'<div class="card-box col-md-4" name="completeCardBox">' 
								+ '<input type="hidden" id="articleEnd" value="end">'
								+ '<div class="card card-with-border" data-background="image" data-src="resources/img/snow.jpg" style="background-image: url(resources/img/snow.jpg); background-size: cover; background-position: 50% 50%;">'
								+ '<h3>마지막 게시물입니다!</h3>'
								+ '</div> <!-- end card --></div><!-- card-box col-md-4 -->'
						}
						$('.ajaxLoader').fadeOut(300);
						$('.newItjaList').append(infinityScrollTestSource);
					}
				});
		}
		}
	};

	//무한 스크롤 끝

	
	//tag sort 버튼 활성화
	
	$('.tags-container>span').hover(function(){
		$(this).attr('style','border="black"');
	},function(){
		$(this).attr('style','border-color="white"');
	});
	
	$('.tags-container>span').click(function(){
		$(this).attr('class','tag-active');
	});
	
	
	/**cardDetailView
	 * 카드 클릭시 상세 페이지 보기위해 모달 창열기
	 */
	/*$('.actions :button').click(function(){
		$('#cardDetailView').modal('show')
		//태그 목록 출력 : $(this).parent().siblings().eq(0).text() 
		//타이틀 출력 :  $(this).parent().siblings().eq(1).text() 
		//내용 출력 :  $(this).parent().siblings().eq(2).text() 
		var tagLists = $(this).parent().siblings().eq(0).text() ;
		var title = $(this).parent().siblings().eq(2).text();
		var content = $(this).parent().siblings().eq(3).text() ;
		$('#cardDetailView .modal-title').text(title);
		$('#cardDetailView .modal-body').text(content);
		
	});*/
	$('.actions :button').on('click',function(){
		//태그 목록 출력 : $(this).parent().siblings().eq(0).text() 
		//타이틀 출력 :  $(this).parent().siblings().eq(1).text() 
		//내용 출력 :  $(this).parent().siblings().eq(2).text() 
		var tagLists = $(this).parent().siblings().eq(0).text() ;
		var title = $(this).parent().siblings().eq(2).text();
		var content = $(this).parent().siblings().eq(3).text() ;
		var writersId =  $(this).parent().siblings().eq(4).text();
		var mainArticleNO =  $(this).parent().siblings().eq(5).val();
		/*var mainArticleTitleNO=$(":input[name=mainArticleNo1234]").val();*/
		/*alert(mainArticleTitleNO);*/
		$.ajax({
			type:"post",
			url:"selectOneNotCompleteMainArticleByMainArticleNo.neon",
			data:"mainArticleNo="+mainArticleNO,
			dataType:"json",
			success:function(data){
				var subAtricleGrade=0;
				var mainArticle="";
				/*alert($(".table").children().html()+"희");*/
				$('.mainCardDetailViewContentNo').text(0);
				$('.mainCardDetailViewContent').text(data.mainArticleContent);
				$('.mainWritersNickNameAtDetail').text(data.memberVO.memberNickName);
				$('.mainLikeIt').html("잇자! <br>"+data.mainArticleTotalLike);
				//작성자가 쓴 주제글이 맨위로 넘어 온다
				
				
				for(var j=0; j<data.subArticleList.length;j++){
					if(data.subArticleList[j].subAtricleGrade>subAtricleGrade){
						subAtricleGrade=data.subArticleList[j].subAtricleGrade;
					}
				}//현재 주제글의 잇는글들의 subAtricleGrade의 Max값을 찾는 for문 
					/*
					 *주제글에 잇는글이 들어갈때의 조건
					 *최대 subAtricleGrade은 주제글에 X
					 *똑같은 subAtricleGrade는 주제글에 넣지 않고 하나만 넣는다
					 */
				var check=-1;//
				for(var s=0; s<data.subArticleList.length;s++){
					if(check!=data.subArticleList[s]){
					if(data.subArticleList[s].subAtricleGrade<subAtricleGrade){
						mainArticle=mainArticle+"<tr><td width='5%'>"+(s+1)+"</td><td width='75%'>" +
						data.subArticleList[s].subArticleContent+"</td><td width='10%'>"+
						data.subArticleList[s].memberVO.memberNickName+"</td><td width='5%'>잇자!<br>"+
						data.subArticleList[s].subArticleLike+"</td>"+
						"<td width='5%'>신고</td></tr>";
						check=data.subArticleList[s].subAtricleGrade;
						}else{}
					}else{}
				}

				$("#mainSubArticle").html(mainArticle);
			var subAtricleOrder="<tr class='warning'><td colspan='5'>잇는글</td></tr>";
			for(var i=0; i<data.subArticleList.length; i++){
				if(data.subArticleList[i].subAtricleGrade==subAtricleGrade){
					subAtricleOrder=subAtricleOrder+
							"<tr><td class=' subCardDetailViewContentNo' width=' 5%' >"+(i+1)+"</td>"+
							"<td class=' subCardDetailViewContent'  width=' 80%' >"+data.subArticleList[i].subArticleContent+"</td>"+
							"<td class=' subWritersNickNameAtDetail'  width=' 10%' >"+data.subArticleList[i].memberVO.memberNickName+"</td>"+
							"<td class=' subLikeIt'  width=' 5%' >잇자!<br>"+data.subArticleList[i].subArticleLike+"</td>"+
							"<td class=' reportIt'  width=' 5%' >신고</td>"+
						"</tr>";		
	
				}
			}
			$('.subTable').html(subAtricleOrder);
			}

		});
		$('#cardDetailView .modal-title').text(title);
		$('.cardDetailViewContent').text(content);
		
	});
	$('.memberLogin').click(function(){
		$('#loginModal').modal({
			//취소버튼으로만 창을 끌 수 있도록 지정
			backdrop: 'static',
			keyboard: false
		});
		//다시 모달창을 열었을 대 첫 화면 띄움
	});
	/*
	 * 회원이 글쓰기 폼을 열었을 때 인기 태그를 불러오는 에이잭스를 시작으로
	 * 글자수 제한을 위한 keyup이벤트 및 공란체크 그리고 서밋을 담고 잇다.
	 * */
	
	$('.openModalInsertArticleForm').click(function(){
		$.ajax({
			type:"post",
			url:"auth_openMainArticleModal.neon",
			dataType:"json",
			success:function(data){
				tagList = '';
				for(var i=0;i<data.length;i++){
					tagList += 
						'<label><input type="checkbox" name="tagName" value="'+data[i].tagName+'">#'+data[i].tagName+'</label>'+'&nbsp&nbsp&nbsp'
					if(i!=0){
						if(i%6==0){
							tagList +='<br>'
						}
					}
				}
				$('#writeMainArticle').modal({
					//취소버튼으로만 창을 끌 수 있도록 지정
					backdrop: 'static',
					keyboard: false
				});
				
				$('#writeMainArticle').on('shown.bs.modal', function () {
					$('#tagCheck').html(tagList);
					//태그는 2개까지 선택이 가능하도록 강제함
					$('input[name="tagName"]').on('click',function(){
						if($('input[name="tagName"]:checked').length>2){
							alert('태그는 2개 까지만 선택이 가능합니다.');
							$(this).attr("checked", false);
						}
					});
					//태그 공란 체크
					$('button[name="newMainArticleSubmit"]').click(function(){
						if($('input[name="tagName"]:checked').length<1){
							alert('태그는 1개 이상 선택해주세요.');
							return false;
						}
						//제목 공란체크
						if($('input[name="mainArticleTltle"]').val()==''){
							alert('글 제목을 입력해주세요');
							$('input[name="mainArticleTltle"]').focus();
							return false;
						}
						//글 내용 공란 체크
						if($('textarea[name="mainArticleContent"]').val()==''){
							alert('글 내용을 입력해주세요');
							 $('textarea[name="mainArticleContent"]').focus();
							 return false;
						}
						$('form[action="auth_insertNewMainArticle.neon"]').submit();
					});
					//주제글 작성 제한을 위한 keyUp 이벤트 - 글자수를 제한해준다.
					$('textarea[name="mainArticleContent"]').keyup(function(){
						function korTextCheck($str){
				            var str = $str;
				            var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
				            var result = str.match(check);
				            if(result) return true; //한글일 경우
				            return false; //한글이 아닐경우
				        }	
						var userWriting = $(this).val();
						var wrtingByte = 0;
						for(var i=0;i<userWriting.length;i++){
							//한글일 경우 2byte
							if(korTextCheck(userWriting.charAt(i))){
								wrtingByte += 2; 
							//영어일 경우 1byte
							}else{
								wrtingByte += 1; 
							}
							if(wrtingByte>400){
								$('textarea[name="mainArticleContent"]').val(userWriting.substring(0,400));
							}
						}
						$('.userLength').text(wrtingByte);
					});
					
				});
					
				
			}
		});
		
	});
	// 글쓰기 폼 끝
	
	//잇자 버튼 클릭 시
	$('.itja').click(function(){
		var formData = $($(this).next()).serialize();
		var itjaCountSpan = $(this).children('.itjaCount');
		$.ajax({
			type : "POST",
			url : "auth_itjaClick.neon",
			data : formData,
			success : function(data){
				alert(data.itjaCount+'잇자성공?'+data.itjaSuccess);
				if(data.itjaSuccess==1){
					itjaCountSpan.html('<i class="fa fa-chain-broken"></i><br>'+data.itjaCount);
				}else{
					itjaCountSpan.html('<i class="fa fa-link"></i><br>'+data.itjaCount);
				}
			}
		});
	});
	

	
	//매인 끝
	
	//index부분
	//회원 가입 모달창 띄우는 부분
	$('.memberJoinByEmailBtn').click(function(){
		$('#memberJoinByEmailModal').modal({
			//취소버튼으로만 창을 끌 수 있도록 지정
			backdrop: 'static',
			keyboard: false
		});
		//다시 모달창을 열었을 대 첫 화면 띄움
		$('.personInfoForJoin').show();
		$('.babyInfoForJoin').hide();
	});
	
	//모달 창 취소시 경고창 , 
	$('.InfoForJoinCancel').click(function(){
		if(confirm('정말 회원가입을 취소하시겠습니까 ?')){
			$( "#memberJoinByEmail" ).each( function () {
				$('#memberJoinByEmailModal').modal('hide');
				/**
				 * 꼼수의 느낌이 강하지만 소스를 아끼기위함이다.
				 * 실력이 부족해서 서버에 부하를 많이주고 있따.
				 * 열심히하자
				 */
				//폼 초기화를 위한 새로고침
				location.reload();
			});
		}else{
			return;
		};
	});
	/**
	 * 미완성  취소 시 입력 값 및 경고 모두 초기화 시키는 부분
	 */
	$('#memberJoinByEmailModal').on('hide.bs.modal', function () {
			$( "#memberJoinByEmail" ).each( function () {
				this.reset();
				location.reload();
			});
	});
	/**
	 * 미완성 모달 창이 열리는 순간 회원가입 유효성 검증 시작
	 */
	$('#memberJoinByEmailModal').on('show.bs.modal', function () {
			// 모든 입력 폼 마다 플래그를 줄 수 밖에 없는 건 내가 병신이라 그렇다.
			var userMailFlag = false;
			var userNameFlag = false;
			var userPassFlag = false;
			var userRePassFlag = false;
			
			/**
			 * - Ajax방식의 중복검사 추가해야함
			 */
			//공랑체크 시작
			//이메일 공란 및 정규식을 통한 형태 검사  
			$('#memberJoinInputEmail').keyup(function(){
					/** 이메일 중복체크 
					 * @author 한솔
					 */
					var regEmail=/^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
					var emailComp = $(this).val();
					if(emailComp==""){
						userMailFlag = false;
						$('.emailInput').attr('class','form-group has-feedback emailInput has-error');
						$('.emailInput > .control-label').html('이메일을 입력해주세요');
						$('.emailInput > .glyphicon').attr('class','glyphicon glyphicon-remove form-control-feedback');
					}else if(!regEmail.test(emailComp)){
						userMailFlag = false;
						$('.emailInput').attr('class','form-group has-feedback emailInput has-error');
						$('.emailInput > .control-label').html('올바른 이메일을 입력해주세요');
						$('.emailInput > .glyphicon').attr('class','glyphicon glyphicon-remove form-control-feedback');
					}else{
						$.ajax({
							type:"post",
							url:"findMemberByEmail.neon",				
							data:"emailComp="+emailComp,	
							success:function(result){
						if(result==false){
							userMailFlag = false;
						$('.emailInput').attr('class','form-group has-feedback emailInput has-error');
						$('.emailInput > .control-label').html('사용할 수 없는 이메일 입니다');
						$('.emailInput > .glyphicon').attr('class','glyphicon glyphicon-remove form-control-feedback');
						}else{
							userMailFlag = true;
						$('.emailInput').attr('class','form-group has-feedback emailInput has-success');
						$('.emailInput > .control-label').html('사용가능한 이메일 입니다');
						$('.emailInput > .glyphicon').attr('class','glyphicon glyphicon-ok form-control-feedback');
						}//else2
						}//success
					});//ajax
				}//else
			});//keyup
			//이름 공란 및 길이 체크
			
			$('#memberJoinInputName').keyup(function(){
				/**  닉네임 중복체크 
				 * @author 한솔
				 */

				var nameComp = $(this).val();
				if(nameComp==""){
					userNameFlag = false;
					$('.nameInput').attr('class','form-group has-feedback nameInput has-error');
					$('.nameInput > .control-label').html('닉네임을 입력해주세요');
					$('.nameInput > .glyphicon').attr('class','glyphicon glyphicon-remove form-control-feedback');
				}else if(nameComp.length<1 || nameComp.length>8){
					userNameFlag = false;
					$('.nameInput').attr('class','form-group has-feedback nameInput has-error');
					$('.nameInput > .control-label').html('닉네임은 1글자 이상 ~7글자 이하로 입력해주세요');
					$('.nameInput > .glyphicon').attr('class','glyphicon glyphicon-remove form-control-feedback');
				}else{					
					$.ajax({
						type:"post",
						url:"findMemberByNickName.neon",				
						data:"nameComp="+nameComp,	
						success:function(result){
							//	alert(result);
							if(result==false){
								 userNameFlag = false;
								$('.nameInput').attr('class','form-group has-feedback nameInput has-error');
								$('.nameInput > .control-label').html(nameComp+"사용할수 없는 닉네임 입니다.");
								$('.nameInput > .glyphicon').attr('class','glyphicon glyphicon-remove form-control-feedback');
								  
							}else{
								 userNameFlag = true;
								$('.nameInput').attr('class','form-group has-feedback nameInput has-success');
								$('.nameInput > .control-label').html(nameComp+"사용 가능한 닉네임 입니다");	
								$('.nameInput > .glyphicon').attr('class','glyphicon glyphicon-ok form-control-feedback');
								   
							}//else2			
						}//success			
					});//ajax
				
				}//else1
			
			});//keyup
			//암호 공란 검사 및 암호 길이 검사
			$('#memberJoinInputpassword').keyup(function(){
				var passwordComp = $(this).val();
				if(passwordComp==""){
					userPassFlag = false;
					$('.passInput').attr('class','form-group has-feedback passInput has-error');
					$('.passInput > .control-label').html('암호를 입력해주세요');
					$('.passInput > .glyphicon').attr('class','glyphicon glyphicon-remove form-control-feedback');
				}else if(passwordComp.length<8 || passwordComp.length>19){
					userPassFlag = false;
					$('.passInput').attr('class','form-group has-feedback passInput has-error');
					$('.passInput > .control-label').html('암호는 7글자 이상 ~18글자 이하로 입력해주세요');
					$('.passInput > .glyphicon').attr('class','glyphicon glyphicon-remove form-control-feedback');
				}else{
					userPassFlag = true;
					$('.passInput').attr('class','form-group has-feedback passInput has-success');
					$('.passInput > .control-label').html('압호가 입력되었습니다.');
					$('.passInput > .glyphicon').attr('class','glyphicon glyphicon-ok form-control-feedback');
				};
			});
			//암호확인 공란 검사 및 암호확인 길이 검사 및 암호와 암호확인 값 비교
			$('#memberJoinInputRePassword').keyup(function(){
				var passComp = $('#memberJoinInputpassword').val();
				var rePasswordComp = $(this).val();
				if(rePasswordComp==""){
					userRePassFlag = false;
					$('.rePassInput').attr('class','form-group has-feedback rePassInput has-error');
					$('.rePassInput > .control-label').html('암호를 확인해주세요');
					$('.rePassInput > .glyphicon').attr('class','glyphicon glyphicon-remove form-control-feedback');
				}else if(rePasswordComp.length<8 || rePasswordComp.length>19){
					userRePassFlag = false;
					$('.rePassInput').attr('class','form-group has-feedback rePassInput has-error');
					$('.rePassInput > .control-label').html('암호는 7글자 이상 ~18글자 이하로 입력해주세요');
					$('.rePassInput > .glyphicon').attr('class','glyphicon glyphicon-remove form-control-feedback');
				}else if(passComp!=rePasswordComp){
					userRePassFlag = false;
					$('.rePassInput').attr('class','form-group has-feedback rePassInput has-error');
					$('.rePassInput > .control-label').html('암호확인이 제대로 이루어지지 않았습니다.');
					$('.rePassInput > .glyphicon').attr('class','glyphicon glyphicon-remove form-control-feedback');
				}else{
					userRePassFlag = true;
					$('.rePassInput').attr('class','form-group has-feedback rePassInput has-success');
					$('.rePassInput > .control-label').html('압호가 입력되었습니다.');
					$('.rePassInput > .glyphicon').attr('class','glyphicon glyphicon-ok form-control-feedback');
				};
			});
			
			//전송 전 유효성 체크 시발
			$('#submitInfo').click(function(){
				if(userMailFlag){
					if(userNameFlag){
						if(userPassFlag){
							if(userRePassFlag){
								$('#memberJoinByEmail').submit();
							}
						}
					}
				}	
			});
			
		});//모달 유효성 체크
	//로그아웃 confirm
	$("#memberLogout").click(function(){
		if(confirm("로그아웃하시겠습니까?")){
			location.href="memberLogout.neon";
		}else{
			return false;
		}
	});
 	if($("#logout").val()=="0"){
		alert("이메일과 비밀번호가 맞지 않습니다.");
		
	} 
});//document.ready
	
