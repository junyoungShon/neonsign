<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야함->
<title>부트스트랩 101 템플릿</title>


<!-- 부트스트랩 -->
<link href="${initParam.root}resources/css/bootstrap.css" rel="stylesheet">
<script src="${initParam.root}resources/js/ie-emulation-modes-warning.js"></script>
 <!-- 슬라이드 쇼를 위한 flickity api -->
<script src="${initParam.root}resources/js/flickity.pkgd.min.js"></script>
<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<!-- 부트스트랩 사용을 위한 상단 설정 완료 -->
<!-- 힙스터 카드 css -->
 <link href="${initParam.root}resources/css/hipster_cards.css" rel="stylesheet"/> 
 <!-- 슬라이드 쇼를 위한 flickity api -->
<link rel="stylesheet" href="${initParam.root}resources/css/flickity.css" media="screen">
<link href="${initParam.root}resources/css/style.css" rel="stylesheet">
<!-- cutomize 하는 css -->
 <link href="${initParam.root}resources/css/main.css" rel="stylesheet"/> 
 <!-- 아이콘 만들기 api font-awesome -->
 <link href="${initParam.root}resources/css/font-awesome.min.css" rel="stylesheet" />
 
 <!-- 잇자 또는 공지를 사이트 측면에서 띄워주는 간이모달 CSS -->
 <link rel="stylesheet" type="text/css" href="${initParam.root}resources/css/toasty-min.css">
<style type="text/css">
	 /* 로그인 페이지*/
 @import url(http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css);

.myForm {
    width: 30%;
    margin: 0 auto;
    padding-top: 50px;
}

.myForm h1 {
    color: #5BC0DE;
    font-weight: bold;
    text-transform: uppercase;
    padding-bottom: 30px;
}

.myForm .checkbox {
    margin-bottom: 20px;
    position: relative;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    -o-user-select: none;
    user-select: none;
}

.myForm .checkbox.show:before {
    content: '\f00c';
    color: #5bc0de;
    font-size: 17px;
    margin: 1px 0 0 3px;
    position: absolute;
    pointer-events: none;
    font-family: FontAwesome;
}

.myForm .checkbox .mycheckbox {
    width: 25px;
    height: 25px;
    cursor: pointer;
    border-radius: 3px;
    border: 1px solid #ccc;
    vertical-align: middle;
    display: inline-block;
}

.myForm .checkbox .label {
    color: #777;
    font-size: 13px;
    font-weight: 400;
}

.myForm .forget {
    font-size: 13px;
	text-align: center;
	display: block;
}
/*    --------------------------------------------------
    :: Footer
	-------------------------------------------------- */
#footer {
    color: #6d6d6d;
    font-size: 12px;
    text-align: center;
}
#footer p {
    margin-bottom: 0;
}
#footer a {
    color: inherit;
}
</style>
<script src="js/ie-emulation-modes-warning.js"></script>
<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<!-- 부트스트랩 사용을 위한 상단 설정 완료 -->
</head>
<section>
    <div class="container">
        <div class="row">
    	    <div class="col-xs-12">
                <div class="myForm">
                    <h1 class="text-center">NeonSign In</h1>
                    <form role="form" action="javascript:;" method="post" id="login-form" autocomplete="off">
                        <div class="form-group">
                            <label for="email" class="sr-only">Email</label>
                            <input type="email" name="email" id="email" class="form-control input-md" placeholder="Email">
                        </div>
                        <div class="form-group">
                            <label for="key" class="sr-only">Password</label>
                            <input type="password" name="key" id="key" class="form-control input-md" placeholder="Password">
                        </div>
                        <div class="checkbox">
                            <span class="mycheckbox" onclick="showPassword()"></span>
                            <span class="label">Show password</span>
                        </div>
                        <input type="submit" id="btn-login" class="btn btn-info btn-lg btn-block" value="Log in"><br>
                        <a href="javascript:;" class="forget" data-toggle="modal" data-target=".forget-modal">Forgot your password?</a>
                    </form>
                    <hr>
                </div>
    		</div> <!-- /.col-xs-12 -->
    	</div> <!-- /.row -->
    </div> <!-- /.container -->
</section>

<div class="modal fade forget-modal" tabindex="-1" role="dialog" aria-labelledby="myForgetModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true"><i class="fa fa-remove"></i></span>
					<span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">Recovery password</h4>
			</div>
			<div class="modal-body">
				<p>Type your email account</p>
				<input type="email" name="recovery-email" id="recovery-email" class="form-control" autocomplete="off">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				<button type="button" class="btn btn-info">Recovery</button>
			</div>
		</div> <!-- /.modal-content -->
	</div> <!-- /.modal-dialog -->
</div> <!-- /.modal -->

<footer>
    <div class="container">
        <div class="row">
            <div class="col-xs-12 text-center">
                <p>Page © - 2015</p>
                <p>Powered by <strong><a href="${initParam.root}getMainList.neon" target="_blank">NeonSign</a></strong></p>
            </div>
        </div>
    </div>
</footer>
<body>
   
<!-- 부트 스트랩 사용을 위한 하단 설정 -->
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="${initParam.root}resources/js/jquery.js"></script>
<script src="${initParam.root}resources/js/script.js"></script>
 <!-- 잇자 또는 공지를 사이트 측면에서 띄워주는 간이모달 js -->
<script src="${initParam.root}resources/js/toasty-min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="${initParam.root}resources/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script	src="${initParam.root}resources/js/ie10-viewport-bug-workaround.js"></script>
<!-- 부트 스트랩 사용을 위한 하단 설정 완료 -->
<!-- 힙스터 카드 js 파일 -->
<script src="${initParam.root}resources/js/hipster-cards.js"></script>

</body>
</html>