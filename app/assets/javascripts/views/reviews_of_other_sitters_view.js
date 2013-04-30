FLG.Views.ReviewsOfOtherSittersView = Backbone.View.extend({
	
	render: function() {
		var that = this;
		var ReviewsofOtherSitters = new FLG.Collections.ReviewsofOtherSitters();
		ReviewsofOtherSitters.url = that.model.escape('id') + "/other_sitters_reviews"; 
		ReviewsofOtherSitters.fetch({
			success: function() {
			var renderedContent = JST["reviews/sittersbyme"]({
				reviews: ReviewsofOtherSitters
			});
			that.$el.html(renderedContent);
			    }
			});
		return that;
	}
})