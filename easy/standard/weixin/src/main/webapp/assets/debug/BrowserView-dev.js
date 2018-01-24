/**
* 浏览器本地头
* 
 */

define(['Native'],function(Native){ 
    var BrowserView = {
        tempDialog : '<div style="z-index:100; background:#ffff00; position:fixed; margin:0 auto; top:200px;width:100%; border:1px solid #ccc;padding:10px; style:display:none;"><ul></ul></div>',        
        dialogData : {}, 
        header : null,
        init : function(){
            if(typeof Native != "object" ){
                return false;
            }
            var self = this;
            $.extend(Native,{
                isCreateHomePage : true,
                showSpinnerDialog : function(options,fireClick){                
                    if(!options)
                        return;
                    self.fireClick = fireClick;     
                    if(!self.$dom){
                        self.$dom = $(self.tempDialog).appendTo(document.body)
                            .bind("click",function(e){
                                var $target = $(e.target),
                                    num = $target.attr("num");
                                if(num == undefined){
                                    return;
                                }
                                var d = self.dialogData[num];
                                if(!d){
                                    alert("数据出错.......");
                                    return;
                                }                           
                                d.index = num;                              
                                self.fireClick(JSON.stringify(d));
                                wrapView.lightBox.hide();
                                self.$dom.hide();   
                            })
                    }
                    self.dialogData = options.items;
                    //[{cardName:"借记卡/存折",cardNo:"0"},{cardName:"一账通卡",cardNo:"1"},{cardName:"信用卡",cardNo:"2"}],
                    var arr = [];
                    var key = options.display;
                    $.each(options.items,function(i,list){
                        arr.push("<li num='"+i+"'>"+list[key]+"</li>");                     
                    });
                    wrapView.lightBox.show();
                    self.$dom.find("ul").html(arr.join(""));
                    self.$dom.show();                   
                },
                //创建头部
                showHeader : function(options){
                    if(typeof options != "object"){
                        return;
                    }
                    console.log("创建头部1");
                    if(!this.header){
                    	console.log("创建头部");
                        wrapView.$el.prepend('<header>\
                            <div light="t" action="leftBtnClick" class="div_left" style="display:none;"><span action="leftBtnClick" class="head_left"></span></div>\
                            <h1></h1>\
                            <div light="t" action="rightBtnClick" style="display:none;" class="div_right p_l20"><span action="rightBtnClick" class="head_right"><b></b><b></b><b></b></span></div></header>');                       
                        this.header = wrapView.$el.find("header").eq(0);
                        
                        this.header.bind("click",function(e){
                            var $elm = $(e.target),
                                action = $elm.attr("action");
                                
                            if(action == "leftBtnClick"){                               
                                wrapView.headerView.leftBtnClick();
                            }   
                            if(action == "rightBtnClick"){                              
                                wrapView.headerView.rightBtnClick();
                            }                               
                        });
                    }


                    if(options.left){
                        this.header.find("span").eq(0).html(options.left);
                        this.header.find("div").eq(0).show();
                    }else{
                        this.header.find("div").eq(0).hide();
                    }               
                    if(options.right){
                        this.header.find("span").eq(1).html(options.right);
                        this.header.find("div").eq(1).show();
                    }else{
                        this.header.find("div").eq(1).hide();
                    }
                    this.header.find("h1").html(options.title);                 
                },
                getSystemTime : function(success){
                    success()
                }
            });
            window.cordova = {
                exec: function(){}
            };

        }
    }
    
    return BrowserView;
});              
