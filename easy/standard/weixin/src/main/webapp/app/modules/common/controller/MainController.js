/**
 * 定义应用的父控制器 所有的Controller都应该继承MainController, 以便维护公共业务逻辑
 */
define(
		[ 'commonView/CommonFootView', 'commonView/WrapperView',
				'text!commonTemplate/HeaderTpl.html',
				'commonClass/scroll/iscroll', 'commonClass/ActionFilter',
				'commonModel/CommonModel' ],
		function(commonFootView, wrapperView, headerTpl, iscroll, ActionFilter,
				CommonModel) {
			var MainController = DMJS.DMJSController.extend({
						setHeader : function(info) {
							if (info.key == "none") {
								$("#header").addClass("uhide");
								$("title").html(info.title);
								return false;
							} else {
								$("#header").removeClass("uhide");
							}
								var headerR = '<div id="header_right_left" class="umw1 ub ub-ac ub-pe luinn-ar3 " ></div><div id="header_right_right" class="mg-r-10 t-fe"></div>';
								info = info ? info : {
									'title' : Config.base("appName")
								};
								if ((typeof info.title)=="string") {
									$("#header_title").html(info.title);
								}else if((typeof info.title)=="object"&&info.title.title_left && info.title.title_right&&$('#tab_title_right').length<=0){
									
								var indexTitle="<div class='ub ub-pc fn-s-14'><div class=' pd-all-5 width30 intgrl-hder-left-clr' id='tab_title_left'>"+info.title.title_left.text+"</div><div  class='pd-all-5 width30 intgrl-hder-right-clr' id='tab_title_right'>"+info.title.title_right.text+"</div></div> "
					        	$("#header_title").html(indexTitle);
								
								

				        		
				        		wrapView.headCalls.title_left=info.title.title_left.func;
				        		wrapView.headCalls.title_right=info.title.title_right.func;
				
				        	}else if((typeof info.title)=="object"&&(typeof info.title.func)=="function"){
				        		$("#header_title").html(info.title.html);
				        		wrapView.headCalls.title=info.title.func;
				        	}
								if(!!info.title.type){
									if(info.title.type==1){
										$("#tab_title_left").removeClass("hover");
						   				$("#tab_title_right").addClass("hover");
									}else{
										$("#tab_title_right").removeClass("hover");
						   				$("#tab_title_left").addClass("hover");
									}
								}
					
							if (info.left) {
								$("#header_left").html(
										_.template(headerTpl, info.left));
								wrapView.headCalls.left = info.left.func;
							} else {
								$("#header_left").html("");
								wrapView.headCalls.left = undefined;
							}
							if (info.right_right) {
								if ($("#header_right").find(
										"#header_right_left").length == 0) {
									$("#header_right").html(headerR);
								}

								if (info.right_left == undefined) {
									$("#header_right_left").html("");
									wrapView.headCalls.right_left = undefined;
									$("#header_right_right").html(
											_.template(headerTpl,
													info.right_right));
									wrapView.headCalls.right_right = info.right_right.func;

								} else if (info.right_left) {
									$("#header_right_left").html(
											_.template(headerTpl,
													info.right_left));
									wrapView.headCalls.right_left = info.right_left.func;
									$("#header_right_right").html(
											_.template(headerTpl,
													info.right_right));
									wrapView.headCalls.right_right = info.right_right.func;

								}
							} else {
								$("#header_right").html("");
								wrapView.headCalls.right_left = undefined;
								wrapView.headCalls.right_right = undefined;
							}

						},
						setFoot : function(info) {
							var key = info.key ? info.key : "mainFoot";

							if (key != DMJS.currentFoot) {
								DMJS.currentFoot = key;
								if (key == "none") {
									$("#footer").addClass("uhide");
									return;
								} else {
									$("#footer").removeClass("uhide");
								}
								DMJS.currentFoot = key;
								
								require([ commonFootView.views[key].template ],function(template) {
											var footBtnData = commonFootView.views[key].data;// 临时保存底部按钮默认值
											if (info.btnName) {
												// 界面单独设置底部按钮显示文字
												commonFootView.views[key].data = info.btnName;
											}
											var $dom = $(_.template(template,commonFootView.views[key].data));
											
											commonFootView.views[key].data = footBtnData;// 还原底部按钮默认值
											if (key != "none"&& commonFootView.views[key].onLoad) {
												commonFootView.views[key].onLoad($dom,info.hash);
											}
											$("#footer").html($dom);
											
//											if(info.func===undefined){
//												if(info.btnName.text.indexOf('发布')!=-1){
//													$("div[footButton='button']").removeClass('c-red').addClass('yfb-c');
//												
//												}else{
//													$("div[footButton='button']").removeClass('c-red').addClass('lc-gra6');
//												}
//												
//												
//											}
											$("#footer").find("div[footButton]").tap(
															function() {
																var buttonKey = $(this).attr("footButton");
																if (info.func && info.func[buttonKey]) {
																	ActionFilter(
																			key == "mainFoot" ? "mainFoot"
																					: DMJS.currentView.id,
																			buttonKey,
																			function() {
																				info.func
																						&& info.func[buttonKey]
																								($(this));
																			});
																} else if (commonFootView.views[key].func
																		&& commonFootView.views[key].func[buttonKey]) {
																	ActionFilter(
																			key == "mainFoot" ? "mainFoot"
																					: DMJS.currentView.id,
																			buttonKey,
																			function() {
																				commonFootView.views[key].func[buttonKey]
																						($(this));
																			});
																}
															});

										});
							} else if (key != "none"
									&& commonFootView.views[key].onLoad) {
								commonFootView.views[key].onLoad($("#footer"),info.hash);
							}
						},
						setContent : function(ViewClass, options) {
							var hashUrl = window.location.hash.replace("#", "");
							$("#bigImg").parent().addClass("uhide");//隐藏放大图
				        	$("#bigImg").parent().removeClass("opacity1");
				        	
							if (window.listHash) {
								if (!(window.listHash.length > 0
										&& hashUrl == window.listHash[window.listHash.length - 1])) {
									if (hashUrl.indexOf("user/personal/login")==-1) {
										//[3,4,5,4,5,4,5]==>[3,4];
										if(window.listHash.indexOf(hashUrl)>=0){
											var index=window.listHash.indexOf(hashUrl);
											//开始移除重复的数据 只保留一个
											console.log(index);
											window.listHash.splice(index,window.listHash.length-index);
										}
										window.listHash.push(hashUrl);
									}
								} 
							}
							DMJS.killRequest();
							wrapView.lightBox.hide();
							if(wrapView.FlipPrompt){
								wrapView.FlipPrompt.closeFlayer();	
							}
							var url = window.location.hash.replace("#", "");
							var self = this;
							var contentView = DMJS.currentView, newContentView;
							if (contentView) {
								contentView.$el.find("input,select").each(
										function() {
											$(this)[0].blur();
										});
							}
							if (contentView && contentView instanceof ViewClass) {
								contentView.init && contentView.init(options);
								contentView.$el.show();
								self.clearScroll(contentView);
								return contentView;
							} else if (contentView) {
								if (contentView.noDestroy) {
									contentView.noDestroy = false;
									DMJS.hashView[contentView.url] = contentView;

								} else {
									DMJS.currentView.$el.addClass("uhide");//渲染出下一个页面前隐藏当前页面
									DMJS.currentView = null;
									if (contentView._lazyRender) {
										clearTimeout(contentView._lazyRender);
										delete contentView._lazyRender;
									}
								}
								contentView.$el.removeClass(
										Config.base("anim")['in']).addClass(
										Config.base("anim")['out']);
								setTimeout(function() {
									contentView.destroy();
									if (DMJS.currentView) {
										DMJS.currentView.$el.removeClass(Config
												.base("anim")['in']);
									}
								}, 350);
							}
							if (DMJS.hashView[url]) {
								var $scroller = $("#content");
								DMJS.hashView[url].$el.removeClass("uhide");
								$scroller.append(DMJS.hashView[url].$el);
								newContentView = DMJS.currentView = DMJS.hashView[url];
								newContentView.$el.removeClass(
										Config.base("anim")['out']).addClass(
										Config.base("anim")['in']);
								newContentView.fromCache = "Y";
								DMJS.hashView[url] = null;
								newContentView.delegateEvents();
								newContentView.resume
										&& newContentView.resume();
								if (newContentView.resizable
										&& newContentView.scroller) {
									newContentView.$el.height(wrapView.height
											- $("#header").height()
											- $("#footer").height());
									newContentView.scroller._resize();
								}
							} else {
								newContentView = new ViewClass(options);
								newContentView.url = url;
								newContentView.$el.show();
								var $scroller = $("#content");
								$scroller.append(newContentView.el);
								newContentView.$el.addClass("pt-page")
										.addClass(Config.base("anim")['in']);
								newContentView.delegateEvents();
								// 内容区域视图将会被添加到顶部视图对象的后面
								DMJS.currentView = newContentView;
							}
							return newContentView;
						},

						clearScroll : function(bodyView) {
							for (prop in bodyView) {
								if (bodyView[prop] instanceof iscroll) {
									bodyView[prop] = null;
								}
							}
						},
						commonModel : new CommonModel(),
					
					});
			DMJS.userId=DMJS.userId ? DMJS.userId : DMJS.CommonTools.getCookie("userId");
			MainController.createWrapView = function() {
				// 创建最外层的视图
				wrapView = new wrapperView({
					controller : this
				});
				// 渲染视图
				wrapView.render();
				// 将视图对象放到共享对象中
				DMJS.DMJSView.shareViews.add('wrapView', wrapView);
			};

			return MainController;
		});
