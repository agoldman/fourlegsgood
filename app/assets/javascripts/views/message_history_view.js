FLG.Views.MessagesHistoryView = Backbone.View.extend({
	
	render: function() {
		var that = this;
		var messages = new FLG.Collections.Messages();
		messages.url = that.model.escape('id') + "/messages";
		messages.fetch({

			success: function() {
			var renderedContent = JST["msgs/history"]({
				msgHistory: messages
			});
			that.$el.html(renderedContent);
			    }
			});
		return that;
	}
})