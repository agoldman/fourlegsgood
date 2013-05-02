FLG.Views.UserDashBoardView = Backbone.View.extend({

	render: function() {
		var that = this;
		that.model.url = that.model.escape('id')

		that.model.fetch({
			success: function() {
			var renderedContent = JST["dashboards/dashboard"]({
				user: that.model
			});
			that.$el.html(renderedContent);
			
			    }
			})
		return that;
		}
})