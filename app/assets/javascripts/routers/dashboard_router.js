FLG.Routers.DashboardRouter = Backbone.Router.extend({

	initialize: function(holder, user, MSGSrouter) {
		this.user = user;
		this.$holder = $(holder);
		this.MSGSrouter = MSGSrouter
	},

	routes: {

		"": "index",
		"msgs" : "msgs"
	},

	index: function() {
		var that = this;
		var UserDashBoardView = new FLG.Views.UserDashBoardView({
			model: that.user
		});

		window.$(".activedashtab").removeClass("activedashtab");
		window.$(".profilenavtabdash").addClass("activedashtab");
		that.$holder.html(UserDashBoardView.render().$el);
	},

	msgs: function(MSGSrouter) {
		var that = this;
		var UserMessagesView = new FLG.Views.UserMessagesView({
			model: that.user
		});
		window.$(".activedashtab").removeClass("activedashtab");
		window.$(".profilenavtabmsg").addClass("activedashtab");
		that.$holder.html(UserMessagesView.render().$el);

		var MessagesInboxView = new FLG.Views.MessagesInboxView({
			model: that.model
		});

		that.MSGSrouter.addEl($(".messages-list-box"));
		that.MSGSrouter.inbox();
	}

});