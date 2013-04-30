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
	},

	pets: function() {
		var that = this;
		var PetView = new FLG.Views.PetView({
			model: that.user
		});
		window.$(".activedashtab").removeClass("activedashtab");
		window.$(".profilenavtabpets").addClass("activedashtab");
		that.$holder.html(PetView.render().$el);
	},

	reviews: function() {
		var that = this;
		var ReviewsView = new FLG.Views.ReviewsView({
			model: that.user
		});
		window.$(".activedashtab").removeClass("activedashtab");
		window.$(".profilenavtabrev").addClass("activedashtab");
		that.$holder.html(ReviewsView.render().$el);
	}, 

	history: function() {
		var that = this;
		var HistoryView = new FLG.Views.HistoryView({
			model: that.user
		});
		
		window.$(".activedashtab").removeClass("activedashtab");
		window.$(".profilenavtabhist").addClass("activedashtab");
		that.$holder.html(HistoryView.render().$el);
	}





});