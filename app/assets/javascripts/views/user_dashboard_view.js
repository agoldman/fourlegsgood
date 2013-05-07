FLG.Views.UserDashBoardView = Backbone.View.extend({

	render: function() {
		var that = this;
		that.model.url = that.model.escape('id')

		that.model.fetch({
			success: function() {

			var active_sittings_requested = new FLG.Collections.Requests;	
			active_sittings_requested.url = "current_requests" + that.model.escape("id");
			var renderedContent = JST["dashboards/dashboard"]({
				user: that.model
			});
			that.$el.html(renderedContent);
			
			    }
			})
		return that;
		}
})