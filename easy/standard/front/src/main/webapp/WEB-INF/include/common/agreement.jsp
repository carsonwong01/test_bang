
<!-- 协议 -->
<title>${agreement.protocolTitle }</title>

<link rel="stylesheet" type="text/css" href="<%=basePath %>estate/css/common.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>estate/css/user.css"/>


<style type="text/css">
	.xieyi-box { background: #FFF; border: 1px solid #CCC; margin: 0 auto; margin-top: 30px; width: 840px; padding: 30px 80px; padding-bottom: 100px; line-height: 30px; }
	.h1-title { border-bottom: 1px solid #CCC; line-height: 40px; padding-bottom: 20px; }
	.down-text-btn { color: #06F; float: right; font-size: 14px; font-weight: normal; }
	.table { width: 100%; }
	.table td { border-collapse: collapse; }
	.table-style-border td { border: 1px solid #dddddd; padding: 5px; }
	.tc {text-align: center;margin-bottom: 10px;}
	a:hover {text-decoration: none;}
	.btn-public:hover {color: #fff;filter: alpha(opacity=80);-moz-opacity: .8;opacity: 0.8;}
	.btn-public {display: inline-block;background: #1ea8fb;border: none;cursor: pointer;text-align: center;padding: 0 10px;vertical-align: middle;min-width: 60px;height: 30px;line-height: 30px;font-size: 18px;border-radius: 14px;margin-top: -50px;}
</style>
<script>
	function closeWin(){
		window.opener=null;
		window.open('','_self');
		window.close();
	}
</script>
</head>
<!--主体内容-->
<body class="main_bg">
<div>	
	<div class="xieyi-box width-full">
    <h1 class="tc f24 h1-title"><span class="bold red">${agreement.protocolTitle }</span></h1>
    ${agreement.protocolContent }
    </div>
    <p class="tc">
		<a class="btn-public" onclick="closeWin();">关闭</a>
	</p>
</div>
</body>
</html>