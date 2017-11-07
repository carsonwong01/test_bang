/**
 * 首页推荐列表js
 */
var AllProjectControler=DM.constructor.sub({
	//查询的Ajax
	getAllProjectListAjaxList:function(){
		   var _self=this;
		  /* myfn.AjaxFn("user/perInformation.do",$(".viewFramework-content"),$("#dataForm").serialize());*/
		   DM.ajax({
				url:"bus/projectManage/getRecommendProListAjax.do",
				data:$("#dataForm").serialize(),
				success:function(data){
					if(data){
						_self.setAllProjectAjaxQuery(data.data);		
					}
				},
				error:function(data){
				}
		   });
	   },
	   setAllProjectAjaxQuery:function(data){
		      var _self=this;
	          $("#projectData").empty();
			  //填充数据
			  $('#allProjectListTemplate').tmpl(data.pageResult).appendTo("#projectData");
			  //初始化分页标签
			  DM.PageTags.init({
			        divId:"projectPagerTag",     //放入分页的div的id
			        formId:"dataForm",  //表单id
			        curPage:data.pageResult.pageIndex,  //当前页
			        totalCount:data.pageResult.recordCount,//总记录数
			        pageCount:data.pageResult.pageTotal,//总页数
			        showPages:10,  //显示记录数
			        url:"bus/projectManage/getRecommendProListAjax.do",  //请求路径
			        isAjax:true,  //是否为ajax提交  true 为是  false为表单提交
			        toPageCallBack:function(data){   //返回函数
			        	_self.setAllProjectAjaxQuery(data.data);
			        }
			 });
		},
		 //项目推荐、推荐详情弹窗
		recommend:function(proId,dialogTile,proTile,proNum){
			var _self=this;
			var msg = "<div><h3>是否将项目"+dialogTile+"——"+proTile+"("+proNum+")设为推荐项目？</h3> <br>"
						+"<label>推荐位置：</label>"
						+"&nbsp;&nbsp;<input type='checkbox' value='1' name='recommend'>&nbsp;PC端"
						+"&nbsp;&nbsp;<input type='checkbox' value='2' name='recommend'>&nbsp;微信端"
						+"&nbsp;&nbsp;<input type='checkbox' value='3' name='recommend'>&nbsp;APP端"
						+"</div>";
			
			 Dialog.showDialog({
				       title:dialogTile,
				       dialogWidth:"430px",		    //弹出层默认宽度
					    dialogHeight:"auto",
				       msg:msg,
				       buttons:{
				       "确定":function(){
				    	           var isok = "false";
				    	           var isPc=null, isApp=null,isWeixin=null;
					    	       $('input:checkbox[name=recommend]:checked').each(function(i){
					    	    	   isok = "true";
					    	    	   var value = $(this).val();
					    	    	   if(value == '1'){
					    	    		   isPc = "1"; 
					    	    		   return true;
					    	    	   }else if(value == '2'){
					    	    		   isWeixin = "1"; 
					    	    		   return true;
					    	    	   }else if(value == '3'){
					    	    		   isApp = "1"; 
					    	    		   return true;
					    	    	   } 
					    	      });
					    	        
					    	       if(isok == "false"){
					    	    	   Dialog.show("请选择推荐位置！","error");
					    	    	   return false;
					    	       }
					    	       var data = {"proId":proId,"isPc":isPc,"isWeixin":isWeixin,"isApp":isApp};
					    	       //推荐
					    	       DM.ajax({
										url:"bus/projectManage/recommendPro.do",
										data:data,
										success:function(data){
											if(data.code == '000000'){
												Dialog.show("推荐成功","success");
												_self.getAllProjectListAjaxList();
											}else{
												Dialog.show(msg.description,"error");
											}
											Dialog.close('dialog');		
										} 
					    	       }); 
				        	  },
				       "取消":function(){
				    	   		Dialog.close('dialog');						  
				             }
				          }
			    }); 
		   },
		   
		   //锁定、解锁Ajax跳转
		   recommendInfo:function(type,id,dialogTile,proTile,proNum){
			   var _self=this;
			   if(type == "2"){
				   _self.recommend(id,dialogTile,proTile,proNum);
			   }
			    var data= {"id":id};
				DM.ajax({
					url:"bus/projectManage/findrecommendInfo.do",
					data:data,
					success:function(data){ 
						if(data.code=="000000"){ 
							var msg = "<div> " +
							"<h3>是否确认修改项目——"+proTile+"("+proNum+")？</h3><br><label>推荐位置：</label>";
							if(data.data.singleResult.isPc == '1'){
								msg += "&nbsp;&nbsp;<input type='checkbox' checked ='true' value='1' name='recommend'>&nbsp;PC端";
							}else{
								msg += "&nbsp;&nbsp;<input type='checkbox'  value='1' name='recommend'>&nbsp;PC端";
							}
							if(data.data.singleResult.isWeixin == '1'){
								msg += "&nbsp;&nbsp;<input type='checkbox' checked ='true' value='2' name='recommend'>&nbsp;微信端";
							}else{
								msg += "&nbsp;&nbsp;<input type='checkbox' value='2' name='recommend'>&nbsp;微信端";
							}
							if(data.data.singleResult.isApp == '1'){
								msg += "&nbsp;&nbsp;<input type='checkbox' checked ='true' value='3' name='recommend'>&nbsp;APP端";
							}else{
								msg += "&nbsp;&nbsp;<input type='checkbox'   value='3' name='recommend'>&nbsp;APP端";
							} 
							msg += "</div>";
							 Dialog.showDialog({
							       title:dialogTile,
							       dialogWidth:"430px",		    //弹出层默认宽度
								   dialogHeight:"auto",
							       msg:msg,
							       buttons:{
							       "确定":function(){  
					    	           var isPc="2", isApp="2",isWeixin="2";
						    	       $('input:checkbox[name=recommend]:checked').each(function(i){
						    	    	   var value = $(this).val();
						    	    	   if(value == '1'){
						    	    		   isPc = "1"; 
						    	    		   return true;
						    	    	   }else if(value == '2'){
						    	    		   isWeixin = "1"; 
						    	    		   return true;
						    	    	   }else if(value == '3'){
						    	    		   isApp = "1"; 
						    	    		   return true;
						    	    	   } 
						    	      });
						    	       var data = {"id":id,"isPc":isPc,"isWeixin":isWeixin,"isApp":isApp};
							    	 //修改推荐
						    	       DM.ajax({
											url:"bus/projectManage/updRecommendPro.do",
											data:data,
											success:function(data){
												if(data.code == '000000'){
													Dialog.show("修改推荐成功","success");
													_self.getAllProjectListAjaxList();
												}else{
													Dialog.show(msg.description,"error");
												}
												Dialog.close('dialog');		
											} 
						    	       });
							       },
							       "取消":function(){
							    	   		Dialog.close('dialog');						  
							             }
							          }
						    });
						}
					},
					error:function(data){
						
					}
				});
		   } 
});

var controler=new AllProjectControler();
//页面加载时调用
DM.Page.ready({

	"项目管理":function(){
	    controler.getAllProjectListAjaxList();
	},
	
	"导出列表":function(){
		//绑定导出事件
		$("#export").bind("click",function(){
			DM.exportExcel({
				"tableId" : "exportTable",
				"formId" : "dataForm",
				"fileName" : "项目推荐管理.xls",
				"url" : "bus/projectManage/recomProjectListExport.do"
			});
		});
	}

});


