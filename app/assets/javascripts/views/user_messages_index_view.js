FLG.Views.UserMessagesIndexView = Backbone.View.extend({

	render: function() {
		var that = this;
	
		var receivedMessages = new FLG.Collections.ReceivedMessages();

		receivedMessages.url = that.model.escape('id') + "/messages";

		receivedMessages.fetch({
			success: function() {
			var renderedContent = JST["msgs/list"]({
				receivedMsgs: that.receivedMessages
			});

			    }
			})
		return that;
		}


	

});