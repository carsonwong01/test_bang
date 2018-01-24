define(['commonClass/scroll/iscroll'], function(iscroll){
	var $support = {
		transform3d: ('WebKitCSSMatrix' in window),
		touch: ('ontouchstart' in window)
	};

	var $E = {
		start: $support.touch ? 'touchstart' : 'mousedown',
		move: $support.touch ? 'touchmove' : 'mousemove',
		end: $support.touch ? 'touchend' : 'mouseup',
		cancel: $support.touch ? 'touchcancel' : '',
		transEnd:'webkitTransitionEnd'
	};

	function getTranslateX(x) {
		return $support.transform3d ? 'translate3d('+x+'px, 0, 0)' : 'translate('+x+'px, 0)';
	}
	function getTranslateY(y) {
		return $support.transform3d ? 'translate3d(0,'+y+'px, 0)' : 'translate(0,'+y+'px)';
	}
	function getPage (event, page) {
		return $support.touch ? event.changedTouches[0][page] : event[page];
	}
	var zySlide = function(selector,dir,endFun,lock,transEnd,ingo,click,currentPoint,lWidth){
		var self = this;
		self._locked= lock;
		self.endFun = endFun || null;
		self.transEnd = transEnd||null;
		self.nodes = [];
		self.ingo=ingo;
		self.lWidth=lWidth;
		self.click=click;
		//V:vertical
        //H:horizontal
		self.dir = dir||"H";
		if (selector.nodeType && selector.nodeType == 1) {
			self.element = selector;
		} else if (typeof selector == 'string') {
			self.id=selector;
			self.element = document.getElementById(selector) || document.querySelector(selector);
		}
        self._vendor=(window.navigator.userAgent.indexOf("Android 4.")>=0);
		
		if(self.dir=="H")
			self.element.style.webkitTransform = getTranslateX(0);
		else
			self.element.style.webkitTransform = getTranslateY(0);
		
		self.conf = {};
		self.touchEnabled = true;
//		if(!!lWidth){//防止首页初始化左滑动
//			self.currentPoint = 1;
//		}else{
			self.currentPoint = currentPoint || 0;
//		}
		
		self.currentXY = 0;

		self.refresh();
		
		//parentNode
		self.element.parentNode.addEventListener($E.start, self, false);
		self.element.parentNode.addEventListener($E.move, self, false);
		self.element.parentNode.addEventListener($E.transEnd, self, false);
		if($E.cancel!="")
		{
			self.element.parentNode.addEventListener($E.cancel, self, false);
//			document.addEventListener($E.cancel, self, false);
		}
//		document.addEventListener($E.end, self, false);
		self.element.parentNode.addEventListener($E.end, self, false);

		return self;
	}

	zySlide.prototype = {
		handleEvent: function(event) {
			var self = this;
			if(event.type!=$E.end&&self.__bloac){
				return;
			}
			switch (event.type) {
				case $E.start:
					if(self.ingo&&$(event.target).parents(self.ingo).length>0){
						self.__bloac=true;
						break;
					}
					if(wrapView.FlipPrompt.isBlock){
						self.__bloac=true;
						break;
					}
					self._touchStart(event);
					break;
				case $E.move:
					self._touchMove(event);
					break;
				case $E.end:
				case $E.cancel:
					self.enableScroller();
					if(self.__bloac){
						self.__bloac=false;
						break;
					}
					self._touchEnd(event);
					break;
				case 'click':
					self._click(event);
					break;
				case $E.transEnd:
					if(self.transEnd)
						self.transEnd(event);
					break;
			}
		},
		addSection : function(obj){
			var self = this;
			self.element.appendChild(obj);
			self.refresh();
		},
		getSection : function(i){
			var self = this;
			var obj = self.nodes[i];
			if(obj.childNodes[1] && obj.childNodes[1].childNodes[1])
				return obj.childNodes[1].childNodes[1].childNodes[1];
			else
				return obj;
		},
		refresh: function() {
			var self = this;

			var conf = self.conf;

			// setting max point
			self.maxPoint = conf.point || (function() {
				var childNodes = self.element.childNodes,
					itemLength = 0,
					i = 0,
					len = childNodes.length,
					node;
				for(; i < len; i++) {
					node = childNodes[i];
					if (node.nodeType === 1) {
						self.nodes[itemLength]=node;
						itemLength++;
					}
				}
				if (itemLength > 0) {
					itemLength--;
				}
	
				return itemLength;
			})();
			
			// setting distance
			if(self.dir=="H"){
				if(!!self.lWidth){
					self.distance = parseInt(conf.distance || self.lWidth);
				}else{
					self.distance = parseInt(conf.distance || window.getComputedStyle(self.element,null).width);
				}
			}else{
				self.distance = parseInt(conf.distance || window.getComputedStyle(self.element,null).height);
			}
				
			// setting maxX maxY
			self.maxXY = conf.maxXY ? - conf.maxXY : - self.distance * self.maxPoint;
	
			self.moveToPoint(self.currentPoint);
		},
		hasNext: function() {
			var self = this;
	
			return self.currentPoint < self.maxPoint;
		},
		hasPrev: function() {
			var self = this;
	
			return self.currentPoint > 0;
		},
		toNext: function() {
			var self = this;

			if (!self.hasNext()) {
				return;
			}

			self.moveToPoint(self.currentPoint + 1);
		},
		toPrev: function() {
			var self = this;

			if (!self.hasPrev()) {
				return;
			}

			self.moveToPoint(self.currentPoint - 1);
		},
        moveToPoint: function(point) {
            var self = this;

            self.currentPoint = 
                (point < 0) ? 0 :
                (point > self.maxPoint) ? self.maxPoint :
                parseInt(point);
			
            self.element.style.webkitTransitionDuration = '500ms';
            self._setXY(- self.currentPoint * self.distance);
            

            var ev = document.createEvent('Event');
            ev.initEvent('css3flip.moveend', true, false);
            self.element.dispatchEvent(ev);
        },
        _setXY: function(xy) {
            var self = this;

            self.currentXY = xy;
            if(self.dir=="H")
            	self.element.style.webkitTransform = getTranslateX(xy);
            else
            	self.element.style.webkitTransform = getTranslateY(xy);
        },
        _touchStart: function(event) {
            var self = this;

            if(self._locked)
            {
           		event.preventDefault();
	            event.stopPropagation();
            }
            
            if (!self.touchEnabled) {
                return;
            }

            if (!$support.touch) {
                event.preventDefault();
            }

            self.element.style.webkitTransitionDuration = '0';
            self.scrolling = true;
            self.moveReady = false;
            self.startPageX = getPage(event, 'pageX');
            self.startPageY = getPage(event, 'pageY');
            if(self.dir=="H")
            	self.basePage = self.startPageX;
            else
            	self.basePage = self.startPageY
            self.direction = 0;
            self.startTime = event.timeStamp;
        },
        _touchMove: function(event) {
            var self = this;
			
            if(self._locked)
            {
           		event.preventDefault();
	            event.stopPropagation();
            }
            
            if (!self.scrolling) {
            	self.enableScroller();
                return;
            }else{
            	self.disableScroller();
            }
            var pageX = getPage(event, 'pageX'),
                pageY = getPage(event, 'pageY'),
                distXY,
                newXY,
                deltaX,
                deltaY;

            
            if (!self.moveReady) {
                deltaX = Math.abs(pageX - self.startPageX);
                deltaY = Math.abs(pageY - self.startPageY);
                if(self.dir=="H"){
	                if (deltaX>deltaY && deltaX > 5) {
						if(self._vendor)//Android 4.0 need prevent default
					    {
					   		event.preventDefault();
					    }
	                    self.moveReady = true;
	                    self.element.parentNode.addEventListener('click', self, true);
	                }
	                else if (deltaY > 5) {
	                    self.scrolling = false;
	                }
                }else{
                	if (deltaY>deltaX && deltaY> 5) {
						if(self._vendor)//Android 4.0 need prevent default
					    {
					   		event.preventDefault();
					    }
	                    self.moveReady = true;
	                    self.element.parentNode.addEventListener('click', self, true);
	                }
	                else if (deltaX > 5) {
	                    self.scrolling = false;
	                }
                }
            }
            if (self.moveReady) {
                //event.preventDefault();
                //event.stopPropagation();
				if(self.dir=="H")
					distXY = pageX - self.basePage;
				else
                	distXY = pageY - self.basePage;
                newXY = self.currentXY + distXY;
                if (newXY >= 0 || newXY < self.maxXY) {
                    newXY = Math.round(self.currentXY + distXY / 3);
                }
                self._setXY(newXY);

                self.direction = distXY > 0 ? -1 : 1;
            }
			if(self.dir=="H")	
            	self.basePage = pageX;
            else
            	self.basePage = pageY;
//			DMJS.getThread("touchendMonitor")||DMJS.startThread("touchendMonitor",300,-1,function(){
//                var _page_ins=getPage(self.lastAct,"pageX");
//                console.info(new Date().getTime()-self.lastAct.timeStamp+":"+_page_ins);
//                if(new Date().getTime()-self.lastAct.timeStamp>400){
//                	console.info("触发touchend 监控");
//                	self._touchEnd(event);
//                }
//			});
        },
        _touchEnd: function(event) {
            var self = this;
//            DMJS.removeThread("touchendMonitor");
//            if((-self.currentXY%self.distance)<5&&self.click){
//            	self.click(self.currentPoint);
////            	return;
//            }
            if(self.click){
            	if(event.timeStamp-self.startTime<500){
            		var _ck_pageX= getPage(event, 'pageX'),_ck_pageY=getPage(event,"pageY");
            		if(Math.abs(_ck_pageX-self.startPageX)<5&&
            				Math.abs(_ck_pageY-self.startPageY)<5){
            			self.click(self.currentPoint);
            		}
            	}
            }
            if(self._locked)
            {
           		event.preventDefault();
	            event.stopPropagation();
            }
            
            if (!self.scrolling) {
            	
                return;
            }

            self.scrolling = false;

            var newPoint = -self.currentXY / self.distance;
            newPoint =
                (self.direction > 0) ? Math.ceil(newPoint) :
                (self.direction < 0) ? Math.floor(newPoint) :
                Math.round(newPoint);

            self.moveToPoint(newPoint);

            setTimeout(function() {
                self.element.parentNode.removeEventListener('click', self, true);
            }, 200);
            if(self.endFun)
            	self.endFun();
        },
        _click: function(event) {
            var self = this;

            event.stopPropagation();
            event.preventDefault();
        },
        destroy: function() {
            var self = this;
            self.element.parentNode.removeEventListener($E.start, self);
            self.element.parentNode.removeEventListener($E.move, self);
            self.element.parentNode.removeEventListener($E.transEnd, self);
            self.element.parentNode.removeEventListener($E.cancel, self);
            self.element.parentNode.removeEventListener($E.end, self);
            self.element.removeEventListener($E.end,self);
			document.removeEventListener($E.end, self);
            document.removeEventListener($E.cancel, self);
        },
        "suspend":function(){
        	var self = this;
            self.element.parentNode.removeEventListener($E.start, self);
            self.element.parentNode.removeEventListener($E.move, self);
            self.element.parentNode.removeEventListener($E.transEnd, self);
            self.element.parentNode.removeEventListener($E.cancel, self);
            self.element.parentNode.removeEventListener($E.end,self);
			document.removeEventListener($E.end, self);
            document.removeEventListener($E.cancel, self);
        },
        "resume":function(){
        	var self=this;
    		self.element.parentNode.addEventListener($E.start, self, false);
    		self.element.parentNode.addEventListener($E.move, self, false);
    		self.element.parentNode.addEventListener($E.transEnd, self, false);
    		if($E.cancel!="")
    		{
    			self.element.parentNode.addEventListener($E.cancel, self, false);
//    			document.addEventListener($E.cancel, self, false);
    		}
    		self.element.parentNode.addEventListener($E.end, self, false);
        },
        "disableScroller":function(){
        	var scrollerContent=DMJS.currentView.scroller;
        	if(scrollerContent instanceof iscroll){
        		scrollerContent.disableMove();
        	}else{
        		for(var key in scrollerContent){
        			scrollerContent[key].disableMove();
        		}
        	}
        },
        "enableScroller":function(){
        	var scrollerContent=DMJS.currentView.scroller;
        	if(scrollerContent instanceof iscroll){
        		scrollerContent.enableMove();
        	}else{
        		for(var key in scrollerContent){
        			scrollerContent[key].enableMove();
        		}
        	}
        }
	}
	return zySlide;
});

