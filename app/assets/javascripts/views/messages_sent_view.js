FLG.Views.SentMessagesView = Backbone.View.extend({
	
	render: function() {
		var that = this;

		var sentMessages = new FLG.Collections.SentMessages();
		sentMessages.url = that.model.escape('id') + "/sent_messages"; //custom route
		sentMessages.fetch({

			success: function() {
			var renderedContent = JST["msgs/sent"]({
				sentMsgs: sentMessages
			});
			that.$el.html(renderedContent);
			    }
			});
		return that;
	}
})