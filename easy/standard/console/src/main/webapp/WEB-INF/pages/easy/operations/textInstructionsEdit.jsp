<form method="post" id="mForm">
<input type="hidden" name="textId" value="${object.data.list[0].textId}"/>
 <div class="p20" id="containerEditor">
  <div class="border">
    <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i>修改</div>
    <div class="tab-content-container p20"> 
      <div class="tab-item" style="display: block;">
        <ul class="gray6 pt20">
          <li class="mb20">
            <div class="pr mh30 pl120"><span class="display-ib w100 lh30 tr mr5 pa left0 top0"><em class="red pr5">*</em>文本说明</span>
              <div class="pr pl0 tl pt5">
                ${object.data.list[0].textTitle}
                <span class="ml5"></span></div>
            </div>
          </li>
          <li class="mb20">
            <div class="pr mh30 pl120"><span class="display-ib w100 lh30 tr mr5 pa left0 top0"><em class="red pr5">*</em>内容</span>
              <div class="pr tl clearfix">
                <div class="ww60 fl pt5">
                	<textarea cols="100" rows="4" style="width:700px;height:300px;visibility:hidden;" class="border h200 ww100" validate="q" name="textContext" id="content">${object.data.list[0].textContext}</textarea>
                </div>
                <div class="fl ww40"><span class="pl10 pr10 display-ib"></span></div>
              </div>
            </div>
          </li>
        </ul>
        <div class="tl pl120 f16 pb20">
        	<a href="javascript:void(0);" id="updateText" class="btn-blue2 btn white radius-6 pl20 pr20">提交</a>
        	<a href="javascript:void(0);" id="backHome" class="btn-blue2 btn white radius-6 pl20 pr20 ml20">返回</a>
        </div>
      </div>
    </div>
  </div> 
</div>
</form>

<script type="text/javascript">
dmCheck.init("#mForm");
var editor1;
KindEditor.ready(function(K) {
	editor1 = K.create('textarea[name="textContext"]', {
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
			
		}
	});
	prettyPrint();
	
	editor1.readonly(false);
});

DM.Page.ready({
	"加载数据":function(){
		$("#backHome").click(function(){
			myfn.AjaxFn("site/textInstructionsList.do",$(".viewFramework-content"),"");
		});
		
		$("#updateText").click(function(){
			if(!dmCheck.check("#mForm")){ 
				return false;
         	}
		    DM.ajax({
				url:"site/updateTextInstruct.do",
				data:$("#mForm").serialize(),
				success:function(data){
					if(data.code=="000000"){
						 Dialog.confirm("修改成功！",{
							    title:"提示信息",
							    sureName:"确定",
							    showClose: false,
							    showCancel:false,
							    isLeftFloating:false,
							    picClass:"success", //需要时设置,该属性用来显示提示信息成功或失败的图标（success，error,tip）
							    callBack:function(){
							        //回调函数
							    	myfn.AjaxFn("site/textInstructionsList.do",$(".viewFramework-content"),"");
							    }
						});
					}else{
						Dialog.show(data.description,"error");
					}
				},
				error:function(data){
					 Dialog.show("系统异常，请联系管理员","error");
				}
			});
		});
	 }
});
</script>