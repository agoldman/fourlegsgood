FLG.Views.ReviewsView = Backbone.View.extend({
	
	render: function() {
		var that = this;
		var renderedContent = JST["reviews/index"]({
			});
		that.$el.html(renderedContent);
		return that;
	}
})