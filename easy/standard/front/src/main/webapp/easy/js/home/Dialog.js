/** 
 * 弹出框
 *@ Author :chuzhisheng 
 *@ Date : 2015-8-15 
 *@ Version : 1.0 
 * 用法介绍：1.普通提示框：       Dialog.show("msg");  
 *                         Dialog.show("msg","success"); 
 *                         Dialog.show("msg","error");
 *                         Dialog.show("msg","tip");  
 *                         Dialog.show({
 * 										  title:"",//需要时设置,该属性用来显示弹框标题，可以不设置，默认为“提示信息”
 * 										  msg:"",
 * 										  picClass:"success",//需要时设置,该属性用来显示提示信息成功或失败的图标（success，error）
 * 										  callBack:function(){
 * 
 * 										  }
 *                                     });//第二个参数选填,该属性用来显示提示信息成功或失败的图标（success，error）
 *        2.confirm对话框：   Dialog.confirm("msg",{
 *       								          title:"提示信息",
 *       								          sureName:"确定",
 *                                                picClass:"success", //需要时设置,该属性用来显示提示信息成功或失败的图标（success，error）
 *       								          callBack:function(){
 *       								           //回调函数
 *       								          }
 *                                      });
 *                          Dialog.confirm({
 *       								      title:"提示信息",
 *       									  msg:"测试信息",
 *       								      sureName:"确定",
 *                                            picClass:"success", //需要时设置,该属性用来显示提示信息成功或失败的图标（success，error）
 *       								      callBack:function(){
 *       								           //回调函数
 *       								      },
 *                                            showCloseCallBack:function(){
 *                                                 //回调函数
 *                                            }
 *                                      });
 *        3.弹出层：          Dialog.showDialog({
 *        									     title:"提示信息",
 *        									     msg:"内容内容。。。。",
 *        										 buttons:{
 *        												  "提交":function(){
 *        												  
 *        												   },
 *        												  "取消":function(){
 *        												  
 *                                                        }
 *        										}
 *        									});
 */
