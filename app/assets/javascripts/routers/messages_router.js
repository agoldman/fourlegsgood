FLG.Routers.MessagesRouter = Backbone.Router.extend({

	initialize: function(user) {
	this.user = user;
	},

	addEl: function(detailEl) {
	this.detailEl = detailEl;
	},


	routes: {

		"msgs/inbox": "inbox",
		"msgs/sent" : "sent",
		"msgs/all" : "all",
		"msgs/new" : "new"
	},

		index: function() {
		var that = this;
		var MessagesInboxView = new FLG.Views.MessagesInboxView({
			model: that.user
		});

		window.$(".selectedmsgs").addClass("msglink").removeClass("selectedmsgs");
		window.$(".inboxlist").removeClass("msglink").addClass("selectedmsgs");

		that.detailEl.html(MessagesInboxView.render().$el);
		console.log(that.detailEl);
	},

		sent: function(){
		var that = this;
		var SentMessagesView = new FLG.Views.SentMessagesView({
			model: that.user
		});

		that.detailEl.html(SentMessagesView.render().$el);
		window.$(".selectedmsgs").addClass("msglink").removeClass("selectedmsgs");
		window.$(".sentlist").removeClass("msglink").addClass("selectedmsgs");
		console.log(that.detailEl);
		}

})