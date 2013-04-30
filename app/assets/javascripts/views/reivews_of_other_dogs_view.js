FLG.Views.ReviewsOfOtherDogsView = Backbone.View.extend({
	
	render: function() {
		var that = this;
		var reviewsOfOtherDogs = new FLG.Collections.ReviewsofOtherDogs();
		reviewsOfOtherDogs.url = that.model.escape('id') + "/other_dogs_reviews"; //custom route
		reviewsOfOtherDogs.fetch({
			success: function() {
			var renderedContent = JST["reviews/dogsbyme"]({
				reviews: reviewsOfOtherDogs
			});
			that.$el.html(renderedContent);
			    }
			});
		return that;
	}
})