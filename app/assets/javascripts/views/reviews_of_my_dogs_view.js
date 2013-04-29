FLG.Views.ReviewsOfMyDogsView = Backbone.View.extend({
	
	render: function() {
		var that = this;

		var reviewsOfMyDog = new FLG.Collections.ReviewsofMyDog();
		reviewsOfMyDog.url = that.model.escape('id') + "/my_dogs_reviews"; //custom route
		reviewsOfMyDog.fetch({
			success: function() {
			var renderedContent = JST["reviews/all"]({
				reviews: reviewsOfMyDog
			});
			that.$el.html(renderedContent);
			    }
			});
		return that;
	}
})