define(["zepto", "backbone"], function($, Backbone){
	
	//trigger valueChange event when element(input) value change
	if(!document.__initialize_valueChange_event){
		document.__initialize_valueChange_event = true;
		
		$(document).on("keyup.textbox", "input", function(event){
			var newEvent = $.Event("valueChange", event);
			newEvent.newValue = event.target.value;
			$(event.target).trigger(newEvent);
		});
	}

	
	var TextBox = Backbone.View.extend({
		
	    initialize: function(option){
	        if(!$(option.el).length) throw "the el option is required";
	
	        this.fieldContainer = this.$el.closest("[data-component-field-container]");
	        this.cancelButton = this.fieldContainer.find("[data-component-input-cancel-button]");
	        this.input = this.$el;
	
	        this.input.on("valueChange", _.bind(TextBox.prototype.handleValueChangeEvent, this));
	        this.cancelButton.on("touchstart", _.bind(this.handleTouchCancelButton, this));
	
	        this.renderCancelButton();
	        this.renderPlaceholder();
	    },
	
	    val: function(newValue){
	        if(newValue === undefined){
	            var value = this.input.val();
	            var phText = this.input.attr("placeholder");
	            return this.isButton() && value === phText ? "" : value;
           	}
	            
	        this.$el.val(newValue);
	        this.renderCancelButton(!!newValue);
	        this.renderPlaceholder();
	    },
	
	    renderCancelButton: function(present){
	        this.cancelButton.toggle(present == null ? !!this.val() : present);
	    },
	    
	    renderPlaceholder: function(present){
	        var placeholderText = this.input.attr("placeholder");
	        if(!placeholderText || !this.isButton()) return;
	        
	        if(this.val() === ""){
	            this.$el.val(placeholderText);
	            this.$el.addClass("f_c_grey");
	        }
	        else{
	            this.$el.removeClass("f_c_grey");
	        }
	    },
	
	    handleValueChangeEvent: function(event){
	        this.val(event.newValue);
	        this.renderCancelButton(!!event.newValue);
	        this.renderPlaceholder();
	    },
	    
	    handleTouchCancelButton: function(event){
	    	this.val("");
	    	this.input.focus();
	    },
	    
	    isButton: function(){
	    	return /^input$/i.test(this.input.prop("tagName"))
	    		&& /^button$/i.test(this.input.prop("type"));
	    }
	});
	
	return TextBox;
});
