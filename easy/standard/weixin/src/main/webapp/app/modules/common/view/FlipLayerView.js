/**
* 底部弹框
*/
define(['text!commonTemplate/FlipLayerTpl.html'], function(tpl) {
    return PAWA.PAWAView.extend({
        id : 'FlipLayer',
        name : 'FlipLayer',
        tagName : 'div',
        type   : 'control',
        className : 'FlipLayer dsn',        
        events : {
            "tap #FlipLayer ul li" : "FLayer",
            "tap .colseBnt" :"close"
        },
        // 初始化
        init : function(options) {  
            this.options = options;
            this.options["title"] = options["title"] || "提示";
            this.render(this.options);
        },
        render : function(options){
            var data = options.data;
            var html = _.template(tpl,options);  

            var Dheight = data.length*40;  //Dheight计算生成ul的高度

            wrapView.lightBox.show(); //遮罩曾显示         
            this.$el.html(html).show();
            this.el.style.display="block";
            this.el.style.marginTop = -Dheight/2-40+"px";  //更改高度
        },
        FLayer : function(e){   
            wrapView.lightBox.hide(); //遮罩曾隐藏
            this.$el.hide();   //先隐藏显示
            console.log(e.currentTarget.getAttribute("data"));
            var obj = {
            index:e.currentTarget.getAttribute("Index"),
            key:e.currentTarget.getAttribute("data"),
            value:e.currentTarget.firstElementChild.innerText.replace(/\s?/g,"")
            }
            this.options.callback(obj);  //回调前面调用方法
        },
        close : function(){
            wrapView.lightBox.hide(); //遮罩曾显示
            this.$el.hide();
            return this;
        }
    });
});

