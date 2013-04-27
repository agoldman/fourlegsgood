FLG.Views.UserMessagesView = Backbone.View.extend({

	render: function() {
		var that = this;

		var renderedContent = JST["msgs/list"]({
		});
		that.$el.html(renderedContent)
		return that;
		}

});