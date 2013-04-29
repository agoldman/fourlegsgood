FLG.Routers.ReviewsRouter = Backbone.Router.extend({

	initialize: function(user) {
		this.user = user;
	},

	routes: {

		"reviews/mydogs": "mydogs",
		"reviews/mysitting" : "mysitting",
		"reviews/otherdogs" : "otherdogs",
		"reviews/othersitters" : "othersitters"
	},

		mydogs: function() {
			var that = this;
			var ReviewsOfMyDogsView = new FLG.Views.ReviewsOfMyDogsView({
				model: that.user
			});
			window.$(".activereviewlist").addClass("reviewnameholder").removeClass("activereviewlist");
			window.$(".mydogreview").removeClass("reviewnameholder").addClass("activereviewlist");
			window.$(".activelist").empty();
			window.$(".reviewsofmydogs").addClass('activelist');
			window.$(".reviewsofmydogs").html(ReviewsOfMyDogsView.render().$el);

	},

		mysitting: function() {
			var that = this;
			var ReviewsOfMySittingView = new FLG.Views.ReviewsOfMySittingView({
				model: that.user
			});
			window.$(".activereviewlist").addClass("reviewnameholder").removeClass("activereviewlist");
			window.$(".mysittingreview").removeClass("reviewnameholder").addClass("activereviewlist");
			window.$(".activelist").empty();
			window.$(".reviewsofmysitting").addClass('activelist');
			window.$(".reviewsofmysitting").html(ReviewsOfMySittingView.render().$el);

	}
	// },

	// 	mysitting: function(){
	// 	var that = this;
	// 	var SentMessagesView = new FLG.Views.SentMessagesView({
	// 		model: that.user
	// 	});
	// 	that.detailEl.html(SentMessagesView.render().$el);
	// 	window.$(".selectedmsgs").addClass("msglink").removeClass("selectedmsgs");
	// 	window.$(".sentlist").removeClass("msglink").addClass("selectedmsgs");
	// 	},

	// 	otherdogs: function(){
	// 	var that = this;
	// 	var MessagesHistoryView = new FLG.Views.MessagesHistoryView({
	// 		model: that.user
	// 	});
	// 	that.detailEl.html(MessagesHistoryView.render().$el);
	// 	window.$(".selectedmsgs").addClass("msglink").removeClass("selectedmsgs");
	// 	window.$(".historylist").removeClass("msglink").addClass("selectedmsgs");
	// 	},

	// 	othersitters: function(){
	// 	var that = this;
	// 	var MessagesHistoryView = new FLG.Views.MessagesHistoryView({
	// 		model: that.user
	// 	});
	// 	that.detailEl.html(MessagesHistoryView.render().$el);
	// 	window.$(".selectedmsgs").addClass("msglink").removeClass("selectedmsgs");
	// 	window.$(".historylist").removeClass("msglink").addClass("selectedmsgs");
	// 	}

})