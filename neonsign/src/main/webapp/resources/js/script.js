$(document).ready(function(){ //DOM이 준비되고
	//타이머
	window.setInterval(function(){
		//날짜 형식
		// 2015-12-03 13:05:17
		var updateDates = $('.updateDate');
		var bestMainArticleSNo = $('.bestMainArticleNo'); 
		for(var i=0;i<updateDates.length;i++){
			//현재 시간	
			var currunt_date = new Date();
			var currunt_timestamp = Math.floor(currunt_date.getTime()/1000)
			var updateYear = $(updateDates[i]).val().substring(0,4);
			var updateMonth = $(updateDates[i]).val().substring(5,7);
			var updateDay =$(updateDates[i]).val().substring(8,10);
			var updateHour=$(updateDates[i]).val().substring(11,13);;
			var updateMinute =$(updateDates[i]).val().substring(14,16);
			var second= $(updateDates[i]).val().substring(17,19);
			//완결 시간(서버에서 최종 수정시간을  받아와옴)
			var update_date = new Date(updateYear, (updateMonth-1), updateDay, updateHour, updateMinute, second);
			var update_date_timestamp = Math.floor(update_date.getTime()/1000);
			//투표 마감 시간(10분)
			var close_timestamp = update_date_timestamp+60;
			//
			var remind_timestamp = close_timestamp-currunt_timestamp
			var remind_minutes = Math.floor(remind_timestamp/60);
			var remind_seconds = remind_timestamp%60;
			if(remind_minutes >= 1 && remind_seconds>=10) {
				$('.time_area').eq(i).html(remind_minutes+':'+remind_seconds+'<br>빨리!');
			} else if(remind_minutes == 0 && remind_seconds<=9){
				$('.time_area').eq(i).html('00:0'+remind_seconds+'<br>빨리!');
			} else if(remind_minutes == 0 && remind_seconds>=10){
				$('.time_area').eq(i).html('00:'+remind_seconds+'<br>빨리!');
			}
			var bestMainArticleNo = $('.bestMainArticleNo').eq(i).val();
			if(remind_seconds==0){
				$('.updateDate').eq(i).parent().attr('class','hide-card-box')
				
				/*$.ajax({
					type : "POST",
					url : "storyLinking.neon",
					data : "mainArticleNo="+bestMainArticleNo,
					dataType:"json",
					success : function(data){
						if(data.result=="complete"){
							var msg = bestMainArticleNo+
					          "번이 완결되었습니다. 바로 확인 하실래요?<br/><br/>"+
					          "<center><button class='closeToast' "+
					          "onclick='detailItjaView(mainArticleNO"+bestMainArticleNo+");'>Ok</button> "+
					          "<button class='closeToast'>Cancel</button>";
							$('.time_area').eq(i).html('새로고침<br>필요');
						}else if(data.result="continue"){
							"번 주제글에 새로운 잇자 타임이 시작되었습니다. 바로 참여 하실래요?<br/><br/>"+
					          "<center><button class='closeToast' "+
					          "onclick='detailItjaView(mainArticleNO"+bestMainArticleNo+");'>Ok</button> "+
					          "<button class='closeToast'>Cancel</button>";
							alert( $('.updateDate').val());
							$('.time_area').eq(i).html('새로고침<br>필요');
						}
						$().toasty({
						    autoHide: 2000,
						    message: msg,
						    modal: false
						});
					}
				});*/
				
			}
		}
	}, 1000);
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
		//현재 페이지 아래 붙을 내용물을 담는다 -대협-
		var infinityScrollTestSource = "";
		//주제글 제목을 담는다 -대협-
		var mainArticleTitle = "";
		//주제글 내용을 담는다 -대협-
		var mainArticleContent = "";
		//불러올 주제글이 더이상 없을때 멈추게한다. -대협-
		if($("#articleEnd").val()!='end'){
			//불러올 주제글의 종류를 구분한다. -대협-
		if($("#articleType").val()=='completeArticle'){
			//카드박스의 갯수로 현재 화면에 있는 주제글 갯수를 파악한다. -대협-
			var cardBox=$(".card-box[name=completeCardBox]").length;
			//현재 카드갯수를 9로 나누고 올림을 하여 현재페이지를 파악한다. -대협-
			var pageNo=Math.ceil((cardBox/9)+1);
			//정렬방식을 담는다. -대협-
			var orderByComp = $("#orderBy").val();
			var tagName = $("#tagName").val();
			$.ajax({
				type:"get",
				url:"getCompleteMainArticle.neon?pageNo="+pageNo+"&tagName="+tagName+"&orderBy="+orderByComp,
				dataType:"json",
				success:function(data){
					if(data.completeMainArticleArrayList.length!=0){
					for(var i=0; i<data.completeMainArticleArrayList.length; i++){
						//타이틀 길이제한 조건문
						if(data.completeMainArticleArrayList[i].mainArticleTitle.length>12){
							mainArticleTitle = data.completeMainArticleArrayList[i].mainArticleTitle.substring(0,12) + " ...";
						}else{
							mainArticleTitle = data.completeMainArticleArrayList[i].mainArticleTitle;
						}
						//내용 길이제한 조건문
						if(data.completeMainArticleArrayList[i].mainArticleContent.length>18){
							mainArticleContent = data.completeMainArticleArrayList[i].mainArticleContent.substring(0,15) + " ...";
						}else{
							mainArticleContent = data.completeMainArticleArrayList[i].mainArticleContent;
						}
						//잇자버튼을 위한 조건문
						var mainLikeItHTML="";
						  if(data.itjaMemberList!=null){
              					var flag=true;
              					for(var j=0;j<data.itjaMemberList.length;j++){
              						if(data.itjaMemberList[j].mainArticleNo == data.completeMainArticleArrayList[i].mainArticleNo){
              							mainLikeItHTML 
              							='<button class="btn btn-social btn-twitter itja">'
              							+'<span class="itjaCount"><i class="fa fa-link"></i><br>'+data.completeMainArticleArrayList[i].mainArticleTotalLike+' it</span></button>'
              							+'<form name="itJaInfo"><input type="hidden" name="memberEmail" value="'+data.itjaMemberList[0].memberEmail
              							+'"><input type="hidden" name="mainArticleNo" value="'+data.completeMainArticleArrayList[i].mainArticleNo
              							+'"><input type="hidden" name="subArticleNo" value=0></form></button>'
              							flag=false;
              							break;
              						}	
              					}
              					if(flag){
              						mainLikeItHTML 
              						='<button class="btn btn-social btn-twitter itja">'+
              						'<span class="itjaCount"><i class="fa fa-chain-broken"></i><br>'+data.completeMainArticleArrayList[i].mainArticleTotalLike+' it</span></button>'+
              						'<form name="itJaInfo"><input type="hidden" name="memberEmail" value="'+data.itjaMemberList[0].memberEmail
              						+'"><input type="hidden" name="mainArticleNo" value="'+data.completeMainArticleArrayList[i].mainArticleNo
              						+'"><input type="hidden" name="subArticleNo" value=0></form></button>'
              					}
              				}
              				if(mainLikeItHTML==""){
              					mainLikeItHTML = 
              						'<button class="btn btn-social btn-twitter itja">'+
              						'<span class="itjaCount"><i class="fa fa-chain-broken"></i><br>'+data.completeMainArticleArrayList[i].mainArticleTotalLike+' it</span></button>'
              				}
              				//잇자버튼 조건 문 끝
						//추가될 카드 html문
						infinityScrollTestSource +=
							'<div class="card-box col-md-4" name="completeCardBox">' 
							+ '<div class="card card-with-border" data-background="image" data-src="resources/img/snow.jpg" style="background-image: url(resources/img/snow.jpg); background-size: cover; background-position: 50% 50%;">' 
							+ '<div class="content">' 
							+ '<h6 class="category">' + data.completeMainArticleArrayList[i].tagName + '</h6><br>' 
							+ '<h5 class="title">[완결]' + mainArticleTitle + '</h5>' 
							+ ' <p class="description">' + mainArticleContent + '</p>' 
							+ '<span class="writersNickName">- '+data.completeMainArticleArrayList[i].memberVO.memberNickName+' -</span>'
							+ '<input type="hidden" name="">'
							+ '<input type="hidden" class="mainArticleTitleNO" value="'+ data.completeMainArticleArrayList[i].mainArticleNo +'">'
							+ '<div class="actions">' 
							+ '<button class="btn btn-round btn-fill btn-neutral btn-modern" data-toggle="modal" data-target="#cardDetailView">Read Article</button>' 
							+ '</div>' 
							+ '<div class="social-line social-line-visible" data-buttons="4">' 
							+ '<button class="btn btn-social btn-pinterest">완결된<br>잇자!</button>' 
							+  mainLikeItHTML
							+ '<button class="btn btn-social btn-google"><i class="fa fa-heart-o"></i><br>찜하자!</button>' 
							+ '<button class="btn btn-social btn-facebook"><i class="fa fa-facebook-official"></i><br>공유하자!</button>' 
							+ '</div>  <!-- end social-line social-line-visible --></div></div> <!-- end card --></div><!-- card-box col-md-4 -->'
					}
					}else{
						infinityScrollTestSource +=
							'<div><hr><h4>마지막 주제글입니다!</h4>'
							+ '<input type="hidden" id="articleEnd" value="end"><hr></div>'
					}
					$('.ajaxLoader').fadeOut(300);
					$('.completeItjaList').append(infinityScrollTestSource);
				}
			});
		}else if($("#articleType").val()=='mainArticle'){ 
			var cardBox=$(".card-box[name=newCardBox]").length;
			var pageNo=Math.ceil((cardBox/9)+1);
			//정렬방식을 담는다. -대협-
			var orderByComp = $("#orderBy").val();
			var tagName = $("#tagName").val();
				$.ajax({
					type:"post",
					url:"getNewMainArticle.neon?pageNo="+pageNo+"&tagName="+tagName+"&orderBy="+orderByComp,
					dataType:"json",
					success:function(data){
						if(data.newMainArticleArrayList.length!=0){
						for(var i=0; i<data.newMainArticleArrayList.length; i++){
							//타이틀 길이제한 조건문
							if(data.newMainArticleArrayList[i].mainArticleTitle.length>12){
								mainArticleTitle = data.newMainArticleArrayList[i].mainArticleTitle.substring(0,12) + " ...";
							}else{
								mainArticleTitle = data.newMainArticleArrayList[i].mainArticleTitle;
							}
							//내용 길이제한 조건문
							if(data.newMainArticleArrayList[i].mainArticleContent.length>18){
								mainArticleContent = data.newMainArticleArrayList[i].mainArticleContent.substring(0,15) + " ...";
							}else{
								mainArticleContent = data.newMainArticleArrayList[i].mainArticleContent;
							}
							//잇자버튼을 위한 조건문
							var mainLikeItHTML="";
							if(data.itjaMemberList!=null){
								var flag=true;
	              			for(var j=0;j<data.itjaMemberList.length;j++){
	              				if(data.itjaMemberList[j].mainArticleNo == data.newMainArticleArrayList[i].mainArticleNo){
	              					mainLikeItHTML 
	              					='<button class="btn btn-social btn-twitter itja">'
	              					+'<span class="itjaCount"><i class="fa fa-link"></i><br>'+data.newMainArticleArrayList[i].mainArticleTotalLike+' it</span></button>'
	              					+'<form name="itJaInfo"><input type="hidden" name="memberEmail" value="'+data.itjaMemberList[0].memberEmail
	              					+'"><input type="hidden" name="mainArticleNo" value="'+data.newMainArticleArrayList[i].mainArticleNo
	           						+'"><input type="hidden" name="subArticleNo" value=0></form></button>'
	      							flag=false;
	       							break;
	      						}	
	       					}
	        				if(flag){
	           					mainLikeItHTML 
	           					='<button class="btn btn-social btn-twitter itja">'+
	           					'<span class="itjaCount"><i class="fa fa-chain-broken"></i><br>'+data.newMainArticleArrayList[i].mainArticleTotalLike+' it</span></button>'+
	          					'<form name="itJaInfo"><input type="hidden" name="memberEmail" value="'+data.itjaMemberList[0].memberEmail
	           					+'"><input type="hidden" name="mainArticleNo" value="'+data.newMainArticleArrayList[i].mainArticleNo
	           					+'"><input type="hidden" name="subArticleNo" value=0></form></button>'
	           					}
	           				}
	            			if(mainLikeItHTML==""){
	            				mainLikeItHTML = 
	          					'<button class="btn btn-social btn-twitter itja">'+
	           					'<span class="itjaCount"><i class="fa fa-chain-broken"></i><br>'+data.newMainArticleArrayList[i].mainArticleTotalLike+' it</span></button>'
	             			}
							
							
							//추가될 카드 html문
							infinityScrollTestSource +=
								'<div class="card-box col-md-4" name="newCardBox">' 
								+ '<div class="card card-with-border" data-background="image" data-src="resources/img/snow.jpg" style="background-image: url(resources/img/snow.jpg); background-size: cover; background-position: 50% 50%;">' 
								+ '<div class="content">' 
								+ '<h6 class="category">' + data.newMainArticleArrayList[i].tagName + '</h6><br>' 
								+ '<h5 class="title">[미완]' + mainArticleTitle + '</h5>' 
								+ ' <p class="description">' + mainArticleContent + '</p>' 
								+ '<span class="writersNickName">- '+data.newMainArticleArrayList[i].memberVO.memberNickName+' -</span>'
								+ '<input type="hidden" class="mainArticleTitleNO" value="'+ data.newMainArticleArrayList[i].mainArticleNo +'">'
								+ '<div class="actions">'
								+ '<button class="btn btn-round btn-fill btn-neutral btn-modern" data-toggle="modal" data-target="#cardDetailView">Read Article</button>' 
								+ '</div>' 
								+ '<div class="social-line social-line-visible" data-buttons="4">' 
								+ '<button class="btn btn-social btn-pinterest">05:22<br> 빨리!</button>' 
								+  mainLikeItHTML
								+ '<button class="btn btn-social btn-google"><i class="fa fa-heart-o"></i><br>찜하자!</button>' 
								+ '<button class="btn btn-social btn-facebook"><i class="fa fa-facebook-official"></i><br>공유하자!</button>' 
								+ '</div>  <!-- end social-line social-line-visible --></div></div> <!-- end card --></div><!-- card-box col-md-4 -->'
						}
						}else{
							infinityScrollTestSource +=
								'<div><hr><h4>마지막 주제글입니다!</h4>'
								+ '<input type="hidden" id="articleEnd" value="end"><hr></div>'
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
		$(this).attr('class','tag-mouseon');
	},function(){
		$(this).attr('class','tag-mouseoff');
	});
	
	$('.tags-container>span').click(function(){
		var tagName = $(this);
		var infinityScrollTestSource = "";
		$("#getNowTagName").html('<h4>'+tagName.text()+' 잇자 검색결과</h4>');
		tagName.attr('class','tag-active');
		if($("#articleType").val()=="completeArticle"){
			$.ajax({
				type:"post",
				url:"getCompleteMainArticle.neon?pageNo=1"+"&tagName="+tagName.text().substring(1)+"&orderBy=tag",
				dataType:"json",
				success:function(data){
					infinityScrollTestSource += 
						'<input type="hidden" id="orderBy" value="tag"><input type="hidden" id="tagName" value="'+tagName.text().substring(1)+'">';
					for(var i=0; i<data.completeMainArticleArrayList.length; i++){
						//타이틀 길이제한 조건문
						if(data.completeMainArticleArrayList[i].mainArticleTitle.length>12){
							mainArticleTitle = data.completeMainArticleArrayList[i].mainArticleTitle.substring(0,12) + " ...";
						}else{
							mainArticleTitle = data.completeMainArticleArrayList[i].mainArticleTitle;
						}
						//내용 길이제한 조건문
						if(data.completeMainArticleArrayList[i].mainArticleContent.length>18){
							mainArticleContent = data.completeMainArticleArrayList[i].mainArticleContent.substring(0,15) + " ...";
						}else{
							mainArticleContent = data.completeMainArticleArrayList[i].mainArticleContent;
						}
						//잇자버튼을 위한 조건문
						var mainLikeItHTML="";
						  if(data.itjaMemberList!=null){
              					var flag=true;
              					for(var j=0;i<data.itjaMemberList.length;j++){
              						if(data.itjaMemberList[j].mainArticleNo == data.completeMainArticleArrayList[i].mainArticleNo){
              							mainLikeItHTML 
              							='<button class="btn btn-social btn-twitter itja">'
              							+'<span class="itjaCount"><i class="fa fa-link"></i><br>'+data.completeMainArticleArrayList[i].mainArticleTotalLike+' it</span></button>'
              							+'<form name="itJaInfo"><input type="hidden" name="memberEmail" value="'+data.itjaMemberList[0].memberEmail
              							+'"><input type="hidden" name="mainArticleNo" value="'+data.completeMainArticleArrayList[i].mainArticleNo
              							+'"><input type="hidden" name="subArticleNo" value=0></form></button>'
              							flag=false;
              							break;
              						}	
              					}
              					if(flag){
              						mainLikeItHTML 
              						='<button class="btn btn-social btn-twitter itja">'
              						+'<span class="itjaCount"><i class="fa fa-chain-broken"></i><br>'+data.completeMainArticleArrayList[i].mainArticleTotalLike+' it</span></button>'
              						+'<form name="itJaInfo"><input type="hidden" name="memberEmail" value="'+data.itjaMemberList[0].memberEmail
              						+'"><input type="hidden" name="mainArticleNo" value="'+data.completeMainArticleArrayList[i].mainArticleNo
              						+'"><input type="hidden" name="subArticleNo" value=0></form></button>'
              					}
              				}
              				if(mainLikeItHTML==""){
              					mainLikeItHTML = 
              						'<button class="btn btn-social btn-twitter itja">'+
              						'<span class="itjaCount"><i class="fa fa-chain-broken"></i><br>'+data.completeMainArticleArrayList[i].mainArticleTotalLike+' it</span></button>'
              				}
              				//잇자버튼 조건 문 끝
						
						//추가될 카드 html문
						infinityScrollTestSource +=
							'<div class="card-box col-md-4" name="completeCardBox">'
							+ '<div class="card card-with-border" data-background="image" data-src="resources/img/snow.jpg" style="background-image: url(resources/img/snow.jpg); background-size: cover; background-position: 50% 50%;">' 
							+ '<div class="content">' 
							+ '<h6 class="category">' + data.completeMainArticleArrayList[i].tagName + '</h6><br>' 
							+ '<h5 class="title">[완결]' + mainArticleTitle + '</h5>' 
							+ ' <p class="description">' + mainArticleContent + '</p>' 
							+ '<span class="writersNickName">- '+data.completeMainArticleArrayList[i].memberVO.memberNickName+' -</span>'
							+ '<input type="hidden" class="mainArticleTitleNO" value="'+ data.completeMainArticleArrayList[i].mainArticleNo +'">'
							+ '<div class="actions">'
							+ '<button class="btn btn-round btn-fill btn-neutral btn-modern" data-toggle="modal" data-target="#cardDetailView">Read Article</button>' 
							+ '</div>' 
							+ '<div class="social-line social-line-visible" data-buttons="4">' 
							+ '<button class="btn btn-social btn-pinterest">05:22<br> 빨리!</button>' 
							+  mainLikeItHTML 
							+ '<button class="btn btn-social btn-twitter">' + data.completeMainArticleArrayList[i].mainArticleTotalLike + '<br>잇자!</button>' 
							+ '<button class="btn btn-social btn-google"><i class="fa fa-heart-o"></i><br>찜하자!</button>' 
							+ '<button class="btn btn-social btn-facebook"><i class="fa fa-facebook-official"></i><br>공유하자!</button>' 
							+ '</div>  <!-- end social-line social-line-visible --></div></div> <!-- end card --></div><!-- card-box col-md-4 -->'
					}
					$('.ajaxLoader').fadeOut(300);
					$('.completeItjaList').html(infinityScrollTestSource);
				}
			});
		}else if($("#articleType").val()=="mainArticle"){
			$.ajax({
				type:"post",
				url:"getNewMainArticle.neon?pageNo=1"+"&tagName="+tagName.text().substring(1)+"&orderBy=tag",
				dataType:"json",
				success:function(data){
					infinityScrollTestSource += 
						'<input type="hidden" id="orderBy" value="tag"><input type="hidden" id="tagName" value="'+tagName.text().substring(1)+'">';
					for(var i=0; i<data.newMainArticleArrayList.length; i++){
						//타이틀 길이제한 조건문
						if(data.newMainArticleArrayList[i].mainArticleTitle.length>12){
							mainArticleTitle = data.newMainArticleArrayList[i].mainArticleTitle.substring(0,12) + " ...";
						}else{
							mainArticleTitle = data.newMainArticleArrayList[i].mainArticleTitle;
						}
						//내용 길이제한 조건문
						if(data.newMainArticleArrayList[i].mainArticleContent.length>18){
							mainArticleContent = data.newMainArticleArrayList[i].mainArticleContent.substring(0,15) + " ...";
						}else{
							mainArticleContent = data.newMainArticleArrayList[i].mainArticleContent;
						}
						//잇자버튼을 위한 조건문
						var mainLikeItHTML="";
						  if(data.itjaMemberList!=null){
              					var flag=true;
              					for(var j=0;i<data.itjaMemberList.length;j++){
              						if(data.itjaMemberList[j].mainArticleNo == data.newMainArticleArrayList[i].mainArticleNo){
              							mainLikeItHTML 
              							='<button class="btn btn-social btn-twitter itja">'
              							+'<span class="itjaCount"><i class="fa fa-link"></i><br>'+data.newMainArticleArrayList[i].mainArticleTotalLike+' it</span></button>'
              							+'<form name="itJaInfo"><input type="hidden" name="memberEmail" value="'+data.itjaMemberList[0].memberEmail
              							+'"><input type="hidden" name="mainArticleNo" value="'+data.newMainArticleArrayList[i].mainArticleNo
              							+'"><input type="hidden" name="subArticleNo" value=0></form></button>'
              							flag=false;
              							break;
              						}	
              					}
              					if(flag){
              						mainLikeItHTML 
              						='<button class="btn btn-social btn-twitter itja">'
              						+'<span class="itjaCount"><i class="fa fa-chain-broken"></i><br>'+data.newMainArticleArrayList[i].mainArticleTotalLike+' it</span></button>'
              						+'<form name="itJaInfo"><input type="hidden" name="memberEmail" value="'+data.itjaMemberList[0].memberEmail
              						+'"><input type="hidden" name="mainArticleNo" value="'+data.newMainArticleArrayList[i].mainArticleNo
              						+'"><input type="hidden" name="subArticleNo" value=0></form></button>'
              					}
              				}
              				if(mainLikeItHTML==""){
              					mainLikeItHTML = 
              						'<button class="btn btn-social btn-twitter itja">'+
              						'<span class="itjaCount"><i class="fa fa-chain-broken"></i><br>'+data.newMainArticleArrayList[i].mainArticleTotalLike+' it</span></button>'
              				}
              				//잇자버튼 조건 문 끝
						//추가될 카드 html문
						infinityScrollTestSource +=
							'<div class="card-box col-md-4" name="newCardBox">' 
							+ '<div class="card card-with-border" data-background="image" data-src="resources/img/snow.jpg" style="background-image: url(resources/img/snow.jpg); background-size: cover; background-position: 50% 50%;">' 
							+ '<div class="content">' 
							+ '<h6 class="category">' + data.newMainArticleArrayList[i].tagName + '</h6><br>' 
							+ '<h5 class="title">[미완]' + mainArticleTitle + '</h5>' 
							+ ' <p class="description">' + mainArticleContent + '</p>' 
							+ '<span class="writersNickName">- '+data.newMainArticleArrayList[i].memberVO.memberNickName+' -</span>'
							+ '<input type="hidden" class="mainArticleTitleNO" value="'+ data.newMainArticleArrayList[i].mainArticleNo +'">'
							+ '<div class="actions">'
							+ '<button class="btn btn-round btn-fill btn-neutral btn-modern" data-toggle="modal" data-target="#cardDetailView">Read Article</button>' 
							+ '</div>' 
							+ '<div class="social-line social-line-visible" data-buttons="4">' 
							+ '<button class="btn btn-social btn-pinterest">05:22<br> 빨리!</button>' 
							+  mainLikeItHTML
							+ '<button class="btn btn-social btn-google"><i class="fa fa-heart-o"></i><br>찜하자!</button>' 
							+ '<button class="btn btn-social btn-facebook"><i class="fa fa-facebook-official"></i><br>공유하자!</button>' 
							+ '</div>  <!-- end social-line social-line-visible --></div></div> <!-- end card --></div><!-- card-box col-md-4 -->'
					}
					$('.ajaxLoader').fadeOut(300);
					$('.newItjaList').html(infinityScrollTestSource);
				}
			});
		}
	});	
	
	/**cardDetailView
	 * 카드 클릭시 상세 페이지 보기위해 모달 창열기
	 */
	//디테일 뷰 잇던 자리
	
	//페이지 로딩시 이미 존재하던 카드 디테일 뷰 
	$('.actions :button').on('click',function(){
		var mainArticleNO =  $(this).parent().siblings().eq(5).val();
		detailItjaView(mainArticleNO);
	});
	//무한 스크롤에 의해 새로 로딩된 카드 디테일 뷰
/*	$('.newItjaList').on('mousemove',$('.actions :button'),function(){
		$('.actions :button').click(function(){
			var mainArticleNO =$(this).parent().siblings().eq(5).val();
			detailItjaView(mainArticleNO);
		});
	});*/
	
	//디테일 뷰 함수 정의
	function detailItjaView(mainArticleNO){
		//var mainArticleTitleNO=$(".mainArticleTitleNO").val();
		var subAtricleOrder="";
		var ItjaMemberForm='<form name="itJaInfo">';
		$.ajax({
			type:"post",
			url:"selectOneNotCompleteMainArticleByMainArticleNo.neon",
			data:"mainArticleNo="+mainArticleNO,
			dataType:"json",
			success:function(data){
				var mainLikeItHTML = "";
				var modalFooterLikeHTML = "";
				var subArticleWriteFormHTML = "";
				if(data.itjaMemberList!=null){
					var flag=true;
					for(var i=0;i<data.itjaMemberList.length;i++){
						if(data.itjaMemberList[i].mainArticleNo == mainArticleNO){
							
							mainLikeItHTML 
							='<button class="btn btn-social btn-twitter itja">'
							+'<span class="itjaCount"><i class="fa fa-link"></i><br>'+data.mainArticle.mainArticleLike+'it</span></button>'
							
							
							modalFooterLikeHTML 
							='<div class="social-line social-line-visible" data-buttons="4"><button class="btn btn-social btn-pinterest">05:22<br>빨리!</button>'
							+'<button class="btn btn-social btn-twitter itja">'
							+'<span class="itjaCount"><i class="fa fa-link"></i><br>'+data.mainArticle.mainArticleTotalLike+'it</span></button>'
							+'<form name="itJaInfo"><input type="hidden" name="memberEmail" value="'+data.itjaMemberList[0].memberEmail
							+'"><input type="hidden" name="mainArticleNo" value="'+data.mainArticle.mainArticleNo
							+'"><input type="hidden" name="subArticleNo" value=0></form>'
							+'<button class="btn btn-social btn-google"><i class="fa fa-heart-o"></i><br>찜하자!</button>'
							+'<button class="btn btn-social btn-facebook"><i class="fa fa-facebook-official"></i><br>공유하자!</button></div>'
							
							subArticleWriteFormHTML
							='<span class=limitLength>잇자를 누르셨기 때문에 잇는글을 작성하실 수 있습니다! 사용자님의 잇는글 이후로 글을 이어갈지 결말 지을지 정해주세요!</span><br>'
							+'<textarea class="form-control" name="subArticleContent" rows="5" placeholder="잇는글을 입력해주세요 ! (200자로 제한됩니다.)"></textarea>'
							+'<input type="radio" id="radio1" name="isEnd" value="0" checked><label for="radio1">ing</label>'
							+'<input type="radio" id="radio2" name="isEnd" value="1"><label for="radio2">end</label>'
							+'<input type="hidden" name="memberEmail" value="'+data.itjaMemberList[0].memberEmail+'">'
							+'<input type="button" value="잇는글 쓰기" class="subArticleSubmit">'
							+'<input type="hidden" name="mainArticleNo" value="'+data.mainArticle.mainArticleNo+'">'
							+'<div class="limitLength">작성 후 잇자 10개시 베스트로 이동되며,타임체크가 발동됩니다!<span class="userLength"></span>Byte/400Byte</div>'
							
							flag=false;
							break;
						}	
					}
					if(flag){
						
						mainLikeItHTML 
						='<button class="btn btn-social btn-twitter itja">'+
						'<span class="itjaCount"><i class="fa fa-chain-broken"></i><br>'+data.mainArticle.mainArticleLike+'it</span></button>'+
						'<form name="itJaInfo"><input type="hidden" name="memberEmail" value="'+data.itjaMemberList[0].memberEmail
						+'"><input type="hidden" name="mainArticleNo" value="'+data.mainArticle.mainArticleNo
						+'"><input type="hidden" name="subArticleNo" value=0></form>'
						
						modalFooterLikeHTML 
						='<div class="social-line social-line-visible" data-buttons="4"><button class="btn btn-social btn-pinterest">05:22<br>빨리!</button><button class="btn btn-social btn-twitter itja">'+
						'<span class="itjaCount"><i class="fa fa-chain-broken"></i><br>'+data.mainArticle.mainArticleTotalLike+'it</span></button>'+
						'<form name="itJaInfoinModal"><input type="hidden" name="memberEmail" value="'+data.itjaMemberList[0].memberEmail
						+'"><input type="hidden" name="mainArticleNo" value="'+data.mainArticle.mainArticleNo
						+'"><input type="hidden" name="subArticleNo" value=0></form>'
						+'<button class="btn btn-social btn-google"><i class="fa fa-heart-o"></i><br>찜하자!</button>'
						+'<button class="btn btn-social btn-facebook"><i class="fa fa-facebook-official"></i><br>공유하자!</button></div>'
					}
				}
				if(mainLikeItHTML==""&&modalFooterLikeHTML==""){
					mainLikeItHTML = 
						'<button class="btn btn-social btn-twitter itja">'+
						'<span class="itjaCount"><i class="fa fa-chain-broken"></i><br>'+data.mainArticle.mainArticleLike+'it</span></button>'
					modalFooterLikeHTML = 
						'<div class="social-line social-line-visible" data-buttons="4"><button class="btn btn-social btn-pinterest">05:22<br>빨리!</button><button class="btn btn-social btn-twitter itja">'+
						'<span class="itjaCount"><i class="fa fa-chain-broken"></i><br>'+data.mainArticle.mainArticleTotalLike+'it</span></button>'
						+'<button class="btn btn-social btn-google"><i class="fa fa-heart-o"></i><br>찜하자!</button>'
						+'<button class="btn btn-social btn-facebook"><i class="fa fa-facebook-official"></i><br>공유하자!</button><div>';
				}
				
				
				
				//모달 창 하단에 찜하기,타임체크,잇자 , 공유버튼이 있다.
				$('.utilInDetailModal').html(modalFooterLikeHTML);
				
				//해당 글에 잇자를 클릭했을 경우 잇는글 폼이 열려있을 것이다.
				$('form[action="auth_writeSubArticle.neon"]').html(subArticleWriteFormHTML);
				$('#cardDetailView .modal-title').text(data.mainArticle.mainArticleTitle);
				$('.mainLikeIt').html(mainLikeItHTML);	

				$('.subTable').html("");
					var subAtricleGrade=0;
					var mainArticle="";
					//작성자가 쓴 주제글이 맨위로 넘어 온다
					$('.mainCardDetailViewContentNo').text(0);
					$('.mainCardDetailViewContent').text(data.mainArticle.mainArticleContent);
					$('.mainWritersNickNameAtDetail').text(data.mainArticle.memberVO.memberNickName);
					$('.reportIt').html("<button class='articleReport'><span><i class='fa fa-ban'></i></span></button>" +
							"<form id='subArticleInfo'><input type='hidden' name='mainArticleNo' value="
							+data.mainArticle.mainArticleNo+"></form>");
					var mainLikeItHTML = "";
					//이어진 글들은 작성자가 쓴 주제글 밑에 넘어간다
				for(var i=0; i<data.likingSubArticle.length;i++){
					var flag=true;
					if(data.itjaMemberList!=null){
						for(var j=0;j<data.itjaMemberList.length;j++){
							if(data.itjaMemberList[j].subArticleNo == data.likingSubArticle[i].subArticleNo){
								mainLikeItHTML 
								='<button class="btn btn-social btn-twitter itja">'
								+'<span class="itjaCount"><i class="fa fa-link"></i><br>'+data.likingSubArticle[i].subArticleLike+'it</span></button>'
								+'<form name="itJaInfo"><input type="hidden" name="memberEmail" value="'+data.itjaMemberList[0].memberEmail
								+'"><input type="hidden" name="mainArticleNo" value="'+data.mainArticle.mainArticleNo
								+'"><input type="hidden" name="subArticleNo" value='+data.likingSubArticle[i].subArticleNo+'></form>'
								flag=false;
								break;
							}
						}
						if(flag){
							mainLikeItHTML 
							='<button class="btn btn-social btn-twitter itja">'+
							'<span class="itjaCount"><i class="fa fa-chain-broken"></i><br>'+data.likingSubArticle[i].subArticleLike+'it</span></button>'+
							'<form name="itJaInfo"><input type="hidden" name="memberEmail" value="'+data.itjaMemberList[0].memberEmail
							+'"><input type="hidden" name="mainArticleNo" value="'+data.mainArticle.mainArticleNo
							+'"><input type="hidden" name="subArticleNo" value='+data.likingSubArticle[i].subArticleNo+'></form>'
						}
					}
					if(mainLikeItHTML==""){
						mainLikeItHTML = 
							'<button class="btn btn-social btn-twitter itja">'+
							'<span class="itjaCount"><i class="fa fa-chain-broken"></i><br>'+data.likingSubArticle[i].subArticleLike+'it</span></button>'
					}
					mainArticle=mainArticle+"<tr><td>"+(i+1)+"</td>"+
					"<td>"+data.likingSubArticle[i].subArticleContent+"</td>"+
					"<td>"+data.likingSubArticle[i].memberVO.memberNickName+"</td>"+
					"<td>"+mainLikeItHTML+"</td><td>신고</td><tr>";
				}
				$('#mainSubArticle').html(mainArticle);//이어진 글 할당
				//잇는글은 주제글 아래에 있는 잇는글 전용 테이블에 할당된다
				var mainLikeItHTML = "";
				if(data.subArticleVO.length==0){
					$('#subTable').html("<tr><td colspan='5'>작성한 잇는글이 없습니다</td></tr>");
				}else{
					for(var i=0; i<data.subArticleVO.length;i++){
						var flag = true;
						if(data.itjaMemberList!=null){
							for(var j=0;j<data.itjaMemberList.length;j++){
								if(data.itjaMemberList[j].subArticleNo == data.subArticleVO[i].subArticleNo){
									mainLikeItHTML 
									='<button class="btn btn-social btn-twitter itja">'
									+'<span class="itjaCount"><i class="fa fa-link"></i><br>'+data.subArticleVO[i].subArticleLike+'it</span></button>'
									+'<form name="itJaInfo"><input type="hidden" name="memberEmail" value="'+data.itjaMemberList[0].memberEmail
									+'"><input type="hidden" name="mainArticleNo" value="'+data.mainArticle.mainArticleNo
									+'"><input type="hidden" name="subArticleNo" value='+data.subArticleVO[i].subArticleNo+'></form>'
									flag=false;
									break;
								}
							}
							if(flag){
								mainLikeItHTML 
								='<button class="btn btn-social btn-twitter itja">'+
								'<span class="itjaCount"><i class="fa fa-chain-broken"></i><br>'+data.subArticleVO[i].subArticleLike+'it</span></button>'+
								'<form name="itJaInfo"><input type="hidden" name="memberEmail" value="'+data.itjaMemberList[0].memberEmail
								+'"><input type="hidden" name="mainArticleNo" value="'+data.mainArticle.mainArticleNo
								+'"><input type="hidden" name="subArticleNo" value='+data.subArticleVO[i].subArticleNo+'></form>'
							}
						}
						if(mainLikeItHTML==""){
							mainLikeItHTML = 
								'<button class="btn btn-social btn-twitter itja">'+
								'<span class="itjaCount"><i class="fa fa-chain-broken"></i><br>'+data.subArticleVO[i].subArticleLike+'it</span></button>'
						}
						subAtricleOrder=subAtricleOrder+"<tr><td>"+(i+1)+"</td><td>"+
						data.subArticleVO[i].subArticleContent+"</td><td>"+
						data.subArticleVO[i].memberVO.memberNickName+"</td><td>"+
						mainLikeItHTML+"<br>"+
						"</td><td><button class='articleReport'><span><i class='fa fa-ban'></i></span></button>"+
						"<form id='subArticleInfo'>"
						+"<input type='hidden' id='sub123' name='subArticleNo' value="+data.subArticleVO[i].subArticleNo
						+"><input type='hidden' name='mainArticleNo' value="+data.mainArticle.mainArticleNo
						+"></form></td></tr>";
					}
					$('#subTable').html(subAtricleOrder);
				}
			}
		});
	}
	//끝
	// 잇는글 신고 버튼 클릭시 실행되는 스크립트
	$('#subTable').on('click','.articleReport',function(){
		var email=$('#memberUserEmail').val();
		var subArticleNo=$('#sub123').val();
		if(confirm("해당글을 신고 하시겠습니까?")){
		
		var formData = $('#subArticleInfo').serialize()+'&memberEmail='+email+'&subArticleNo='+subArticleNo;
		$.ajax({
			beforeSend : function(xmlHttpRequest){
		           xmlHttpRequest.setRequestHeader("AJAX", "true");
		
			},
			type : "POST",
			url : "auth_ArticleReport.neon",
			data : formData,
			success : function(){
				alert("신고를 완료하였습니다.");

			},
			error:function(xhr, textStatus, error){
				if(xhr.status=="901"){
					if(confirm('로그인이 필요합니다. 가입하시겠어요?')){
						location.href="loginPage.neon"
					}
				}
			}
		});
		}
	});
	// 주제글 신고 버튼 클릭시 실행되는 스크립트
	$('.reportIt').on('click','.articleReport',function(){
		var email=$('#memberUserEmail').val();
		if(confirm("해당글을 신고 하시겠습니까?")){
			
		var formData = $('#subArticleInfo').serialize()+'&memberEmail='+email;
		$.ajax({
			beforeSend : function(xmlHttpRequest){
		           xmlHttpRequest.setRequestHeader("AJAX", "true");
		
			},
			type : "POST",
			url : "auth_ArticleReport.neon",
			data : formData,
			success : function(){
				alert("신고를 완료하였습니다.");
	
			},
			error:function(xhr, textStatus, error){
				if(xhr.status=="901"){
					if(confirm('로그인이 필요합니다. 가입하시겠어요?')){
						location.href="loginPage.neon"
					}
				}
			}
		});
		}
		
	});
	//잇는글 작성 제한을 위한 keyUp 이벤트 - 글자수를 제한해준다.
	$('form[action="auth_writeSubArticle.neon"]').on('keyup',$('textarea[name="subArticleContent"]'),function(){
		function korTextCheck($str){
            var str = $str;
            var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
            var result = str.match(check);
            if(result) return true; //한글일 경우
            return false; //한글이 아닐경우
        }	
		var userWriting = $('textarea[name="subArticleContent"]').val();
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
				 $('textarea[name="subArticleContent"]').val(userWriting.substring(0,400));
			}
		}
		$('.userLength').text(wrtingByte);
	});
	//잇는글 작성 시 공란체크
	//auth_writeSubArticle.neon
	$('form[action="auth_writeSubArticle.neon"]').on('click','.subArticleSubmit',function(){
			if($('textarea[name="subArticleContent"]').val()==''){
				alert('잇고자하는 내용을 입력해주세요');
				$('textarea[name="subArticleContent"]').focus();
				return false;
			}
			var formData = $('form[action="auth_writeSubArticle.neon"]').serialize();
			$.ajax({
				beforeSend : function(xmlHttpRequest){
			           xmlHttpRequest.setRequestHeader("AJAX", "true");
			
				},
				type : "POST",
				url : "auth_writeSubArticle.neon",
				data : formData,
				error:function(xhr, textStatus, error){
					if(xhr.status=="901"){
						if(confirm('로그인이 필요합니다. 가입하시겠어요?')){
							location.href="loginPage.neon"
						}
					}
				},
				success:function(data){
					if(data.result){
						 detailItjaView(data.subArticleVO.mainArticleNo);
					}else{
						alert('이미 잇는글을 등록하셨습니다. 다음턴에 도전하세요')
						detailItjaView(data.subArticleVO.mainArticleNo);
					}
				}
			});
	});
	
	
	//끌
	
	// 모달 창에서 주제글  잇자 클릭 시 발동하기
	$('.utilInDetailModal').on('click','.itja',function(){
		var formData =  $($(this).next()).serialize();
		var itjaCountSpan = $(this).children('.itjaCount');
		itjaClick(formData,itjaCountSpan);
	});
	// 모달창에서 주제글 잇자 버튼
	$('.mainLikeIt').on('click','.itja',function(){
		var formData =  $($(this).next()).serialize();
		var itjaCountSpan = $(this).children('.itjaCount');
		itjaClick(formData,itjaCountSpan);
	});
	//모달 창에서 이어진 잇는글 클릭시 발동하는 잇자 버튼
	$('#mainSubArticle').on('click','.itja',function(){
		var formData =  $($(this).next()).serialize();
		var itjaCountSpan = $(this).children('.itjaCount');
		itjaClick(formData,itjaCountSpan);
	});
	//모달 창에서 아직 안이어진 잇는글들 클릭시 발동하는 잇자 버튼
	$('#subTable').on('click','.itja',function(){
		var formData =  $($(this).next()).serialize();
		var itjaCountSpan = $(this).children('.itjaCount');
		itjaClick(formData,itjaCountSpan);
	});
	// 메인 페이지에서  잇자 클릭 시 발동하기
	$('.bestItja').on('click',function(){
		var formData = $($(this).next()).serialize();
		var itjaCountSpan = $(this).children('.itjaCount');
		itjaClick(formData,itjaCountSpan);
		
	});
	
	// 완결 글 페이지 동적으로 생성된 카드  잇자 클릭 시 발동하기
	$('.completeItjaList').on('click','.itja',function(){
		var formData = $($(this).next()).serialize();
		var itjaCountSpan = $(this).children('.itjaCount');
		itjaClick(formData,itjaCountSpan);
		
	});
	// 메인 페이지 동적으로 생성된 카드  잇자 클릭 시 발동하기
	$('.newItjaList').on('click','.itja',function(){
		var formData = $($(this).next()).serialize();
		var itjaCountSpan = $(this).children('.itjaCount');
		itjaClick(formData,itjaCountSpan);
	});
	
	//잇자 클릭 ajax 메서드 통합
	function itjaClick(formData,itjaCountSpan){
		$.ajax({
			type : "POST",
			url : "auth_itjaClick.neon",
			data : formData,
			success : function(data){
				if(data.itjaSuccess==1){
					itjaCountSpan.html('<i class="fa fa-chain-broken"></i><br>'+data.itjaTotalCount+'it');
				}else{
					itjaCountSpan.html('<i class="fa fa-link"></i><br>'+data.itjaTotalCount+'it');
				}
				if(data.itjaTotalCount==10){
					var msg="새 베스트 잇자 타임이 시작되었습니다. 바로 참여 하실래요?<br/><br/>"+
					"<center><button class='closeToast' "+
					"onclick='detailItjaView(mainArticleNO"+bestMainArticleNo+");'>Ok</button> "+
					"<button class='closeToast'>Cancel</button>";
					$().toasty({
						autoHide: 2000,
						message: msg,
						modal: false
					});
				}
			},
			beforeSend : function(xmlHttpRequest){
		           xmlHttpRequest.setRequestHeader("AJAX", "true");
		
			},
			error:function(xhr, textStatus, error){
				if(xhr.status=="901"){
					if(confirm('로그인이 필요합니다. 가입하시겠어요?')){
						location.href="loginPage.neon"
					}
				}
			}
		});
	}
	
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
			},
			beforeSend : function(xmlHttpRequest){
		           xmlHttpRequest.setRequestHeader("AJAX", "true");
		
			},
			error:function(xhr, textStatus, error){
				if(xhr.status=="901"){
					if(confirm('로그인이 필요합니다. 가입하시겠어요?')){
						location.href="loginPage.neon"
					}
				}
			}
		});
		
	});
	// 글쓰기 폼 끝
	


	
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
 	/**
	 * 관리자 페이지의 토글 탭
	 */
	$('#myTab a').click(function (e) {
		  e.preventDefault()
		  $(this).tab('show')
		})


	
	/**
	 * @author JeSeong Lee
	 * 찜 수정
	 * */
	// alert("파워ON!!!@@@@@");
	$(".pickBtn").on('click',function(){
		// alert($(this).parent().siblings().eq(0).children().eq(5).val());
		var mainArticleNo = $(this).parent().siblings().eq(0).children().eq(5).val();
		var memberEmail = $(this).parent().siblings().eq(0).children().eq(6).val();
		var pickBtn = $(this);
		// alert(pickBtn);
		alert(mainArticleNo + ", " + memberEmail);
		$.ajax({
			type:"post",
			url:"auth_updatePickedVO.neon",
			data:"mainArticleNo="+mainArticleNo+"&memberEmail=" + memberEmail,
			success:function(data){
				// alert(data);
				// alert("data : " + pickBtn.html());
				if(data=="insert"){
					// alert("인서트했다");
					pickBtn.html("<i class='fa fa-heart'></i><br>찜!");
				}else{
					// alert("delete 햇다");
					pickBtn.html("<i class='fa fa-heart-o'></i><br>찜하자!");
				}
			}
		}); // ajax
	}); // pickBtn click
	
	/**
	 * @author JeSeong Lee
	 * 닉네임 팝오버 - 호버
	 */
	
	/*$('[data-toggle="popover"]').popover({
        placement : 'bottom',
	});*/
	
	var popOverSettings = {
			trigger:'hover',
			placement: 'bottom',
		    container: 'body',
		    html: false,
		    selector: '[data-toggle="popover"]', //Sepcify the selector here
		    content: function () {
		        return $('#popover-content').html();
		    }
		}
		$('body').popover(popOverSettings);
		/*$(".writersNickName").on('click', function(){
			$('body').popover(popOverSettings);
		});*/
		/*$('[data-toggle="popover"]').popover();
		$('body').on('click', function (e) {
		    //did not click a popover toggle or popover
		    if ($(e.target).data('toggle') !== 'popover'
		        && $(e.target).parents('.popover.in').length === 0) { 
		        $('[data-toggle="popover"]').popover('hide');
		    }
		});*/
	/**
     * 관리자가 회원리스트에서 해당 회원을
     * Block 하는 스크립트
     */
    $('#memberReportList').on('click','.memberBlock',function () {
    	var memberEmail=$(this).parent().parent().children().eq(0).text();
    	if(confirm("해당 회원을 Block 하시겠습니까?")){
    		document.location.href = "memberBlock.neon?memberEmail="+memberEmail;
    	}
		return false;
	});
    /**
     * 관리자가 회원리스트에서 해당 회원을
     * Block 해제 하는 스크립트
     */
	$('#blockMemberReportList').on('click','.memberService',function () {
   	var memberEmail=$(this).parent().parent().children().eq(0).text();
   	if(confirm("해당 회원을 Block해제 하시겠습니까?")){
   		document.location.href = "memberBlockRelease.neon?memberEmail="+memberEmail;
   	}
		return false;
	});

	$('#mainReportList').on('click','.boardReport',function () {
		var subArticleNO=$(this).parent().parent().children().eq(4).text();
		var articleNO=$(this).parent().parent().children().eq(2).text();
		var reportNO=$(this).parent().parent().children().eq(1).text();
		if(confirm("신고처리 하시겠습니까?")){
			location.href="adminPageDeleteArticle.neon?reportNO="+reportNO+"&articleNO="+articleNO+"&subArticleNO="+subArticleNO+
			"&command=report";
		}
	});
	
	$('#mainReportList').on('click','.ReportCancle',function () {
		var subArticleNO=$(this).parent().parent().children().eq(4).text();
		var articleNO=$(this).parent().parent().children().eq(2).text();
		var reportNO=$(this).parent().parent().children().eq(1).text();
		if(confirm("반려처리 하시겠습니까?")){
			location.href="adminPageDeleteArticle.neon?reportNO="+reportNO+"&articleNO="+articleNO+"&subArticleNO="+subArticleNO+
			"&command=cancle";
		}
	});
   
	$('#subReportList').on('click','.boardReport',function () {
		var subArticleNO=$(this).parent().parent().children().eq(4).text();
		var articleNO=$(this).parent().parent().children().eq(2).text();
		var reportNO=$(this).parent().parent().children().eq(1).text();
		if(confirm("신고처리 하시겠습니까?")){
			location.href="adminPageDeleteArticle.neon?reportNO="+reportNO+"&articleNO="+articleNO+"&subArticleNO="+subArticleNO+
			"&command=report";
		}
	});

	$('#subReportList').on('click','.ReportCancle',function () {
		var subArticleNO=$(this).parent().parent().children().eq(4).text();
		var articleNO=$(this).parent().parent().children().eq(2).text();
		var reportNO=$(this).parent().parent().children().eq(1).text();
		if(confirm("반려처리 하시겠습니까?")){
			location.href="adminPageDeleteArticle.neon?reportNO="+reportNO+"&articleNO="+articleNO+"&subArticleNO="+subArticleNO+
			"&command=cancle";
		}
	});
	
	$('.articleReportPaging').click(function () {
		var articleReportList="";
		var pageNo=$($(this).next().children()).val();
		var pageType=$($(this).next().children().eq(1)).val();
		var reportIndex=(pageNo-1)*13;
		alert("type : "+pageType);
		$.ajax({
			type:"post",
			url:"mainreportListPaging.neon",
			data:"pageNo="+pageNo+"&pageType="+pageType,
			dataType:"json",
			success:function(data){ 
				if(pageType=="mainArticleList"){
					alert("주제글");
					for(var i=0; i<data.list.length;i++){
						articleReportList=articleReportList+"<tr><td>"+(reportIndex+i)+"</td><td>"+
						data.list[i].reportNo+"</td><td>"+data.list[i].mainArticleNo+"</td><td>"+
						data.list[i].mainArticleVO[0].mainArticleTitle+"</td><td>"+
						data.list[i].mainArticleVO[0].memberVO.memberNickName+"</td><td>"+
						data.list[i].reportDate+"</td><td>"+data.list[i].reportAmount+"</td><td>"+
						data.list[i].stagesOfProcess+"</td><td><input type='button' value='신고처리' class='boardReport'></td>"+
						"<td><input type='button' value='반려처리' class='ReportCancle'></td></tr>"
					}
					$('#mainReportList').html(articleReportList);
				}else{
					alert("잇는글");
					for(var i=0; i<data.list.length;i++){
						articleReportList=articleReportList+"<tr><td>"+(reportIndex+i)+"</td><td>"+
						data.list[i].reportNo+"</td><td>"+data.list[i].mainArticleNo+"</td><td>"+
						data.list[i].mainArticleVO[0].mainArticleTitle+"</td><td>"+
						data.list[i].mainArticleVO[0].subArticle[0].subArticleNo+"</td><td>"+
						data.list[i].mainArticleVO[0].subArticle[0].subArticleContent+"</td><td>"+
						data.list[i].mainArticleVO[0].subArticle[0].memberVO.memberNickName+"</td><td>"+
						data.list[i].reportDate+"</td><td>"+data.list[i].reportAmount+"</td><td>"+
						data.list[i].stagesOfProcess+"</td><td><input type='button' value='신고처리' class='boardReport'></td>"+
						"<td><input type='button' value='반려처리' class='ReportCancle'></td></tr>"
					}
					$('#subReportList').html(articleReportList);
				}
			}
		});
	});
	$('.memberReportPaging').click(function () {
		var memberReportList="";
		var pageNo=$($(this).next().children()).val();
		var pageType=$($(this).next().children().eq(1)).val();
		$.ajax({
			type:"post",
			url:"memberReportListPaging.neon",
			data:"pageNo="+pageNo+"&pageType="+pageType,
			dataType:"json",
			success:function(data){ 
				if(pageType=="memberList"){
					for(var i=0; i<data.list.length; i++){
						memberReportList=memberReportList+"<tr><td>"+
						data.list[i].memberEmail+"</td><td>"+data.list[i].memberNickName+"</td><td>"+
						data.list[i].memberJoinDate+"</td><td>"+data.list[i].memberPoint+"</td><td>"+
						data.list[i].memberReportAmount+"</td><td>"+
						"<input type='button' value='서비스정지' class='memberBlock'></td>";	
					}
					$('#memberReportList').html(memberReportList);
					
				}else{
					for(var i=0;i<data.list.length;i++){
						memberReportList=memberReportList+"<tr><td>"+
						data.list[i].memberEmail+"</td><td>"+data.list[i].memberNickName+"</td><td>"+
						data.list[i].memberJoinDate+"</td><td>"+data.list[i].memberPoint+"</td><td>"+
						data.list[i].memberReportAmount+"</td><td>"+
						"<input type='button' value='서비스시작' class='memberService'></td>";	
					}
					$('#blockMemberReportList').html(memberReportList);
					
				}
			}
		});
	});
	
	/*<!--업데이트 모달창 --!>*/
	$('.memberUpate').click(function(){
		$("#memberUpateModal").modal({
			//취소버튼으로만 창을 끌 수 있도록 지정
			backdrop: 'static',
			keyboard: false
		});
	});

	$("#memberUpateModal").on('show.bs.modal', function () {
		//암호 공란 검사 및 암호 길이 검사
		var userCheckFlag= false;
		var userPassFlag = false;
		var userRePassFlag = false;
		var userNameFlag = false;
		
		
		
		$("#membercheckpassword").keyup(function () {
			var checkPassComp = $(this).val();
			var mailComp=$('#memberJoinupdateEmail').val();
		
			if(checkPassComp==""){
				userCheckFlag = false;
				$('.checkpassInput').attr('class','form-group has-feedback checkpassInput has-error');
				$('.checkpassInput > .control-label').html('현재비밀번호를 입력해 주세요');
				$('.checkpassInput > .glyphicon').attr('class','glyphicon glyphicon-remove form-control-feedback');
			}else if(checkPassComp.length<8 || checkPassComp.length>19){
				userPassFlag = false;
				$('.checkpassInput').attr('class','form-group has-feedback checkpassInput has-error');
				$('.checkpassInput > .control-label').html('비밀번호 확인중 입니다');
				$('.checkpassInput > .glyphicon').attr('class','glyphicon glyphicon-remove form-control-feedback');
			}else{					
				$.ajax({
					type:"post",
					url:"findByPassword.neon",				
					data:"mailComp="+mailComp,	
					success:function(result){
						if(result.memberPassword!=checkPassComp){
							userCheckFlag = false;
							$('.checkpassInput').attr('class','form-group has-feedback checkpassInput has-error');
							$('.checkpassInput > .control-label').html("현재 비밀번호 오류");
							$('.checkpassInput > .glyphicon').attr('class','glyphicon glyphicon-remove form-control-feedback');
							  
						}else{
							userCheckFlag = true;
							$('.checkpassInput').attr('class','form-group has-feedback checkpassInput has-success');
							$('.checkpassInput > .control-label').html("확인 되었습니다");	
							$('.checkpassInput > .glyphicon').attr('class','glyphicon glyphicon-ok form-control-feedback');
							   
						}//else2			
					}//success			
				});//ajax
			
			}//else1
		});
		

		$("#memberupdateInputName").keyup(function(){
			var nameComp = $(this).val();
			
			if(nameComp==""){
				userNameFlag = false;
				$('.nameInput').attr('class','form-group has-feedback nameInput has-error');
				$('.nameInput > .control-label').html('닉네임을 입력해주세요');
				$('.nameInput > .glyphicon').attr('class','glyphicon glyphicon-remove form-control-feedback');
			}else if(nameComp.length<2 || nameComp.length>8){
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
		$("#memberupdatepassword").keyup(function(){
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
			}
		});
		//암호확인 공란 검사 및 암호확인 길이 검사 및 암호와 암호확인 값 비교
		$("#memberupdateRepassword").keyup(function(){
			var passComp = $('#memberupdatepassword').val();
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
			}
		});
		$("#memberUpdateSubmit").click(function(){
			
			if(userPassFlag&&userRePassFlag&&userNameFlag){
			$("#memberUpdate").submit();
			alert("변경처리되었습니다");
			}
	});
		});





	//<!--회원탈퇴모달--!>
	$('.memberDelete').click(function(){
		$("#memberDeleteModal").modal({
			//취소버튼으로만 창을 끌 수 있도록 지정
			backdrop: 'static',
			keyboard: false
		});
	});

	var userCheckFlag=false;
	$("#memberDeleteModal").on('show.bs.modal', function () {
		 
	 
	$("#password").keyup(function () {
		var PassComp = $(this).val();
		var mailComp=$('#memberDeleteEmail').val();

		if(PassComp==""){
			userCheckFlag = false;
			$('.checkpassInput').attr('class','form-group has-feedback checkpassInput has-error');
			$('.checkpassInput > .control-label').html('현재비밀번호를 입력해 주세요');
			$('.checkpassInput > .glyphicon').attr('class','glyphicon glyphicon-remove form-control-feedback');
		}else if(PassComp.length<8 || PassComp.length>19){
			userPassFlag = false;
			$('.checkpassInput').attr('class','form-group has-feedback checkpassInput has-error');
			$('.checkpassInput > .control-label').html('비밀번호 확인중 입니다');
			$('.checkpassInput > .glyphicon').attr('class','glyphicon glyphicon-remove form-control-feedback');
		}else{					
			$.ajax({
				type:"post",
				url:"findByPassword.neon",				
				data:"mailComp="+mailComp,	
				success:function(result){
					if(result.memberPassword!=PassComp){
						userCheckFlag = false;
						$('.checkpassInput').attr('class','form-group has-feedback checkpassInput has-error');
						$('.checkpassInput > .control-label').html("현재 비밀번호 오류");
						$('.checkpassInput > .glyphicon').attr('class','glyphicon glyphicon-remove form-control-feedback');
						  
					}else{
						userCheckFlag = true;
						$('.checkpassInput').attr('class','form-group has-feedback checkpassInput has-success');
						$('.checkpassInput > .control-label').html("확인 되었습니다");	
						$('.checkpassInput > .glyphicon').attr('class','glyphicon glyphicon-ok form-control-feedback');
						   
					}//else2			
				}//success			
			});//ajax
		
		}//else1


	});
	});

	$("#memberDeleteSubmit").click(function(){		
		alert(userCheckFlag);
			if(userCheckFlag==true){
				alert("회원탈퇴 되었습니다");
				$("#memberDelete").submit();

			}
	});
	
	//검색 창 드롭다운 메뉴
    $('.search-panel .dropdown-menu').find('a').click(function(e) {
		e.preventDefault();
		var param = $(this).attr("href").replace("#","");
		var concept = $(this).text();
		$('.search-panel span#search_concept').text(concept);
		$('.input-group #search_param').val(param);
	});
    
    // 마이페이지
    $(".btn-pref .btn").click(function () {
        $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
        // $(".tab").addClass("active"); // instead of this do the below 
        $(this).removeClass("btn-default").addClass("btn-primary");   
    });
    
    //로그인 및 가입 요청창
    function confirmLogin(){
    	if(confirm('로그인이 필요합니다. 가입하실래요?')){
    		redirect:memberLogin;
    	}else{return;
    	}
    }

});//document.ready
	

