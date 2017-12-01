<!--新手指南新增-->

<form method="post" id="guidForm">
<input type="hidden" name="id">
<input type="hidden" name="type">
<div class="p20" id="container">
  <!-- <div class="border">
    <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i>修改</div>
    <div class="tab-content-container p20"> 
      
      项目基本信息
      <div class="tab-item" style="display: block;">
        <ul class="gray6 pt20">
          <li class="mb20">
            <div class="pr mh30 pl120"><span class="display-ib w100 lh30 tr mr5 pa left0 top0"><em class="red pr5">*</em>标题</span>
              <div class="pr pl320 tl">
                <input type="text" class="text border w300 pl5 pa left0 top0"  validate="q" name="title">
                <span class="ml5"></span></div>
            </div>
          </li>
          <li class="mb20">
            <div class="pr mh30 pl120"><span class="display-ib w100 lh30 tr mr5 pa left0 top0"><em class="red pr5">*</em>内容</span>
              <div class="pr tl clearfix">
                <div class="ww60 fl">
                  <textarea class="border h200 ww100" validate="q" name="content"></textarea>
                </div>
                <div class="fl ww40"><span class="pl10 pr10 display-ib"></span></div>
              </div>
            </div>
          </li>
          <li class="mb20">
            <div class="pr mh30 pl120"><span class="display-ib w100 lh30 tr mr5 pa left0 top0"><em class="red pr5">*</em>关键字</span>
              <div class="pr pl320 tl">
                <input type="text" class="text border w300 pl5 pa left0 top0" name="keyword" validate="q">
                <span class="ml5"><span class="pl20 pr5">是否发布？</span>
                
                <select name="status" class="border mr20 h32 mw100 ml0">
							<option value="1" selected="selected">是</option>
							<option value="2" >否</option>
				</select>
						
                </span></div>
            </div>
          </li>
          
        </ul>
        <div class="tl pl120 f16 pb20"><a class="btn-blue2 btn white radius-6 pl20 pr20" onclick="addUser()">提交</a><a href="" class="btn-blue2 btn white radius-6 pl20 pr20 ml20">返回</a></div>
      </div>
    </div>
  </div> -->
</div>
</form>

<script id="proLeadTemple" type="text/x-jquery-tmpl">
{{each(i,zd) list}}
<div class="border">
    <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i><span id="detailHtml">修改</span></div>
    <div class="tab-content-container p20"> 
      
      <!--项目基本信息-->
      <div class="tab-item" style="display: block;">
        <ul class="gray6 pt20">
          <li class="mb20">
            <div class="pr mh30 pl120"><span class="display-ib w100 lh30 tr mr5 pa left0 top0"><em class="red pr5">*</em>标题</span>
              <div class="pr Ih30 helpTil">
                <input type="text" maxlength="20" class="text border w300 pl5 pa left0 top0 focus_text" id="title"  validate="q" name="title" value="{{= zd.title}}" >
                <span class="ml5"></span><label for="title">最大可输入20字</label></div>
            </div>
          </li>
          <li class="mb20">
            <div class="pr mh30 pl120"><span class="display-ib w100 lh30 tr mr5 pa left0 top0"><em class="red pr5">*</em>内容</span>
              <div class="pr tl clearfix">
                <div class="ww60 fl">
                  <textarea cols="100" rows="4" style="width:700px;height:300px;visibility:hidden;" class="border h200 ww100" validate="q" name="content" id="content">{{= zd.content}}</textarea>
                </div>
                <div class="fl ww40"><span class="pl10 pr10 display-ib"></span></div>
              </div>
            </div>
          <li class="mb20">
            <div class="pr mh30 pl120">
            <span class="display-ib w100 lh30 tr mr5 pa left0 top0"><em class="red pr5">*</em>是否发布</span>
              <div class="pr Ih30 helpTil">
                <select name="status" class="border mr20 h32 mw100 ml0">
							<option value="1" {{if zd.status == "1"}}selected="selected"{{/if}}>是</option>
							<option value="2" {{if zd.status == "2"}}selected="selected"{{/if}}>否</option>
				</select>
              </div>
            </div>
          </li>
        </ul>
        <div class="tl pl120 f16 pb20"><a class="btn-blue2 btn white radius-6 pl20 pr20" onclick="addUser()">提交</a><a onclick="javascript:void(0);" id="backHome" class="btn-blue2 btn white radius-6 pl20 pr20 ml20">返回</a></div>
      </div>
    </div>
  </div>
{{/each}}
</script>

