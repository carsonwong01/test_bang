define(['PAWAAll'], function(PAWA,core,zepto) {
	var Calendar = function(){
		this.init.apply(this,arguments)
	};
	Calendar.prototype = {
		options : {
		},
		init : function(options){
			$.extend(this,options||{});
			if(options.newDate){
				this.date = options.newDate;
			}else{
				this.date = PAWA.date;
			}
			/* 					
			var html = '<div class="p_lr10 m_t10">\
					<div class="list list_b">\
						<ul class="datalist data_tab"><li><ul class="ul_date ul_first">\
									<li class="w100 c"><div class="l_divinput" action="preM"><a class="editable" href="javascript:;" action="preM"></a></div><input disabled="disabled" class="input_date fl tac"  placeholder="2012-01-03"/><div class="r_divinput" action="nextM"><a href="javascript:;" action="nextM" class="disabled"></a></div></li>\
								</ul>\
								 <ul class="ul_date ul_first ul_first1">\
									<li class="">周日</li><li >周一</li><li>周二</li><li>周三</li><li>周四</li><li>周五</li><li class="">周六</li>\
								</ul>\
							 </li>\
							 $content</ul>\
					</div>\
				</div>';
			*/
			var html = '<div class="list list_b"><ul class="datalist data_tab c"><li class="box_title"><ul class="ul_date ul_first"><li class="w100 c"><div action="preM" class="l_divinput"><a action="preM" href="javascript:;" class=" editable"></a></div><input disabled="disabled"  class="input_date fl tac" placeholder="2012-01-03" style="color:#333"><div action="nextM" class="r_divinput"><a action="nextM" href="javascript:;" class="disable btnactive "></a></div></li></ul><ul class="ul_date ul_first ul_first1"><li>周日</li><li>周一</li><li>周二</li><li>周三</li><li>周四</li><li>周五</li><li class="">周六</li></ul></li> $content</ul></div>'			
			var content = new Array(7).join('<li class=" box_shadow"><ul class="ul_date"><li></li><li></li><li></li><li></li><li></li><li></li><li></li></ul></li>');            						
			var self = this;
			this.elm.html(html.replace('$content',content));
			
			this.txt = this.elm.find("input").eq(0);
			this.orgDate = PAWA.date;
			this.curDay=null;
			this.$lis = [];

			this.elm.find(".datalist>li").each(function(i,li){
				if(i>0){
					$(li).find("li").each(function(j,ili){
						self.$lis.push($(ili));
					});							
				}
			}).bind("tap",function(e){
				var $dom = $(e.target),
					action = $dom.attr("action"),
					num    = $dom.attr("num"),
					date   = self.date;
					
				if(action){
					self.action(action);
					return;
				}

				if(num!=undefined&&num!=""){
					self.curDay
						&&self.curDay.removeClass("click_focus")
					$dom.addClass("click_focus");
					self.curDay = $dom;
					self.dayClick
						&&self.dayClick(date.getFullYear(),date.getMonth()+1,num);
				}	
			});
			this.render();				
		},
		render : function(){
			var date  = this.date,
				orgDate = this.orgDate,
				year  = date.getFullYear(),
				month = date.getMonth(),
				day   = orgDate.getDate(),
				n = new Date(year,month,1).getDay(),              //本月第一天是星期几
				preDays = new Date(year,month,0).getDate(),       //上个月一共有多少天
				days =  new Date(year,month+1,0).getDate();       //本月一共有多少天					
		
			$.each(this.$lis,function(i,$li){
				var dn = i-n+1;
				if(i<n){
					$li.html(preDays - n+i+1).attr({
						"class" : "f_c_grey",
						"num"   : ""
					});
				}else if(i<days+n){						
					if((day == dn) && orgDate.getFullYear() == year &&orgDate.getMonth()==month){
						$li.html(dn).attr({
						"class" : "tody",
						"num"   : dn
						})
					}else if((day < dn) && orgDate.getFullYear() == year &&orgDate.getMonth()==month){
						$li.html(dn).attr({"class":"f_c_grey","num" : ""});
					}else{
						$li.html(dn).attr({
						"class" : "",
						"num"   : dn
						});
					}
				}else{
					$li.html(dn - days).attr({"class":"f_c_grey","num" : ""});
				}
			});
			
			this.txt.val(year+"-"+(month+1));
			
			var a = this.elm.find("a").eq(1);
			if(orgDate.getFullYear() == this.date.getFullYear() && orgDate.getMonth() == this.date.getMonth()){
				a.attr("class","disable");
			}else{
				a.attr("class","editable");
			}						
		},
		renderDay : function(data){
			if(!$.isArray(data)){
				return;				
			}
			$.each(this.$lis,function(i,$li){
				var num =  $li.attr("num")
				$.each(data,function(j,d){
					if(num == (parseInt(d.day))){
						if("in" in  d && "out" in  d){
							$li.addClass("in_out");
						}else if("in" in  d){
							$li.addClass("in");
						}else if("out" in  d){
							$li.addClass("out");
						}																		
					}					
				});
			});			
		},
		action : function(action){
			var date  = this.date,
				day   = date.getDate(),
				year  = date.getFullYear(),
				month = date.getMonth();
			// if(action == "preY" || action == "nextY"){
				// year+=action == "preY"?-1:1; 
			// }
			var orgDate = this.orgDate;
			if(action == "nextM" && orgDate.getFullYear() == this.date.getFullYear() && orgDate.getMonth() == this.date.getMonth()){
				return;
			}
			if(action == "preM" || action == "nextM"){
				month+=action == "preM"?-1:1;
				this.date = new Date(year,month,day);
				this.render();
				this.monthClick
					&&this.monthClick(this.date.getFullYear(),this.date.getMonth()+1,new Date(year,month+1,0).getDate());
			}
		}
	}
	return Calendar;
});
