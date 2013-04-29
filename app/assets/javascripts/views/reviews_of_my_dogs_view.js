FLG.Views.ReviewsOfMyDogsView = Backbone.View.extend({
	
	render: function() {
		var that = this;

		var reviewsOfMyDog = new FLG.Collections.ReviewsofMyDog();
		reviewsOfMyDog.url = that.model.escape('id') + "/my_dogs_reviews"; //custom route
		reviewsOfMyDog.fetch({
			success: function() {

				reviewsOfMyDog.each(function(rev) {
					console.log(moment(rev.escape("created_at")).format("dddd, MMMM Do YYYY, h:mm:ss a"));
				});
			var renderedContent = JST["reviews/mydogs"]({
				dogreviews: reviewsOfMyDog
			});
			that.$el.html(renderedContent);
			    }
			});
		return that;
	}
})