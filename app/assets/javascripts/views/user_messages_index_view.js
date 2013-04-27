FLG.Views.UserMessagesIndexView = Backbone.View.extend({

	render: function() {
		var that = this;
	
		var receivedMessages = new FLG.Collections.ReceivedMessages();

		receivedMessages.url = that.model.escape('id') + "/messages";

		receivedMessages.fetch({
			success: function() {
				console.log(receivedMessages);
			var renderedContent = JST["msgs/list"]({
				receivedMsgs: receivedMessages
			});

			that.$el.html(renderedContent)
			    }
			})
		return that;
		}


	

});