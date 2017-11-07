<form method="post" id="mForm">
<input type="hidden" name="id">
 <div class="p20" id="containerEditor">
 <input readonly="readonly">
  <div class="border">
    <div class="title-container"><i class="icon-i w30 h30 va-middle title-left-icon"></i>查看</div>
    <div class="tab-content-container p20"> 
      <div class="tab-item" style="display: block;">
        <ul class="gray6 pt20">
          <li class="mb20">
            <div class="pr mh30 pl120"><span class="display-ib w100 lh30 tr mr5 pa left0 top0">文本说明</span>
              <div class="pr pl0 tl pt5">
                ${object.data.list[0].textTitle }
                <span class="ml5"></span></div>
            </div>
          </li>
          <li class="mb20">
            <div class="pr mh30 pl120"><span class="display-ib w100 lh30 tr mr5 pa left0 top0">内容</span>
              <div class="pr tl clearfix">
                <div class="ww60 fl pt5 width-full">
                	${object.data.list[0].textContext}
                </div>
                <div class="fl ww40"><span class="pl10 pr10 display-ib"></span></div>
              </div>
            </div>
          </li>
        </ul>
        <div class="tl pl120 f16 pb20"><a href="javascript:void(0);" id="backHome" class="btn-blue2 btn white radius-6 pl20 pr20 ml20">返回</a></div>
      </div>
    </div>
  </div> 
</div>
</form>

<script type="text/javascript">
DM.Page.ready({
	"加载数据":function(){
		$("#backHome").click(function(){
			myfn.AjaxFn("site/textInstructionsList.do",$(".viewFramework-content"),"");
		});
	 }
});
</script>