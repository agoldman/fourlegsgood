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

	},

	msgs: function() {
		var that = this;
		var UserMessagesIndexView = new FLG.Views.UserMessagesIndexView({
			model: that.user
		});
		that.$holder.html(UserMessagesIndexView.render().$el);
	}

});