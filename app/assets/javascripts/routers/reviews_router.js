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

	//make title pink on an active review category
	removeHighlight: function() {
		window.$(".activereviewlist").addClass("reviewnameholder").removeClass("activereviewlist");
	},

	addHighlight: function(title) {
		window.$(title).removeClass("reviewnameholder").addClass("activereviewlist");
	},

	//remove content from previous review box. show content in clicked review box.
	moveContentBox: function(inputBox, view) {
		window.$(".activelist").empty();
		window.$(inputBox).addClass('activelist');
		window.$(inputBox).html(view.render().$el);
	},

	switchReviewShow: function (title, inputBox, view) {
		var that = this;
		that.removeHighlight();
		that.addHighlight(title);
		that.moveContentBox(inputBox, view)
	},

	mydogs: function() {
		var that = this;
		var ReviewsOfMyDogsView = new FLG.Views.ReviewsOfMyDogsView({
			model: that.user
		});
		that.switchReviewShow(".mydogreview", ".reviewsofmydogs", ReviewsOfMyDogsView);
	},

	mysitting: function() {
		var that = this;
		var ReviewsOfMySittingView = new FLG.Views.ReviewsOfMySittingView({
			model: that.user
		});
		that.switchReviewShow(".mysittingreview", ".reviewsofmysitting", ReviewsOfMySittingView);
	}, 

	otherdogs: function() {
		var that = this;
		var ReviewsOfOtherDogsView = new FLG.Views.ReviewsOfOtherDogsView({
			model: that.user
		});
		that.switchReviewShow(".otherdogsreview", ".reviewsofotherdogs", ReviewsOfOtherDogsView);
	},

	othersitters: function() {
		var that = this;
		var ReviewsOfOtherSittersView = new FLG.Views.ReviewsOfOtherSittersView({
			model: that.user
		});
		that.switchReviewShow(".othersittersreview", ".reviewsofothersitters", ReviewsOfOtherSittersView);
	}

})