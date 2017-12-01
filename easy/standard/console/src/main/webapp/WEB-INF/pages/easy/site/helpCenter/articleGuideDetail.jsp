<!--新手指南新增-->

<div class="p20" id="container">
  <%-- <div class="border">
    <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i>查看</div>
    <div class="tab-content-container p20"> 
      
      <!--项目基本信息-->
      <div class="tab-item" style="display: block;">
        <ul class="gray6 pt20">
          <li class="mb20">
            <div class="pr mh30 pl120"><span class="display-ib w100 lh30 tr mr5 pa left0 top0"><em class="red pr5">*</em>标题</span>
              <div class="pr pl320 tl">
                <input type="text" class="text border w300 pl5 pa left0 top0" name="title" value="${pageResult.list.title}">
                <span class="ml5">提示错误:你的输入有误</span></div>
            </div>
          </li>
          <li class="mb20">
            <div class="pr mh30 pl120"><span class="display-ib w100 lh30 tr mr5 pa left0 top0"><em class="red pr5">*</em>内容</span>
              <div class="pr tl clearfix">
                <div class="ww60 fl">
                  <textarea class="border h200 ww100"></textarea>
                </div>
                <div class="fl ww40"><span class="pl10 pr10 display-ib">提示错误</span></div>
              </div>
            </div>
          </li>
          <li class="mb20">
            <div class="pr mh30 pl120"><span class="display-ib w100 lh30 tr mr5 pa left0 top0"><em class="red pr5">*</em>关键字</span>
              <div class="pr pl320 tl">
                <input type="text" class="text border w300 pl5 pa left0 top0">
                <span class="ml5"><span class="pl20 pr5">是否发布？</span>
                <select class="border mr20 h32 mw100 ml0">
                  <option>全部</option>
                  <option>是</option>
                  <option>否</option>
                </select>
                </span></div>
            </div>
          </li>
        </ul>
        <div class="tl pl120 f16 pb20"><a href="" class="btn-blue2 btn white radius-6 pl20 pr20 ml20">返回</a></div>
      </div>
    </div>
  </div> --%>
</div>

<script id="proLeadTemple" type="text/x-jquery-tmpl">
{{each(i,zd) list}}
	<div class="border">
    <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i><span id="detailHtml">查看</span></div>
    <div class="tab-content-container p20"> 
      
      <!--项目基本信息-->
      <div class="tab-item" style="display: block;">
        <ul class="gray6 pt20">
          <li class="mb20">
            <div class="pr mh30 pl120"><span class="display-ib w100 lh30 tr mr5 pa left0 top0"><em class="red pr5">*</em>标题</span>
              <div class="pr pl320 tl">
                <input type="text" class="text border w300 pl5 pa left0 top0" name="title" value="{{= zd.title}}">
            </div>
          </li>
          <li class="mb20">
            <div class="pr mh30 pl120"><span class="display-ib w100 lh30 tr mr5 pa left0 top0"><em class="red pr5">*</em>内容</span>
              <div class="pr tl clearfix">
                <div class="ww60 fl">
                  <textarea cols="100" rows="4" style="width:700px;height:300px;visibility:hidden;" class="border h200 ww100" name="content" id="content">{{= zd.content}}</textarea>
                </div>
              </div>
            </div>
          </li>
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
        <div class="tl pl120 f16 pb20"><a onclick="javascript:void(0);" id="backHome" class="btn-blue2 btn white radius-6 pl20 pr20 ml20">返回</a></div>
      </div>
    </div>
  </div>
{{/each}}

</script>

<script type="text/javascript">
	var id = "${id}";
	var type = "${type}";
 var ArticleGuideController=DM.Controller.sub({
	 showData:function(){
		 var data=this.loadData();
		    $("#container").empty();
			//填充数据
			$('#proLeadTemple').tmpl({list:data}).appendTo("#container");
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
	 "事件监听":function(){
		 articleGuideController.imageUpClick();
	 },
	 "加载数据":function(){
		 articleGuideController.showData();
	 }
	 
 });
 
 $("#backHome").click(function(){
		/*if(dmCheck.check("#projectForm")){
		}*/
		
		myfn.AjaxFn("site/helpCenter/siteArticleGuide/queryArticleGuideList.do?type="+type,$(".viewFramework-content"),$("#mForm").serialize());
			
	});
 if("1" == type)
	 $("#detailHtml").html("查看发起项目相关问题");
	 else if("2" == type)
		 $("#detailHtml").html("查看项目管理相关问题");
		 else if("3" == type)
			 $("#detailHtml").html("查看支持项目相关问题");
			 else if("4" == type)
				 $("#detailHtml").html("查看常见问题");
 
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
				/* //限制字数
				var limitNum = 500;  //设定限制字数
				var pattern = '还可以输入' + limitNum + '字';
				//$('#contentInfo').html(pattern).show(); //输入显示
				if(this.count('text') > limitNum) {
			       pattern = ('最大允许输入500字');
			       $('#contentInfo').html(pattern).show(); //输入显示
			       //超过字数限制自动截取
			       var strValue = this.text();
			       strValue = strValue.substring(0,limitNum);
			       this.text(strValue);      
				} else {
				   if(this.count('text') < limitNum) $('#contentInfo').hide();
			       //计算剩余字数
			       var result = limitNum - this.count('text'); 
			       pattern = '还可以输入' +  result + '字'; 
				} */
				//$('#contentInfo').html(pattern).show(); //输入显示
			}
		});
		prettyPrint();
	});
	
	</script>