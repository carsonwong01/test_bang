define(["zepto"], function($){
	
	$(function DOMContentLoaded(){
		$(document).on("keypress", "[data-fractional-maxlength]", function(event){
			var target = event.target;
			var length = target.getAttribute("data-fractional-maxlength");

			// returns if value of attribute is invalid
			if(!/^\d+$/.test(length)) return;
			if((length = parseInt(length)) === 0) return;
			
			var value = target.value;
						
			// returns if length of fractional less than limit 
			var fractional = value.replace(/^[^.]*.?/, "");
			if(fractional.length < length) return;
			
			// returns if cursor position at integer part
			var pointPos = value.indexOf(".");
			if(pointPos !== -1 && target.selectionStart <= pointPos) return;
			
			event.preventDefault();
		});
	});
});