FLG.Views.UserDashBoardView = Backbone.View.extend({

	render: function() {
		var that = this;
		that.model.url = that.model.escape('id')

		that.model.fetch({
			success: function() {

			var active_sittings_requested = new FLG.Collections.Requests;	
			active_sittings_requested.url = "current_requests" + that.model.escape("id");
			var renderedContent = JST["dashboards/dashboard"]({
				user: that.model,
				phone: that.model.escape('phone_number')
			});
			that.$el.html(renderedContent);
			$('#verify-phone').click(function(){
				$("#phonevar").html("<form><input id='phonenumfield' type='text' placeholder='Enter Phone Number'><input id='phone-button' type='submit' value='Send SMS'></form>")
			});
			}
		});
		return that;
		}
})