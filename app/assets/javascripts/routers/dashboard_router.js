FLG.Routers.DashboardRouter = Backbone.Router.extend({

	initialize: function(holder, user, MSGSrouter) {
		this.user = user;
		this.$holder = $(holder);
		this.MSGSrouter = MSGSrouter
	},

	routes: {

		"": "index",
		"msgs" : "msgs",
		"pets" : "pets",
		"reviews": "reviews", 
		"history": "history"
	},

	removeActiveTab: function() {
		window.$(".activedashtab").removeClass("activedashtab");
	},

	addActiveTab: function(el) {
		window.$(el).addClass("activedashtab");
	},

	index: function() {
		var that = this;
		var UserDashBoardView = new FLG.Views.UserDashBoardView({
			model: that.user
		});
		that.removeActiveTab();
		that.addActiveTab(".profilenavtabdash");
		that.$holder.html(UserDashBoardView.render().$el);
	},

	msgs: function(MSGSrouter) {
		var that = this;
		var UserMessagesView = new FLG.Views.UserMessagesView({
			model: that.user
		});
		that.removeActiveTab();
		that.addActiveTab(".profilenavtabmsg");
		that.$holder.html(UserMessagesView.render().$el);
		var MessagesInboxView = new FLG.Views.MessagesInboxView({
			model: that.model
		});
		that.MSGSrouter.addEl($(".messages-list-box"));
		that.MSGSrouter.inbox();
	},

	pets: function() {
		var that = this;
		var PetView = new FLG.Views.PetView({
			model: that.user
		});
		that.removeActiveTab();
		that.addActiveTab(".profilenavtabpets");
		that.$holder.html(PetView.render().$el);
	},

	reviews: function() {
		var that = this;
		var ReviewsView = new FLG.Views.ReviewsView({
			model: that.user
		});
		that.removeActiveTab();
		that.addActiveTab(".profilenavtabrev")
		that.$holder.html(ReviewsView.render().$el);
	}, 

	history: function() {
		var that = this;
		var HistoryView = new FLG.Views.HistoryView({
			model: that.user
		});
		
		that.removeActiveTab();
		that.addActiveTab(".profilenavtabhist");
		that.$holder.html(HistoryView.render().$el);
	}

});