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

		//window.$(".activedashtab").removeClass("activedashtab");
		//window.$(".profilenavtabdash").addClass("activedashtab");
		that.detailEl.html(MessagesInboxView.render().$el);
		console.log(that.detailEl);
	}
})