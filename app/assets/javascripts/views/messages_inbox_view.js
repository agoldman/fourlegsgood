FLG.Views.MessagesInboxView = Backbone.View.extend({
	
	render: function() {
		var that = this;

		var receivedMessages = new FLG.Collections.ReceivedMessages();
		receivedMessages.url = that.model.escape('id') + "/messages";
		receivedMessages.fetch({

			success: function() {
			//receivedMessages.each(function(msg){
				//console.log(msg.attributes);
			//});
			var renderedContent = JST["msgs/inbox"]({
				receivedMsgs: receivedMessages
			});
			that.$el.html(renderedContent);
			    }
			});
		return that;
	}
})