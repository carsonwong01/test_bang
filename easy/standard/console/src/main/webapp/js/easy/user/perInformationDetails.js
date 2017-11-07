	/**
 * 用户信息详情控制器js
 * wuxiao
 */
var nickNameOne,mobileOne,emileOne,provinceOne,cityOne,addressOne,passporNumOne,userLevelOne;
 
var PerInformationDetailsControler=DM.constructor.sub({
	//查询用户详情Ajax
	getPerInformationDetails:function(userStatus){
		var userId=$("#userId").val();
		var _self=this;
		 DM.ajax({
				type:"GET",
				url:basePath+"userManage/userDetailsAjax.do",
				data:{userId:userId},
				success:function(data){
					if(data){
						_self.setPerInformationDetailsAjax(data);	
					}
				},
				error:function(data){
					alert(999);
				}
			});
	   }, 
	   //重置表单
	   initiateFormReset:function(){
		    $("#proNum").val("");
		    $("#proName").val("");
		    $("#proType").val("");
		    $("#proStatus").val(""); 
	   },
	   //重置表单
	   supportFormReset:function(){
		    $("#orderId").val("");
		    $("#projectNo").val("");
		    $("#projectType").val("");
		    $("#status").val(""); 
		    $("#beginTime").val(""); 
		    $("#endTime").val(""); 
	   },
		 //查询用户发起记录Ajax
	   getInitiateProList:function(){
				var _self=this; 
				_self.initiateFormReset()
				var userId=$("#userId").val();
				 DM.ajax({
						type:"GET",
						url:basePath+"userManage/findInitiateProList.do",
						data:{id:userId},
						success:function(data){
							if(data){
								 $("#initiateProId").empty();
						         $('#initiateProTemplate').tmpl(data.initiate).appendTo("#initiateProId");
						         _self.pagesInitiateProPageId(data);
							}
						},
						error:function(data){
							alert(data);
						}
					});
		   },
		 //查询的Ajax
		 getInitiateAjaxList:function(){
				   var _self=this;
				  /* myfn.AjaxFn("user/perInformation.do",$(".viewFramework-content"),$("#dataForm").serialize());*/
				   DM.ajax({
						url:"userManage/findInitiateProList.do",
						data:$("#initiateForm").serialize(),
						success:function(data){
							if(data){
								 $("#initiateProId").empty();
						         $('#initiateProTemplate').tmpl(data.initiate).appendTo("#initiateProId");
						         _self.pagesInitiateProPageId(data);
							}
						},
						error:function(data){
						}
				   });
			   },
		   //用户发起项目记录分页 
		   pagesInitiateProPageId:function(data){
				  var _self=this;
				  $("#initiateProId").empty();
			      $('#initiateProTemplate').tmpl(data.initiate).appendTo("#initiateProId");
				  //初始化分页标签
				  DM.PageTags.init({
					  	reqType:"get",
					  	divId:"initiateProPageId",     //放入分页的div的id
				        formId:"initiateForm",  //表单id
				        curPage:data.initiate.pageResult.pageIndex,  //当前页
				        totalCount:data.initiate.pageResult.recordCount,//总记录数
				        pageCount:data.initiate.pageResult.pageTotal,//总页数
				        showPages:10,  //显示记录数
						url:basePath+"userManage/findInitiateProList.do",
				        toPageCallBack:function(msg){   //返回函数
				        	_self.pagesInitiateProPageId(msg);
				        }
				 });
			},
		   
		   //-------------------支持记录-----------------------------------------
			//查询用户支持订单Ajax
			getSupportProList:function(){
				  var _self=this;
				  _self.supportFormReset();
				var userId=$("#userId").val();
				 DM.ajax({
						type:"GET",
						url:basePath+"userManage/findSupportProList.do",
						data:{userId:userId},
						success:function(data){
							if(data){
								 $("#supportProId").empty();
						         $('#supportProTemplate').tmpl(data.support).appendTo("#supportProId");
						         _self.pagesSupportPageId(data);
							}
						},
						error:function(data){
							alert(data);
						}
					});
			   },
			   //查询的Ajax
			  getSupportAjaxList:function(){
						   var _self=this;
						  /* myfn.AjaxFn("user/perInformation.do",$(".viewFramework-content"),$("#dataForm").serialize());*/
						   DM.ajax({
								url:"userManage/findSupportProList.do",
								data:$("#supportForm").serialize(),
								success:function(data){
									if(data){
										 $("#supportProId").empty();
								         $('#supportProTemplate').tmpl(data.support).appendTo("#supportProId");
								         _self.pagesSupportPageId(data);
									}
								},
								error:function(data){
								}
						   });
					   },
			   //查询用户用户支持订单列表分页
			   pagesSupportPageId:function(data){
					  var _self=this;
					  $("#supportProPagetId").empty();
				      $('#supportProTemplate').tmpl(data.support).appendTo("#supportProPagetId");
					  //初始化分页标签
					  DM.PageTags.init({
						  	reqType:"get",
						  	divId:"supportProPagetId",     //放入分页的div的id
					        formId:"supportForm",  //表单id
					        curPage:data.support.pageResult.pageIndex,  //当前页
					        totalCount:data.support.pageResult.recordCount,//总记录数
					        pageCount:data.support.pageResult.pageTotal,//总页数
					        showPages:10,  //显示记录数
							url:basePath+"userManage/findSupportProList.do",
					        toPageCallBack:function(msg){   //返回函数
					        	_self.pagesSupportPageId(msg);
					        }
					 });
				},
			    
		//用户信息列表填充
	   setPerInformationDetailsAjax:function(data){
		   	 var _self=this;
		     $("#UserStatisticsId").empty();  
		     if(!data.singleResult.sex){
			   		data.singleResult.sex ="保密";
			      }
			   	if(!data.singleResult.realName){
			    	 data.singleResult.realName  ="暂未实名认证";
			     }
			     if(!data.singleResult.idCard){
			    	 data.singleResult.idCard  ="暂未实名认证";
			     } 
	         $('#UserStatisticsTemplate').tmpl(data.singleResult).appendTo("#UserStatisticsId");
	         
	         _self.getInitiateProList();
	         /*//填充基本信息
		      $("#personalInformationId").empty();
		   	 
			 $('#personalInformationTemplate').tmpl(data.singleResult).appendTo("#personalInformationId");*/
		} 
});

var controler=new PerInformationDetailsControler();
//页面加载时调用
DM.Page.ready({
	"查看用户信息详情":function(){
	    controler.getPerInformationDetails();
	}

});


