FLG.Routers.DashboardRouter = Backbone.Router.extend({

	initialize: function(holder, user) {
		this.user = user;
		this.$holder = $(holder);
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

		that.$holder.html(UserDashBoardView.render().$el);
	},

	msgs: function() {
		var that = this;
		var UserMessagesIndexView = new FLG.Views.UserMessagesIndexView({
			model: that.user
		});
		that.$holder.html(UserMessagesIndexView.render().$el);
	}

});