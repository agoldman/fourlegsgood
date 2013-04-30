FLG.Views.ReviewsOfMySittingView = Backbone.View.extend({
	
	render: function() {
		var that = this;
		var ReviewsofMySitting = new FLG.Collections.ReviewsofMySitting();
		ReviewsofMySitting.url = that.model.escape('id') + "/my_sitting_reviews"; //custom route
		ReviewsofMySitting.fetch({
			success: function() {
			var renderedContent = JST["reviews/all"]({
				reviews: ReviewsofMySitting
			});
			that.$el.html(renderedContent);
			    }
			});
		return that;
	}
})