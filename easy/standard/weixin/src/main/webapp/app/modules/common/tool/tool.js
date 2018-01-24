/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//转换还款方式
define([], function(){
        var tool={
        	Wi:[ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 ],  // 加权因子   
    		ValideCode: [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ],   
            changeTime:function(now,flg){
            	    now=new Date(now);
            	    var   nowTime = new Date();//当前时间
            	    var   year=now.getFullYear();     
                    var   month=now.getMonth()+1;     
                    var   date=now.getDate();     
                    var   hour=now.getHours();     
                    var   minute=now.getMinutes();     
                    var   second=now.getSeconds();  
                     month=(month<10)?("0"+month):month;
                     date=(date<10)?("0"+date):date;
                     hour=(hour<10)?("0"+hour):hour;
                     minute=(minute<10)?("0"+minute):minute;
                     second=(second<10)?("0"+second):second;
                     if(flg==true){
                    	return   year+"-"+month+"-"+date+"   "+hour+":"+minute;
                     }else if(flg==='day'){
                        return   year+"-"+month+"-"+date;     
                     }else if(flg==='biNow'){//和当前时间对比
                    	 if(now.getMonth() == nowTime.getMonth()&&now.getDate() == nowTime.getDate()&&year == nowTime.getFullYear()){//同一天显示时:分
                    		 return hour + ":" + minute;
    					 }else if(year == nowTime.getFullYear()){//同一年显示月-日 时:分
    						 return month +"-"+ date +" "+ hour + ":" + minute;
    					 }else{
    						 return year +"-"+month +"-"+ date +" "+ hour + ":" + minute;
    					 }
                     }else{
                     	return   year+"-"+month+"-"+date+"   "+hour+":"+minute+":"+second; 
                     }
            },
            ckTime:function(leftTime){//毫秒变时间
	            	var dd = parseInt(leftTime/1000/60/60/24 , 10);//计算剩余的天数
	                var hh = parseInt(leftTime/1000/60/60%24 , 10);//计算剩余的小时数   
	                var mm = parseInt(leftTime/ 1000/60 % 60, 10);//计算剩余的分钟数   
	                var ss = parseInt(leftTime/1000%60, 10);//计算剩余的秒数                

	               dd= dd>=10 ? dd : "0"+dd;
	               hh= hh>=10 ? hh : "0"+hh;
	               mm= mm>=10 ? mm : "0"+mm;
	               ss= ss>=10 ? ss : "0"+ss;   
	              if(!parseInt(dd)){
	              	return hh + " 时 " + mm + " 分 " + ss + " 秒";  
	              }else{
	              	 return dd + "天"+ hh + " 时 " + mm + " 分 " + ss + " 秒";  
	              }
	                
		    },
            currentTime:function(){
            		var now=new Date();
            	    var   year=now.getFullYear();     
                    var   month=now.getMonth()+1;     
                    var   date=now.getDate();     
                    var   hour=now.getHours();     
                    var   minute=now.getMinutes();     
                    var   second=now.getSeconds();  
                     month=(month<10)?("0"+month):month;
                     date=(date<10)?("0"+date):date;
                     hour=(hour<10)?("0"+hour):hour;
                     minute=(minute<10)?("0"+minute):minute;
                     second=(second<10)?("0"+second):second;
                    now= year+"/"+month+"/"+date+" "+hour+":"+minute+":"+second;     
                    
                   return this.changeMillisecond(now);
            },
            changeMillisecond:function(str){//日期转毫秒
            	str = str.replace(new RegExp("-","gm"),"/");
            	return (new Date(str)).getTime();
            },
            changePaymentType:function(paymentType){ 
               if(tool.isNull(paymentType)){
                switch(paymentType){
                    case 'DEBX':
                        return '等额本息';
                        break;
                    case 'MYFX':
                        return '每月付息,到期还本';
                        break;
                    case 'YCFQ':
                        return '本息到期一次付清';
                        break;
                    case 'DEBJ':
                        return '等额本金';
                        break;
                    default:
                        return paymentType;
                        break;
                }
                 }else{
                     return "";
                 }
            },
            
            changeStatusType:function(statusCode){
            	if(tool.isNull(statusCode)){
            		switch(statusCode){
            		case  1:
            			return '还款中';
            			break;
            		case  2:
            			return '逾期';
            			break;
            		case  3:
            			return '严重逾期';
            			break;
            		case  4:
            			return '还款中';
            			break;
            		default:
            			return 
            			
            		
            		}
            		
            	}else{
            		return "";
            	}
            	
            },
            changeFinancialType:function(financialType){ 
                if(tool.isNull(financialType)){ 
                     switch(financialType){
                    case 'credit':
                        return '信';
                        break;
                    case 'warrant':
                        return '担';
                        break;
                    case 'mortgage':
                         return '抵';
                         break;
                    case 'netValue':
                        return '净';
                        break;
                    case 'day':
                        return '天';
                        break;
                    case 'second':
                        return '秒';
                        break;
                    default:
                        return "保";
                        break;
                   }
                }else{
                    return "信";
                }
            },
            isStatusType:function(StatusType){ //标的状态
                if(tool.isNull(StatusType)){ 
                     switch(StatusType){
                    case 'TBZ':
                        return '投标中';
                        break;
                    case 'YFB':
                        return '预发布';
                        break;
                    case 'DFK':
                         return '待放款';
                         break;
                    case 'HKZ':
                        return '还款中';
                        break;
                    case 'YJQ':
                        return '已结清';
                        break;
                    case 'YDF':
                        return '已垫付';
                        break;
                    default:
                        return "没有状态";
                        break;
                   }
                }else{
                    return "没有状态";
                }
            },
            
            
            
            //截取字符串
            cutString:function(str , len){ 
               if(tool.isNull(str) && str.length > len){
                   return str.substr(0,len) + "...";
               }else{
                   return str;
               }
           },
           enumYearIncome:function(type){
        	   switch(type){
               case '1':
                   return '20万以下';
                   break;
               case '2':
                   return '20-50万以下';
                   break;
                case '3':
                    return '50-100万以下';
                    break;
                case '4':
                    return '100万以上';
                    break;
               default:
                   return "没有你要的";
                   break;
              }
        	   
           },
           
           
           
           
           
           

            /*转换理财方式
            changeFinancialType:function(financialType){ 
               if(tool.isNull(financialType)){ 
                    switch(financialType){
                   case '信用认证标':
                       return '信';
                       break;
                   case '实地认证标':
                       return '实';
                       break;
                    case '抵押标':
                        return '押';
                        break;
                   default:
                       return "保";
                       break;
                  }
               }else{
                   return "信";
               }
           },
           */
           //转换金额
           changeAmount:function(amount){ 
                var r= /^[1-9]?[0-9]*\.[0-9]*$/;
                amount=(amount+"").indexOf(",")!=-1 ? amount.replace(/,/g,"")  :amount  ;
                if(r.test(amount) && parseInt(amount) < amount){  
                	if(amount<10000)return amount;
                 	amount=(amount+"").split(".").length>=2 ? (amount+"").split(".")[0] : amount;
                }
                	if(tool.isNull(amount) && parseInt(amount) >= 100000000){
                		 return (amount/100000000).toFixed(2) + "<span class='fn-s-11 fn-c-gray'>亿</span>";
                	}
                    else if(tool.isNull(amount) && parseInt(amount) >= 10000){
                        return (amount/10000).toFixed(2) + "<span class='fn-s-11 fn-c-gray'>万</span>";
                    }else{
                        return (amount+"").split(".").length>=2 ? amount : (amount*1).toFixed(2);
                    }
                
           },

         

          
           /**  
            * 判断身份证号码为18位时最后的验证位是否正确  
            * @param a_idCard 身份证号码数组  
            * @return  
            */  
            isTrueValidateCodeBy18IdCard : function(a_idCard) {  
               var sum = 0;                              // 声明加权求和变量   
               if (a_idCard[17].toLowerCase() == 'x') {   
                   a_idCard[17] = 10;                    // 将最后位为x的验证码替换为10方便后续操作   
               }
               for ( var i = 0; i < 17; i++) { 
                   sum += tool.Wi[i] * a_idCard[i];           // 加权求和   
               }
               valCodePosition = sum % 11;               // 得到验证码所位置   
               if (a_idCard[17] == tool.ValideCode[valCodePosition]) {   
                   return true;   
               } else {
                   return false;   
               }
           },

           /**  
             * 验证18位数身份证号码中的生日是否是有效生日  
             * @param idCard 18位书身份证字符串  
             * @return  
             */  
            isValidityBrithBy18IdCard : function(idCard18){   
               var year =  idCard18.substring(6,10);   
               var month = idCard18.substring(10,12);   
               var day = idCard18.substring(12,14);   
               var temp_date = new Date(year, parseFloat(month)-1, parseFloat(day));   
               // 这里用getFullYear()获取年份，避免千年虫问题   
               if(temp_date.getFullYear() != parseFloat(year)   
                     || temp_date.getMonth() != parseFloat(month)-1   
                     || temp_date.getDate() != parseFloat(day)) { 
                       return false;   
               } else {
                   return true;   
               }
           },
            gaibAmount:function(n,unit,flag,type){//换算
         		 n=parseFloat(n);
	      	   if(tool.isNull(n)&&parseInt(n)>=10000){ 
	      		   n = Math.round((n /10000) * 100) / 100;
	      		   if(type!=='int'){
	      			   n=n.toFixed(2)
	      		   }
	      		  
	      		   if(flag==1){
	      		   	return n+'万'+unit;
	      		   }else{
	      		   	return n+'<span class="fn-s-11 fn-c-gray">万'+unit+'</span>'; 
	      		   }
	      		   
	             }else{
	             	
	            	 if(type!=='int'){
		      			   n=n.toFixed(2)
		      		   }
	             	if(flag==1){
	             		
	             		return n+unit;
	      		   }else{
	      		   	return n+'<span class="fn-s-11 fn-c-gray">'+unit+'</span>';
	      		   }
	                
	             }
	         },
           
           
           
           isNull:function(str){
               if(str !== null && str !== ''){ 
                   return true;
               } else{
                   return false;
               }
           },
           changeRepayType:function(str){
               if(tool.isNull(str)){
                    switch(str){
                        case 'bj':
                            return '本金';
                            break;
                        case 'lx':
                            return '利息';
                            break;
                        default:
                            return str;
                            break;
                    }
                 }else{
                     return "";
                 }
           },
           fmoney:function(s , n){
               if(s > 0){
                    n = n > 0 && n <= 20 ? n : 2;  
                    s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";  
                    var l = s.split(".")[0].split("").reverse(),  
                    r = s.split(".")[1];  
                    t = "";  
                    for(i = 0; i < l.length; i ++ )  
                    {  
                       t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");  
                    }  
                    return t.split("").reverse().join("") + "." + r;   
                }else if(s == 0){
                    return "0.00";
                }else{
                    return s;
                }
           },
           switchDiv:function(id , h){
                $("."+h).hide();
                $("#"+id).show();
           },
           _Navi_default:function(poinToURL){
           		var list=window.listHash;
           		if(list&&list.length>=2){
       					DMJS.router.navigate(list[list.length-2],true);
       					list.length=list.length-1;
       				}else{
       					list.splice(0,1);//不能直接写window.listHash=[] 来清除数组;
  					    DMJS.router.navigate(poinToURL,true);
       				}
       				//断开引用
           			list=null;
           },
           //登陆返回按钮
           _Navi_login:function(poinToURL){
           	var list=window.listHash;
           		if(list&&list.length>=2){
	       					if(list[list.length-1]=="user/personal/login"){
           					DMJS.router.navigate(list[list.length-2],true);
           					list.length=list.length-1;
	       					}
	       					else{
	       						if(list[list.length-1]=="user/personal/userInfo"){
	       							tool.hash_clear();
	       							DMJS.router.navigate(poinToURL,true);
	       						}else{
	       							list.splice(0,1);
	       						DMJS.router.navigate(list[list.length-1],true);
	       						}
	       					}
           				}else{
           					list.splice(0,1); //不能直接写window.listHash=[] 来清除数组;
           					DMJS.router.navigate(poinToURL,true);
           				} 
           				//断开引用
           				list=null;
           },
           hash_clear:function(){
           	window.listHash.length>0 ? window.listHash.splice(0,window.listHash.length) : null;
            console.log("hash length: "+window.listHash.length);
           },
           JSDropDown:function($dom){//临近div下拉隐藏或者显示
           		
              		if($dom.next().css('display')=='none'){
              				$dom.next().show(1000);
              				
              			}else{
              				$dom.next().hide(1000);
              				
              			}
              		
              		
              	},
            JSAppointDropDown:function(e,styleStr,hideOrShowDiv){//指定div隐藏或显示1.被点击的对象。2.样式
            	
            		var $dom = $(e.target),index=$(e.target).index(),$domP;
            			$dom.siblings().removeClass(styleStr);
            			$dom.addClass(styleStr);
	           	
	                	$domP = $(hideOrShowDiv);
	                	$domP.addClass('uhide');
	                	$($domP[index]).removeClass('uhide');
	            		
              		
              	},
             formate:function(d){//d:int
			        	return d>9?d:'0'+d;
			        	},
     };
     return tool;
});
