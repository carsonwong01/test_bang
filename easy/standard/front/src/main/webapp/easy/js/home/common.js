//自适应宽度
function winWrap(){
	var width = $(window).width();		
	if(width > 1300){
	$("body").attr("class","wrap-1220");
    
	}else{
	$("body").attr("class","wrap-1002");
    }
}

//自适应宽度
$(window).resize(function() {
    winWrap();
});

$(document).ready(function(){
	//自适应宽度
	winWrap();

	// 输入框
	$(".focus_input .focus_text").each(function(){
		var thisVal=$(this).val();
		//判断文本框的值是否为空，有值的情况就隐藏提示语，没有值就显示
		if(thisVal!=""){
			$(this).siblings(".focus_input label").hide();
		}else{
			$(this).siblings(".focus_input label").show();
		}
		//聚焦型输入框验证
		$(this).focus(function(){
			$(this).siblings(".focus_input label").hide();
		}).blur(function(){
			var val=$(this).val();
			if(val!=""){
				$(this).siblings(".focus_input label").hide();
			}else{
				$(this).siblings(".focus_input label").show();
			}
		});
	});

	//进度条
    var progress = $('.progress'),
        len = progress.length,
        that,
        num; 

    for(var i = 0;i < len;i++){
        that = progress.eq(i).find('em');
        num = that.data('progress');
        if(num){
            that.animate({width:num+'%'},500);
        }
    }   
    
    //登陆后下拉菜单
    var login_tab  = $('.head .u-login span'),
        login_tabToken = true,
        login_box = $('.head .u-login');

    login_tab.on('click',function(e){
        var e = stopPag(e);
        if(login_tabToken){
            login_box.addClass('active');
        }
        else{
            login_box.removeClass('active');
        }
        login_tabToken = !login_tabToken;   

    }); 

    var doc = $(document);

    doc.on('click',function(e){
        var e = stopPag(e);
        login_box.removeClass('active');
        login_tabToken = true;
    });


    function stopPag(e){
        var e = e || window.event;
        if(e){
            e.stopPropagation();
        }
        else{
            e.cancelBubble = true;
        }

        return e;
    }


    //usertab切换
    var $usertab = $('.user-tab-til li'),$anip = $('.animate_p');
    var liHeight = $usertab.siblings().innerWidth();
    var tabIndex = 0;
    if(liHeight === 0){
        liHeight = $usertab.innerWidth();
    }
    $anip.width(liHeight);
    $usertab.hover(function () {
        liHeight = $(this).innerWidth();
        $anip.stop().animate({
            'left': $(this).offsetParent().context.offsetLeft,
            'widht':$anip.width(liHeight)
        }, 300);
    }, function () {
        liHeight = $usertab.eq(tabIndex).innerWidth();
        $anip.stop().animate({
            'left': $usertab.eq(tabIndex).position().left,
            'width':liHeight
        }, 300);
    });
    $usertab.click(function(){
        tabIndex  = $(this).index();
    })


	
});

//tab切换
    function setTab(name,cursel,n){
    var hover="hover";
    for(var i=1;i<=n;i++){
    var menu=$("#"+name+i);
    var con=document.getElementById("con_"+name+"_"+i);
    if(i==cursel){
            menu.addClass(hover);
        }
        else{
            menu.removeClass(hover);
        }
    
    if (con)con.style.display=i==cursel?"block":"none";
    }
    if($(".item_details_con").length>0){
        $("html,body").animate({scrollTop: $(".item_details_con").offset().top}, 200);
    }
}

//获取浏览器版本
var Browser = {
  IE6    : 'MSIE 6.0',
  IE7    : 'MSIE 7.0',
  IE8    : 'MSIE 8.0',
  IE9    : 'MSIE 9.0',
  IE10   : 'MSIE 10.0',
  IE     : 'MSIE',
  FF     : 'Firefox',
  Chrome : 'Chrome'
};


function BrowserType(type){
    var version = navigator.userAgent,
    regx = new RegExp(Browser[type]);

    return regx.test(version);
}