(function(){
	var path = document.scripts;
    var parentPath = path[path.length-1].src.substring(0,path[path.length-1].src.lastIndexOf("/")+1);
	//加载样式
	var contain = window.document.getElementsByTagName("HEAD").item(0);
	var diaCssLink = window.document.createElement("link");
	if(contain){
		diaCssLink.href = basePath+"easy/css/dialog.css";
		diaCssLink.rel = "stylesheet";
		diaCssLink.type = "text/css";
		contain.appendChild(diaCssLink);
	}
	
    //默认参数
    var defaultOptions={
    		title: "提示信息",       			// 标题文字
    		showTitle: true,                //是否显示标题                                  
    	    showClose: true ,    			// 是否显示关闭按钮(右上角小X)
    	    showCloseForPage:"",			//跳转是否为页面
    	    sureName:"确定",					// confirm弹框，确定按钮名称
    	    cancelName:"取消",				// confirm弹框，取消按钮名称
    	    dialogWidth:"600px",		    //弹出层默认宽度
    	    dialogHeight:"150px",		        //弹出层默认高度
    	    msg:"",							//弹框展示内容
    	    showCancel:true,                //是否显示confirm弹框的取消按钮
    	    isLeftFloating:false                     //显示图标和内容是否左浮，只对 
    };

    var Dialog=Spine.Controller.sub({
    	init: function(){
    		
    	},
 		showDialog:function(options){
 			options=$.extend(defaultOptions,options);
 			options["type"]='dialog';
 			//将弹出层放置到页面
 			if(options["msg"]){
 			$("body").append(this.getTempl(options));
 			$("#dialogContains").css({"height":options["dialogHeight"]});
 			$("#dialog_popup_con_id").css({"width":options["dialogWidth"]});
 			}
 		},
 		show:function(msg,type){
 			//默认设置
			var defaultOptions={type:"alert",title:"提示信息",msg:""},options={};
			//只传了一个展示信息
 			if(typeof(msg)=="string"&&typeof(type)=="undefined"){
 				options={msg:msg};
 		    //传入展示信息和显示样式
 			}else if(typeof(msg)=="string"&&typeof(type)=="string"){
	 			options={msg:msg,picClass:type};
	 		//传入一个对象	
 			}else if(typeof(msg)=="object"&&typeof(type)=="undefined"){
 				options=msg;
 			}else if(typeof(msg)=="undefined"&&typeof(type)=="string"){
 				options={msg:""};
 			}
 			options=$.extend(defaultOptions,options);
 			if(options["msg"].length>15){
 				options["isLeftFloating"]=true;
 			}else{
 				options["isLeftFloating"]=false;
 			}
 			this.config.common_callBack=options["callBack"];
 			if(options["msg"]){
 			 //将弹出层放置到页面
 			 $("body").append(this.getTempl(options));
 			}
 		},
 		confirm:function(msg,options){
 			if(typeof(msg)=="object"&&typeof(options)=="undefined"){//传入一个对象
 				options=$.extend(defaultOptions,msg);
 			}else if(typeof(msg)=="string"&&typeof(options)=="object"){
 				options["msg"]=msg;
 				options=$.extend(defaultOptions,options);
 			}
 			options["type"]="confrim";
 			if(options["msg"]){
 			//将回调函数存入配置对象
 			this.config.callBack=options["callBack"];
 			//将关闭按钮回调函数存入配置对象
 			this.config.showCloseCallBack=options["showCloseCallBack"];
 			//将弹出层放置到页面
 			$("body").append(this.getTempl(options));
 			}
 		},
 		getCssTempl:function(options){
 			var picClass=options["picClass"],html="";
 			if (picClass == 'success') {
 				if(options["isLeftFloating"]){
 					html = "<div class=\"successful fl\"></div>";
 				}else{
 					html = "<div class=\"successful\"></div>";
 				}
 				
			}else if(picClass == 'error'){
				if(options["isLeftFloating"]){
					html = "<div class=\"error fl\"></div>";
 				}else{
 					html = "<div class=\"error\"></div>";
 				}
			}else if(picClass == 'tip'){
				if(options["isLeftFloating"]){
					html = "<div class=\"tips fl\"></div>";
 				}else{
 					html = "<div class=\"tips\"></div>";
 				}
			}
 			return html;
 		},
 		getTempl:function(options){
 			options=$.extend(defaultOptions,options);
 			var commonTempl,confirmTempl,dialogTempl,style="";
 			if(options["picClass"] == 'error') style="\"color:red;\"";
 			//根据类型拼接弹出框
	        if(options["type"] == 'dialog'){//弹出层
	    	   dialogTempl='<div class="dialog_popup_bg" id="dialog_popup_bg_id"></div>'
		           +'<div class="popup_con"  id="dialog_popup_con_id">';
			           if(options["showTitle"]){
			        	  dialogTempl+='<div class="hd clearfix">'
					       +'<h3>'+options["title"]+'</h3>';
			        	  if(options["showClose"]){
			        	  dialogTempl+='<a  href="javascript:void(0)" id="dialogClose_001" class="close" onclick="Dialog.close(\'dialog\');"  title="关闭"></a>';
			        	  }
			        	  dialogTempl+='</div>';
			           }
			   dialogTempl+=' <div class="bd" id="dialogContains"> '
			       +'<div class="form dialog_message">'
			       + options["msg"]
			       +'</div>'
			       +'</div>'
			       +'<div class="dbutton">';
		 		   if(options["type"] == 'dialog'){//弹出层
				    	   if(options["buttons"]){
				    		   var params=options["buttons"];//按钮数组
				    		   var count=1;
				    		   for(var i in params){//遍历显示每个按钮，并绑定其传入的按钮点击事件
				    			   if(params[i]){
				    				  this.config[i]= params[i];
				    				  if(count%2 == 0){ 
				    					  dialogTempl+= '<a onclick="Dialog.buttonMethod(\''+i+'\');" class="btn-public btn-w50h25 btn-gray ml30" id="cancel">'+i+'</a>';
				    				  }else{
				    					  if(params.length>2){
				    						  dialogTempl+='<a onclick="Dialog.buttonMethod(\''+i+'\')" class="btn-public btn-w50h25 btn-gray ml30">'+i+'</a>';
				    					  }else{
				    						  dialogTempl+='<a onclick="Dialog.buttonMethod(\''+i+'\')" class="btn-public btn-w50h25 btn-blue">'+i+'</a>'; 
				    					  }
				    				  }
				    				 count++;
				    			   }
				    		   }
				    	   }
				      }
		 		  dialogTempl+=
				      '</div>'
				     +'</div>';
	    	   return  dialogTempl;
	       }else if(options["type"] == 'confrim'){//confrim提示框
	    	   confirmTempl= '<div class="dialog_popup_bg" id="confirm_popup_bg_id"></div>'
		           +'<div class="popup_con popup_common" id="confirm_popup_con_id">';
		         if(options["showTitle"]){
		        	 confirmTempl+='<div class="hd clearfix">'
			       +'<h3>'+options["title"]+'</h3>';
	    	       if(options["showClose"]){
	    		    confirmTempl+='<a  href="javascript:void(0)" id="dialogClose_001" class="close" onclick="Dialog.close(\'confirm\');"  title="关闭"></a>';
	    	       }
	    	       confirmTempl+='</div>';
		         }
		         confirmTempl+=' <div class="bd"> '
			       +'<div class="form">'
			       + "<div class=\"main_content clearfix\"  style="+style+">"
			       +this.getCssTempl(options)
			       + "<div class=\"text\">"
			       + options["msg"]
					   +'</div>'
	               +'</div>'
			       +'</div>'
			       +'</div>'
			       +'<div class="dbutton">'
			       +'<a onclick="Dialog.sure();" class="btn-public btn-w50h25 btn-blue">'+options["sureName"]+'</a>';
			       if(options["showCancel"]){
			    	   confirmTempl+='<a onclick="Dialog.close(\'confirm\');" class="btn-public btn-w50h25 btn-gray">'+options["cancelName"]+'</a>';
			       }
	           confirmTempl+= '</div>'
			      +'</div>';
	    	   return  confirmTempl;
	       }else if(options["type"] == 'alert'){//普通提示框
	    	   commonTempl='<div class="dialog_popup_bg" id="common_popup_bg_id"></div>'
		           +'<div class="popup_con popup_common" id="common_popup_con_id">';
		          if(options["showTitle"]){
		        	  commonTempl+='<div class="hd clearfix">'
				       +'<h3>'+options["title"]+'</h3>';
			    	   if(options["showClose"]){
			    		   commonTempl+='<a  href="javascript:void(0)" id="dialogClose_001" class="close" onclick="Dialog.close(\'common\');"  title="关闭"></a>';
			    	   }
			    	   if(options["showCloseForPage"]!=null&&options["showCloseForPage"]!=''){
			    		   commonTempl+='<a href="'+options["showCloseForPage"]+'" id="dialogClose_001" class="close" title="关闭"></a>';
			    	   }
			    	   commonTempl+='</div>';
		          }
		          commonTempl+=' <div class="bd"> '
			       +'<div class="form">'
			       + "<div class=\"main_content clearfix\"  style="+style+">"
			       +this.getCssTempl(options);
			       if(options["isLeftFloating"]){
			    	   commonTempl+="<div class=\"text fl\">";
			       }else{
			    	   commonTempl+="<div class=\"text\">";
			       }
			      
			       commonTempl+= options["msg"]
	 			   +'</div>'
	 			   +'</div>'
			       +'</div>'
			       +'</div>'
			       +'<div class="dbutton">'
			       +'<a onclick="Dialog.commonSure();" class="btn-public btn-w50h25 btn-blue">确定</a>'
			       +'</div>'
				   +'</div>';
	    	   return commonTempl;
	       }   
 			return "";
 		},
 		close:function(flag){//关闭弹出框
 			if(flag=='common'){
 				$("#common_popup_bg_id,#common_popup_con_id").remove();
 			}else if(flag=='confirm' ||flag=='confrim'){
 				$("#confirm_popup_bg_id,#confirm_popup_con_id").remove();
                if(typeof this.config.showCloseCallBack =="function"){
                   this.config.showCloseCallBack();
                }
 			}else if(flag=='dialog'){
 				$("#dialog_popup_bg_id,#dialog_popup_con_id").remove();
 			}else{
 				$("#common_popup_bg_id,#common_popup_con_id").remove();
 				$("#confirm_popup_bg_id,#confirm_popup_con_id").remove();
 				$("#dialog_popup_bg_id,#dialog_popup_con_id").remove();
 			}
 		},
 		sure:function(){//confrim提示框确定按钮
 			this.close('confrim');
 			if(typeof this.config.callBack =="function"){
 			 this.config.callBack();
 			}
 		},
 		commonSure:function(){
 			this.close('common');
 			if(typeof this.config.common_callBack =="function"){
 				this.config.common_callBack();
 	 		}
 		},
 		config:{//弹出框配置对象
 			callBack:null,
 			showCloseCallBack:null
 		},
 		buttonMethod:function(obj){//弹出层 按钮点击事件回调函数
 			this.config[obj]();
 		}
    });
	//直接返回 Dialog实例对象
	this.Dialog=new Dialog();
}).call(this);