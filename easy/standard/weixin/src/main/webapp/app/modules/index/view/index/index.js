define([ 'text!indexTemplate/indexTemplate.html',
         'text!indexTemplate/projectList.html',
         'commonClass/scroll/PTRScroll',
		'commonTool/validator','commonTool/slide'], function(indexTemplate,projectList,PTRScroll,Validator,Slide) {
	var indexView = DMJS.DMJSView.extend({
		id : 'indexviewContent',
		name : 'indexviewContent',
		tagName : 'div',
		className : "indexviewContent",
		events : {
			'tap #listTitle':'showLabelDetail',
			'tap .proList':'toProDetail'
		},
		init : function(options) {
			var self=this;
			var obj = {
					page: {
						pageIndex: 1,
						pageSize: 10,
						isOver: false,
						type:'',
						labelTypeId:'',
						
					}
			};
			_.extend(self, options, obj);
		},
		data:{
			pageResult:'',
			labelList:[
			           { "labelname": "推荐项目", "projecttype":"","labelTypeId":""},
			           // { "labelname": "项目列表", "projecttype":"1","labelTypeId":""},
			           // { "labelname": "实现梦想", "projecttype":"7","labelTypeId":""},
			       ]
		},
		
		
		render : function() {
			var self = this;
			//如果labelList有标签,先去除之前添加的标签再添加用户选择的标签
			var storage;
			self.data.storageList = [];
			if(window.localStorage){ //是否支持localStorage
				storage = window.localStorage;
				for(var i=0;i<storage.length;i++){
	                var key=storage.key(i);
	                if(key!="loginBackUrl"){
	                	var json=storage.getItem(key);
	                	if(json.indexOf("|")==-1){
	                		//var jsonObj=JSON.parse(json);//将字符串转为json
				            self.data.storageList.push(json);
	                	}
	                }
	            }
				DMJS.localStorage = self.data.storageList;//存储在全局变量
				if(DMJS.localStorage){
					self.data.labelList.splice(3);
					for(var i in DMJS.localStorage){
						self.data.labelList.push(DMJS.localStorage[i]);
					}
				}
			} 
			
			this.$el.html(_.template(indexTemplate, self.data)); // 将tpl中的内容写入到
			$("#listTitle li").first().addClass("fn-c-blue");
			self.totalInfo();//首页统计数据
			return this;
		},
		
		showLabelDetail:function(e){
			var self=this;
			$("#listTitle li").removeClass("fn-c-blue");
			var $dom=$(e.target);
			$dom.addClass("fn-c-blue");
			var id = $dom.attr("dataID");
			var labelTypeId=$dom.attr("labelTypeId");
			if(labelTypeId){
				self.page.type=$dom.text();
			}else{
				self.page.type=id;
			}
			self.page.labelTypeId=labelTypeId;
			self.page.pageIndex=1;
			self.page.isOver=false,
			self.recommendList(self.page);
		},
		
		toProDetail:function(e){
			var self=this;
			var $dom=$(e.target);
        	var projectId=$dom.parents(".proList").attr("projectId");
        	if($dom.hasClass("labelList")){
        		DMJS.router.navigate("index/index/labelDetail/"+$dom.text(),true);
        	}else{
        		DMJS.router.navigate("index/index/projectDetails/"+projectId,true);
        	}
        	
		},
		
		chooseTitle:function(){
			var self=this;
			var len=$("#listTitle").children("li").length;
			var width=$("#listTitle>li").first().width();
			var totalW=parseInt(len)*parseInt(width);
			var clientW=$(window).width();
			var slideW=totalW-clientW;
		    var runWidth =totalW - parseInt($("#listTitle").width()/width)*width;//最后回滚长度
		    
        	self.sliderTitle=new Slide("listTitle", "H", function(e){
	        		console.log($("#listTitle>li").last().offset().left);
	        		if(!this.hasNext()){
	        			this.currentXY = -runWidth;
	        			$("#listTitle")[0].style.webkitTransform = "translate3d("+-runWidth+"px, 0, 0)"
	        		}
				},false,function(e){
			},undefined,function(){
				
			},'0',width);
			
		},
		
		totalInfo:function(){
			var self=this;
			this.controller.indexModel.totalMessage({
				"noCache": true,
				cancelLightbox: true,
				"success": function(response) {
					//数据统计
					self.statistics(response.data.statResult);
					//轮播图
					self.buildAddList(response.data.advertiseList);
					//消息通知
					self.noticeList(response.data.noticelList);
					//推荐列表
					self.recommendList(self.page);
					//self.chooseTitle();
					
				}
			});
		},
		
		//首页推荐
		recommendList:function(page,callBack){
        	var self=this;
        	var __call=function()
        	{
                    	var dom=self.$el.find("#indexList")[0];
                 		if(!self.data.pageResult.hasNextPage){
                 			if(self.data.pageResult.list.length==0){
                 				dom.innerHTML='<div class="ub fn-s-14 ub-pc ub-ac mg-t-10">暂无推荐项目！</div>';
                 			}
            				return self.scroller.disablePullUpToLoadMore();
            			}else if(page.isOver/*||$('#FlipPrompt')*/){
            				return self.scroller.disablePullUpToLoadMore();
            			}else{
            				return self.scroller.enablePullUpToLoadMore();
            			}
            			
            }
        	var data={
        			reqPageNum:page.pageIndex,
        			maxResults:page.pageSize,
        	};
        	if(page.labelTypeId){
        		data.tagType=page.type,
    			data.projectType=''
        	}else{
        		data.tagType='',
    			data.projectType=page.type
        	}
        	self.controller.indexModel.recommendList({
        		'data':data,
	        	'cancelLightbox':true,
	        	"noCache":true,
				"success":function(response){
					 var $dom=self.$el.find("#indexList");
				     if(!response.data.pageResult.hasNextPage)
				     {
	                    page.isOver=true;
	                    DMJS.CommonTools.popTip("已经加载完所有数据！");
	                 }
				     self.data.pageResult = response.data.pageResult;
			         if(page.pageIndex == 1){
			        	 $dom.html(_.template(projectList,self.data.pageResult));
			         }else{
			        	 $dom.append(_.template(projectList,self.data.pageResult));
			        	 }
			         page.pageIndex++;
			         
				},
				"complete":function(){
	                          callBack&&callBack();
	                          self.loadListScroller(self.page);
	                        	__call();
	                        }
	        	});
        },
		
		//数据统计
		statistics:function(totalData){
			$('#cjze').html(DMJS.changeAmount(totalData.raiseTotal)); 
			$('#xuzs').text(totalData.projectCount); 
			$('#zcrs').text(totalData.memberCount);
		},
		//首页广告banner
		buildAddList:function(advData){
        	var self=this,$html_tmp='',$umal_tmp='';
        	var addSilder=self.$el.find("#sliderAdd"),prointArea=self.$el.find("#proint");
	        	for(var i=0;i<advData.length;i++){
					$html_tmp+="<li  class='bann1'>" +
					        "<a href="+advData[i].adPartnerUrl+">"+
							"<img src='"+Config.url('imgAddress')+advData[i].adImageUrl+"'  title='"+advData[i].adTitle+"'/>" +
							"</a>"+
							"</li>";
					$umal_tmp+="<span></span>";
	        	}
	        	addSilder.append($html_tmp);
	        	prointArea.append($umal_tmp);
        	var showProint=function(index){
				prointArea.children("span").removeClass("hover");
				$(prointArea.children("span")[index]).addClass("hover");
        		}
    			self.sliderAdd=new Slide("sliderAdd", "H", function(e){
    				showProint(this.currentPoint);
    				},false,function(e){
    			},undefined,function(index){
    				if(advData&&advData[index]&&advData[index].partnerUrl){
    					window.open(advData[index].partnerUrl,"_system");
    				}
    			});
    			self.startAddAutoTurn(1);
    			showProint(0);
        	//self.startAddAutoTurn(0,prointArea.children("span").length-1);

       },
       
       startAddAutoTurn:function(num,timeS){
          	var Slider,self=this,domStr;
          	var timeS=timeS||5000;
   			if(num===1){
   				Slider=self.sliderAdd;
   				domStr="addPicAutoTurn";
   				
   			}else{
   				Slider=self.noticeSlider;
   				domStr="noticeAutoTurn";
   			}
          		
          	if(Slider.length<1){
          		return;
          	}
   			DMJS.startThread(domStr,timeS,-1,function(){
   				if(this.isBack&&!Slider.hasPrev()){
   					this.isBack=false;
   				}
   				if(!this.isBack&&!Slider.hasNext()){
   					this.isBack=true;
   				}
   				if(this.isBack){
   					Slider.toPrev();
   				}else{
   					Slider.toNext();
   				}
   				if(num===1){
   					var addSilder=self.$el.find("#sliderAdd"),prointArea=self.$el.find("#proint");
   					prointArea.children("span").removeClass("hover");
       				$(prointArea.children("span")[self.sliderAdd.currentPoint]).addClass("hover");
   				}
   				
   			});
         },
       //首页公告
         noticeList:function(list){
         	var self=this;
         	var $dom=$('#noticeL'),str='',data=list.slice(0,3);
         	if(data.length > 0){
         		for(var i=0;i<data.length;i++){
     				str+='<li action="index/index/information/'+data[i].noticeId+'">'+data[i].noticeTitle+'</li>';
     			}
         		$dom.append(str);
         	}else{
         		//str+='<li>暂无公告</li>';
         		$(".notice-con").css({
         			"display":"none !important"
         		});
         	}
 			
 			
 			self.noticeSlider=new Slide("noticeL", "V", function(e){
 				
 				},false,function(e){
 			},undefined,function(){});
 			self.startAddAutoTurn(2,2000);
         },
         
         //加载滚动条
         loadListScroller: function(page){
             var self = this; 
             var wraper = $("#"+self.id); 
             if(!self.scroller){
             	 wraper.height(wrapView.height-$("#footer").height());
             	self.scroller = new PTRScroll(wraper[0], {
             		pullUpToLoadMore: !page.isOver,
					hideScrollbar: true,
					pullDownToRefresh:false,
					refreshContent: function(done) {
						page.pageIndex = 1;
						page.isOver = false;
						self.recommendList(page, done);
					},
					loadMoreContent: function(done) {
						self.recommendList(page, done);
					}
                 },true);
             }
             else{
             	if(page.isOver){
                 	self.scroller.disablePullUpToLoadMore();
             	}else{
             		self.scroller.enablePullUpToLoadMore();
             	}
             }
         }
		
		});

	return indexView;
});
