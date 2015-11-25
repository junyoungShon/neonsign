$(document).ready(function(){ //DOM이 준비되고
	
	//main 부분
	//무한 스크롤 (테스트 완료 ajax와 연동 필요)
	// hipster 카드에서 동적으로 style을 입혀주지 못하는 문제점이 있어서 반드시 소스를 넣을 때 style을 수기로 기록해줘야함
	function loadingItjaCard()
	{  
		var infinityScrollTestSource = 
			'<div class="card-box col-md-4"><div class="card card-with-border" data-background="image" data-src="img/snow.jpg" style="background-image: url(img/snow.jpg); background-size: cover; background-position: 50% 50%;"><div class="content"><h6 class="category">#소설,#로맨스,#스릴러,#호갱</h6><br><h4 class="title">[미완]군인인데 눈이 엄청왔다</h4> <p class="description">올해 37살 되는 남자입니다. 아직 군대에 있는데눈이 엄청나게 왔네요 정말 슬퍼요 </p><div class="actions"><button class="btn btn-round btn-fill btn-neutral btn-modern" data-toggle="modal" data-target="#cardDetailView">Read Article</button></div><div class="social-line social-line-visible" data-buttons="4"><button class="btn btn-social btn-pinterest">05:22<br>빨리!</button><button class="btn btn-social btn-twitter">127it<br>잇자!</button><button class="btn btn-social btn-google"><i class="fa fa-heart-o"></i><br>찜하자!</button><button class="btn btn-social btn-facebook"><i class="fa fa-facebook-official"></i><br>공유하자!</button></div>  <!-- end social-line social-line-visible --></div></div> <!-- end card --></div><!-- card-box col-md-4 -->'
				
		$('.ajaxLoader').fadeOut(300);
		$('.newItjaList').append(infinityScrollTestSource)
		$('.newItjaList').append(infinityScrollTestSource)
		$('.newItjaList').append(infinityScrollTestSource)
		$('.newItjaList').append(infinityScrollTestSource)
		$('.newItjaList').append(infinityScrollTestSource)
	};  
	
	$(window).scroll(function(){  
	        if  ($(window).scrollTop() == $(document).height() - $(window).height()){  
	        	
	           setTimeout(function(){loadingItjaCard();}, 800)
	        }  
	});  
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
		var writersId =  $(this).parent().siblings().eq(4).text()
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
	$('.writeMainArticle').click(function(){
		$('#writeMainArticle').modal({
			//취소버튼으로만 창을 끌 수 있도록 지정
			backdrop: 'static',
			keyboard: false
		});
		//다시 모달창을 열었을 대 첫 화면 띄움
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
						userMailFlag = true;
						$('.emailInput').attr('class','form-group has-feedback emailInput has-success');
						$('.emailInput > .control-label').html('이메일이 입력되었습니다.');
						$('.emailInput > .glyphicon').attr('class','glyphicon glyphicon-ok form-control-feedback');
					};
			});
			//이름 공란 및 길이 체크
			
			$('#memberJoinInputName').keyup(function(){
				var nameComp = $(this).val();
				if(nameComp==""){
					userNameFlag = false;
					$('.nameInput').attr('class','form-group has-feedback nameInput has-error');
					$('.nameInput > .control-label').html('이름을 입력해주세요');
					$('.nameInput > .glyphicon').attr('class','glyphicon glyphicon-remove form-control-feedback');
				}else if(nameComp.length<1 || nameComp.length>8){
					userNameFlag = false;
					$('.nameInput').attr('class','form-group has-feedback nameInput has-error');
					$('.nameInput > .control-label').html('이름은 1글자 이상 ~7글자 이하로 입력해주세요');
					$('.nameInput > .glyphicon').attr('class','glyphicon glyphicon-remove form-control-feedback');
				}else{
					userNameFlag = true;
					$('.nameInput').attr('class','form-group has-feedback nameInput has-success');
					$('.nameInput > .control-label').html('이름이 입력되었습니다.');
					$('.nameInput > .glyphicon').attr('class','glyphicon glyphicon-ok form-control-feedback');
				};
			});
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
});//document.ready
	
