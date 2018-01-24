define(["zepto", "backbone"], function($, Backbone){

	//trigger valueChange event when element(input) value change
	if(!document.__initialize__valueChange_event){
		document.__initialize__valueChange_event = true;
		
		$(document).on("keyup", "input", function(event){
			var newEvent = $.Event("valueChange", event);
			newEvent.newValue = event.target.value;
			$(event.target).trigger(newEvent);
		});
	}
	
	var InputView = Backbone.View.extend({

		initialize: function(){
			this.container = this.$el.closest("[data-component-field-container]");
			this.cancelButton = this.container.find("[data-component-input-cancel-button]");
			
			this.$el.on("valueChange", _.bind(this.toggleCancelButton, this));
			this.cancelButton.on("click", _.bind(this.clearValue, this));
			
			this.toggleCancelButton();
		},
		
		val: function(value){
			if(value === undefined) return this.$el.val();
			this.$el.val(value);
			this.toggleCancelButton();
			return this;
		},
		
		toggleCancelButton: function(){
			if(this.options.cancelButton)
				this.cancelButton.toggle(this.val() !== "");
		},
		
		clearValue: function(){
			this.val("");
			this.$el.attr("paText", "");
			this.cancelButton.hide();
		}
	});
	
	return InputView;
});
