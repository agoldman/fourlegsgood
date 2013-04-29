FLG.Views.MessagesInboxView = Backbone.View.extend({
	
	render: function() {
		var that = this;

		var receivedMessages = new FLG.Collections.ReceivedMessages();
		receivedMessages.url = that.model.escape('id') + "/received_messages";
		receivedMessages.fetch({

			success: function() {
			var renderedContent = JST["msgs/inbox"]({
				receivedMsgs: receivedMessages
			});
			that.$el.html(renderedContent);
			    }
			});
		return that;
	}
})