<script type="text/javascript" language="javascript">
var id = "${id}";
var type = "${type}";
$("input[name=id]").val(id);
$("input[name=type]").val(type);




var ArticleGuideController=DM.Controller.sub({
 showData:function(){
	 var data=this.loadData();
	    $("#container").empty();
		//填充数据
		$('#proLeadTemple').tmpl({list:data}).appendTo("#container");
		initFocusText();
 },
 loadData:function(){
	 var result=null;
	 DM.ajax({
		 url:"site/helpCenter/articleGuidAjax.do",
		 data:{id:id,type:type},
	     success:function(data){
	    		result=data.pageResult.list;
	     },
	     error:function(data){
	    	 
	     }
	 });
	 return result;
 }
 
});
var articleGuideController=new ArticleGuideController();
DM.Page.ready({
 "加载数据":function(){
	 articleGuideController.showData();
 }
 
});

//增加校验模式
dmCheck.init("#guidForm");
function addUser(){
		if(!dmCheck.check("#guidForm")){
			return false;
		}
	  //提交数据
	  DM.ajax({
		url:"site/helpCenter/updateArticleInfoAjax.do",
		type:"post",
		data:$('#guidForm').serialize(),
		success:function(data){
			debugger
				//显示提示信息
				if("000000"==data.baseDataResp.code){
					Dialog.show("修改成功","success");
					myfn.AjaxFn("site/helpCenter/siteArticleGuide/queryArticleGuideList.do?type="+type,$(".viewFramework-content"));
				} else if(data.baseDataResp.code=='600007'){
					Dialog.show("保存失败，输入的文章內容过大","error");
				} else{
					Dialog.show(data.description,"error");
				}
	 },
	 error:function(){
		 Dialog.show("修改失败","error");
	 }});
   }
   
$("#backHome").click(function(){
	/*if(dmCheck.check("#projectForm")){
	}*/
	
	myfn.AjaxFn("site/helpCenter/siteArticleGuide/queryArticleGuideList.do?type="+type,$(".viewFramework-content"));
		
});


if("1" == type)
	 $("#detailHtml").html("修改发起项目相关问题");
	 else if("2" == type)
		 $("#detailHtml").html("修改项目管理相关问题");
		 else if("3" == type)
			 $("#detailHtml").html("修改支持项目相关问题");
			 else if("4" == type)
				 $("#detailHtml").html("修改常见问题");

</script>

<script type="text/javascript">

var editor1;
	KindEditor.ready(function(K) {
		editor1 = K.create('textarea[name="content"]', {
			uploadJson : basePath+'common/kingUpload.do',
			allowFileManager : false,
			formatUploadUrl : false,
			afterBlur : function() {
				this.sync();
				$("#content").text(this.html());
			},
			afterFocus : function() {
				$("#errContent").html("&nbsp;");
			},
			afterChange : function() {
				//限制字数
				/* var limitNum = 2000;  //设定限制字数
				var pattern = '还可以输入' + limitNum + '字';
				if(this.count('text') < limitNum) {
					//计算剩余字数
			       var result = limitNum - this.count('text'); 
			       dmCheck.tip("textarea[name='content']",'还可以输入' +  result + '字');
				}else if(this.count('text') == limitNum){
					dmCheck.tip("textarea[name='content']","最大允许输入"+limitNum+"字");
				} else {
					//超过字数限制自动截取
			       var strValue = this.text();
			       strValue = strValue.substring(0,limitNum);
			       this.text(strValue);  
				   dmCheck.tip("textarea[name='content']","最大允许输入"+limitNum+"字");
				} */
			}
		});
		prettyPrint();
	});
	
	</script>