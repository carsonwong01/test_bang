<div class="makeProject">
<form id="form" method="post">
	<input type="hidden" id="projectType" name="projectType" value=""/>
	<div class="layout">
		<ul class="tabbox">
			<span class="control">
				<em><i class="i1"></i></em>
				<br>
				个人求助
			</span>
			<span class="control centerbox projectChoose" data-projectType="6">
				<em><i class="i2"></i></em>
				<br>
				产品急销
			</span>
			<span class="control projectChoose" data-projectType="7">
				<em><i class="i3"></i></em>
				<br>
				实现梦想
			</span>
		</ul>
		<div class="friendly clearfix">
			<i class="trianle"></i>
			<dl class="projectChoose" data-projectType="1">
				<dt><i class="i1"></i></dt>
				<dd>
					<h6>大病救助</h6>
					<p>点滴温暖，救治大病患者</p>
				</dd>
			</dl>
			<dl class="projectChoose" data-projectType="2">
				<dt><i class="i2"></i></dt>
				<dd>
					<h6>灾难救助</h6>
					<p>八方支援，抵抗天灾人祸</p>
				</dd>
			</dl>
			<dl class="projectChoose" data-projectType="3">
				<dt><i class="i3"></i></dt>
				<dd>
					<h6>动物保护</h6>
					<p>传递爱心，拯救人类伙伴</p>
				</dd>
			</dl>
			<dl class="projectChoose" data-projectType="4">
				<dt><i class="i4"></i></dt>
				<dd>
					<h6>扶贫助学</h6>
					<p>伸出双手，支援偏远贫穷</p>
				</dd>
			</dl>
			<dl class="projectChoose" data-projectType="5">
				<dt><i class="i5"></i></dt>
				<dd>
					<h6>其他</h6>
					<p>其他特殊爱心救助</p>
				</dd>
			</dl>
		</div>
		<dl class="tips">
			<dt>${textInstruct.textTitle}</dt>
			<dd>
				${textInstruct.textContext}
			</dd>
		</dl>
	</div>
</form>
</div>
<script type="text/javascript">
//页面加载时调用
DM.Page.ready({
	"初始化" : function() {
		$(".projectChoose").click(function(){
			var _self = this;
			DM.ajax({
	            url:"user/project/findUserStatus.do",
	            data:{},
	            success:function(data){
	                if (data == '000000') {
	                	var projectType = $(_self).attr("data-projectType"),
							url = basePath+"user/project/projectStart.do";
						$("#projectType").val(projectType);
						$("#form").attr("action",url).submit();
	                }else if (data == '31000004') {
	                	Dialog.show({
	    	                msg:"很抱歉，您已被列入平台黑名单，无法发起项目。如有疑问，请联系平台客服人员。",
	    	                showClose: true,
	    	                picClass:"error",//需要时设置,该属性用来显示提示信息成功或失败的图标（success，error）
	    	                callBack:function(){
	    	                    
	    	                }
	    	            });
	                }
	            },
	            error:function(data){
	                 Dialog.show("系统异常，请联系管理员","error");
	            }
	        });
		});
	},
});
</script>