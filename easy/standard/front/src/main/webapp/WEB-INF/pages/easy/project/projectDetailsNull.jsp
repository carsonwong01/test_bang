<div style="height: 600px;">

</div>
<script type="text/javascript" >
  var status = ${status};
  var msg;
  if('1' == status){
	  msg="该项目已被删除，无法查看项目详情";
  }else{
	  msg="该项目由于违规信息已被下架，无法查看项目详情";
  }
  Dialog.confirm(msg, {
		picClass : "tip", //需要时设置,该属性用来显示提示信息成功或失败的图标（success，error,tip）
		showCancel : false,
		showClose : false, // 是否显示关闭按钮(右上角小X)
		callBack : function() {
			window.location.href = basePath+"user/userCenter.do?to=wdzc";
		}
	});
</script>
