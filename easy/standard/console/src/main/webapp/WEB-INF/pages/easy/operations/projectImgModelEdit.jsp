<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--修改-->
<form method="post" id="mForm">
<input type="hidden" name="templateId" value="${templateId}"/>
<input type="hidden" name="imageId" value="${imageId}"/>
<div class="fl"> 
  <!--标题-->
  <div class="popup-title-container">
    <h3 class="pl20 f18">修改</h3>
    <a class="icon-i popup-close2" onclick="closeInfo()"></a></div>
  <!--标题 end-->
  <div class="popup-content-container-2">
    <ul class="gray6 pt50">
      <li class="mb20">
        <div class="pr mh30 pl120"><span class="display-ib w100 lh30 tr mr5 pa left0 top0"><em class="red pr5">*</em>默认图片类型</span>
          <div class="pr tl top4">
            <c:if test="${imageType eq '1'}">用户头像</c:if>
            <c:if test="${imageType eq '2'}">项目封面</c:if>
            <c:if test="${imageType eq '3'}">身份证示例图片</c:if>
            <c:if test="${imageType eq '4'}">医疗证明示例图片</c:if>
            <c:if test="${imageType eq '5'}">结婚证示例图片</c:if>
            <span class="ml5"></span></div>
        </div>
      </li>
      <li class="mb20">
        <div class="pr mh30 pl120"><span class="display-ib w100 lh30 tr mr5 pa left0 top0"><em class="red pr5">*</em>图片内容</span>
          <div class="pr tl clearfix">
            <div class="clearfix">
              <img src="${imageUrl}" id="showPic1" class="border p2 fl mr10" width="160" height="160">
              <div class="fl w400"><input type="file" name="imageFile" id="imgModelImage" class="ui-upload-input"/><span class="pl10 pr10 display-ib fl">支持1840px*500px jpg、png、jpeg格式</span></div>
            </div>
          </div>
        </div>
      </li>
    </ul>
    <div class="tl pl200 f16 pb20"><a href="javascript:void(0);" id="updateImg" class="btn-blue2 btn white radius-6 pl20 pr20 ml20 mr20">确定</a><a href="javascript:void(0)" onclick="closeInfo()" class="btn btn-gray radius-6 pl20 pr20 ml20 mr20">取消</a></div>
  </div>
</div>
</form>

<script>
$(document).ready(function(){
	$("#imgModelImage").uploadPreview({ Img: "showPic1" });//图片预览 
});
dmCheck.init("#mForm");
var ImageModelSetController=DM.Controller.sub({ 
 	//保存回调
	returnPageBasic:function(msg){
		if(msg.code=='000000'){
		    closeInfo();
			Dialog.show({
    		   msg:"保存成功",
    		   showClose:true,
    		   showCancel:false,
    		   picClass:"success",
    		   titile:"提示信息",
   			   callBack:function(){
   				   imageModelController.loadRecord();
   			   }
    	    });
		}else{
		    Dialog.show("保存失败","error");
		}
	},
	//校验是否上传了图片
	checkFileIsNull:function(){
		var imgModelImage=$("#imgModelImage").val();
			if(imgModelImage==''){
				Dialog.show("请上传图片","tip");
				return false;
			}else{
				return true;
			}
		
	},
	// 上传附件
	uploadFile:function(idStr) {
		var _this=this;
		var fileType=[ "jpg", "png", "jpeg"];
		var _this=$("#"+idStr);
		if (!RegExp("\.(" + fileType.join("|") + ")$", "i").test(_this.val().toLowerCase())) {
	    	Dialog.show("选择文件错误,文件类型必须是" + fileType.join("，") + "中的一种","error");
	    	_this.val("");
	        return false;
	    }
		var file=document.getElementById(idStr);
		var size=this.fileChange(file);
    	if(size>1024000){   
    		Dialog.show("视频太大，不能大于1G","error");  
    		_this.val("");
    		return false;
    	}else if(size == 0){
    		Dialog.show("文件大小验证未生效！\r\n启用此验证，请如下修改浏览器设置：工具->Internet选项->安全->本地Intranet->自定义级别->ActiveX控件和插件->对未标记为可安全执行脚步的ActiveX控件初始化并执行脚步->启用！","tip");  
    		_this.val("");
    		return false;
    	} 
	},
	fileChange:function(target) {     
		var isIE = /msie/i.test(navigator.userAgent) && !window.opera;     
		var fileSize = 0;     
		if (isIE) {   
			try{
				target.select();
			    var filePath = document.selection.createRange().text;    
			    var fileSystem = new ActiveXObject("Scripting.FileSystemObject");         
			    var file = fileSystem.GetFile(filePath);      
			    fileSize = file.Size;
		  	}catch (e) {
				if(e.description=="Automation 服务器不能创建对象"){
					fileSize=0;
				}
			}
		} else {
			fileSize = target.files[0].size;      
		}
		var size = fileSize / 5120;     
	   	return size; 
	     
	}
});   

var flagSubmit = false;
var imgSetController=new ImageModelSetController();
//页面加载时调用
DM.Page.ready({
	"初始化":function(){
		//ajax表单提交
		DM.Util.ajaxForm({
			formId:"mForm",        //表单id
			url:"operations/updateImgModel.do",//后台处理地址
			success:imgSetController.returnPageBasic  // 提交后的回调函数
		});
	},
	"表单提交":function(){
		//点击确定按钮
		$("#updateImg").click(function(){
			if(flagSubmit){
				return;
			}
			if(dmCheck.check("#mForm") && imgSetController.checkFileIsNull()){
				flagSubmit = true;
				$("#mForm").submit();
				
			}
		});
		//上传文件类型校验
		$("#imgModelImage").change(function(){
			imgSetController.uploadFile("imgModelImage");
		});
	}
});
</script>