function setPlaceholder(){
    var lowIE = BrowserType('IE6') || BrowserType('IE7') || BrowserType('IE8') || BrowserType('IE9');
    if(lowIE){
        var ele_body = document.body.getElementsByTagName('*'),
            ele_len = ele_body.length,
            obj_ele = [],
            obj_temp = [],
            obj_len = 0,
            attr_temp = '',
            i;
    
        for(i = ele_len; i--;) {
            attr_temp = ele_body[i].getAttribute('placeholder');
            if( (attr_temp != null && attr_temp !=='') && ele_body[i].nodeType === 1 ){

                var isInput = ele_body[i].getAttribute('type') === 'text' || ele_body[i].getAttribute('type') === 'password',
                    istextarea = ele_body[i].nodeName === 'TEXTAREA' ? true : false;
                
                if(isInput || istextarea){
                    var thisFather = ele_body[i].parentNode,
                        warper = document.createElement('span'),
                        newEle = document.createElement('span'),
                        tempEle,
                        css = '',
                        lineHeight = '',
                        fontSize = '',
                        flashEle;

                    warper.className = 'passwp';
                    newEle.className = 'passTis';
                    newEle.innerHTML = attr_temp;
                    newEle.objInd = obj_ele.length;

                    if(!istextarea){
                        lineHeight = 'line-height:'+ele_body[i].clientHeight+'px;';
                    }

                    css = 'height:'+ele_body[i].clientHeight+'px;left:'+ele_body[i].currentStyle.paddingLeft+'';

                    fontSize = ele_body[i].currentStyle.fontSize ? ';font-size:'+ele_body[i].currentStyle.fontSize : '';

                    newEle.style.cssText = lineHeight+css+fontSize;

                    tempEle = ele_body[i].cloneNode(true);

                    warper.insertBefore(tempEle);
                    warper.insertBefore(newEle);
                
                    thisFather.replaceChild(warper,ele_body[i]);

                    if(istextarea){
                        flashEle = thisFather.getElementsByTagName('textarea')[0];
                    }
                    else{
                        flashEle = thisFather.getElementsByTagName('input')[0];
                    }

                    

                    flashEle.objInd = obj_ele.length;

                    obj_ele[obj_ele.length] = flashEle;

                    obj_temp[obj_temp.length] = flashEle.nextSibling;

                }
            }
        };

        obj_len = obj_ele.length;


        if(obj_len >= 1){

            for (i = obj_len; i--;) {

                obj_ele[i].onfocus = function(e){
                    stopProg(e);
                    obj_temp[this.objInd].style.display = 'none';
                };

                obj_ele[i].onblur = function(e){
                    stopProg(e);
                    if(this.value === ''){
                        obj_temp[this.objInd].style.display = 'block';
                    }
                    
                };

            };

            //span
            for (i = obj_len; i--;) {
                obj_temp[i].onclick = function(e){
                    stopProg(e);
                    this.style.display = 'none';
                    obj_ele[this.objInd].focus();
                };

            };


            function stopProg(e){
                var e = e || window.event;
                e.cancelBubble = true;
            }
        }
        else{
            return;
        }
    }
}



//判断是手机还是电脑
function IsPC() {
    var userAgentInfo = navigator.userAgent,
        Agents,
        v;
    
    Agents = ["SymbianOS", "iPod","iPad", "Windows Phone","iPhone", "Android"];

    for ( v = gents.length; v-- ;) {
        if (userAgentInfo.indexOf(Agents[v]) > 0) {
            return true;
        }
    }
    return false;
}


//判断是否为对象
function isJson(val){
    return typeof val === 'object' && Object.prototype.toString.call(val) === '[object Object]' && !('length' in val)
}

//tab切换
function toggleTab(tab,cont,options){

    if (!tab || !cont || typeof tab !== 'string' || typeof cont !== 'string') 
    return false; //event,cur,delay,autoplay,clear,onReady,onChange

    var _seft = this,
        $tab_ctr = $(tab),
        $cont_list = $(cont),
        ctr_len = $tab_ctr.length,
        _cont_len =  $cont_list.length, 
        _options = isJson(options)? options : {},
        evt = _options.event || 'click',
        cur = _options.cur || 0,
        i,
        onReady = _options.onReady;
        if(ctr_len<1 || _cont_len<1){
            return;
        }


    if(IsPC && ( _options.event === 'click' || _options.event === 'mouseover' || _options.event === 'mousemove' ) ){
        evt = 'touchstart';
    }   

    function init(){

        $tab_ctr.removeClass('active');
        $cont_list.hide();

        $tab_ctr.eq(cur).addClass('active');
        $cont_list.eq(cur).css('display','block');


        $tab_ctr.on(evt,begin);

        if(typeof onReady === 'function'){
            try{
                onReady();
            }
            catch(e){
                console.log(e);
            }
        }
        
    }   

    init();

    function begin(){
        var ind = $(this).index();
        if(ind === cur) return;
        toggleTo(ind);
    }

    function toggleTo(idx){
        $tab_ctr.eq(cur).removeClass('active');
        $cont_list.eq(cur).css('display','none');
        $tab_ctr.eq(idx).addClass('active');
        $cont_list.eq(idx).css('display','block');
        cur = idx;
    }
}

//列表展开与收起
//obj 要出发的对象（类型为 string 或者 jq对象）
//type类型 all表示所有列表都可同时展开，single表示所有列表都可不能同时展开且只能展开一个（类型 string）默认为all
//cName，焦点的名字（类型 string）
//fuji 触发节点的上一层（类型为 string）
//tongji 触发节点的相邻列表节点（类型 string）
function nav_slider(obj,cName,type,fuji,tongji){
    if(obj == null || obj === '')return;
    var _seft,
        slideFn,
        obj = obj,
        cName = cName || 'active',
        fuji = fuji || '',
        tongji = tongji || '',
        type = type || 'all';

    if(typeof obj === 'string') {
        obj = $(obj);
    }

    if(type !== 'single'){
        slideFn = function(){
            var father = _seft.parent(fuji);
            if(father.hasClass(cName)){
                _seft.siblings().slideUp('',function(){
                    father.removeClass(cName);
                });
                
            }
            else{
                _seft.siblings().slideDown('',function(){
                    father.addClass(cName);
                });
            }
        }
    }
    else{
        slideFn = function(){
            if(!_seft.hasClass(cName)){
              _seft.parent('li').siblings().find(cName).removeClass(cName).siblings('ul').hide();
              _seft.addClass(cName).siblings('ul').show(); 
            }
            else{
                slideUp(_seft.removeClass(cName).siblings('ul'));
            }
        }
    }   

    obj.click(function(){
        _seft = $(this);
        slideFn();
    });
}

//验证码公共方法
function changeCaptcha(obj) {
	obj.src = basePath + "captcha?ran=" + Math.random();
}

