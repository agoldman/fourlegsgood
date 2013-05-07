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
				$("#phonevar").html("<input id='phonenumfield' type='text' placeholder='Ex: 123-456-7890'><button id='phone-button'>Send SMS</button>");
		
				$('#phone-button').click(function(){
					var num = $('#phonenumfield').val()
					$.post('/users/' + that.model.escape('id') + '/verify', { "phone": num }, function(data) {
						console.log("post return");
						console.log(data);
						$("#phonevar").html("<input id='phonecodefield' type='text' placeholder='Ex: 000000'><button id='phone-code-button'>Submit</button>");
						$('#phone-code-button').click(function() {
							console.log("clicked confirmaton");
						});
					}, "json");
				});
			});
		}
	});
		return that;
		}
})