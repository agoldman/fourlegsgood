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

	}, 

		otherdogs: function() {
			var that = this;
			var ReviewsOfOtherDogsView = new FLG.Views.ReviewsOfOtherDogsView({
				model: that.user
			});
			window.$(".activereviewlist").addClass("reviewnameholder").removeClass("activereviewlist");
			window.$(".otherdogsreview").removeClass("reviewnameholder").addClass("activereviewlist");
			window.$(".activelist").empty();
			window.$(".reviewsofotherdogs").addClass('activelist');
			window.$(".reviewsofotherdogs").html(ReviewsOfOtherDogsView.render().$el);
		},


		othersitters: function() {
			var that = this;
			var ReviewsOfOtherSittersView = new FLG.Views.ReviewsOfOtherSittersView({
				model: that.user
			});
			window.$(".activereviewlist").addClass("reviewnameholder").removeClass("activereviewlist");
			window.$(".othersittersreview").removeClass("reviewnameholder").addClass("activereviewlist");
			window.$(".activelist").empty();
			window.$(".reviewsofothersitters").addClass('activelist');
			window.$(".reviewsofothersitters").html(ReviewsOfOtherSittersView.render().$el);
		}


})