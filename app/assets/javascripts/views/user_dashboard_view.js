FLG.Views.UserDashBoardView = Backbone.View.extend({
	events: {
		"click a#updatephotolink": "uploadForm"
	},
	
	initialize: function() {
		filepicker.setKey("AKt3Soe5QmC1Y5V74Scwrz");
		this.renderCallback = this.render.bind(this);
		
	},
	
	uploadForm: function() {
		var that = this;
		filepicker.pick({
		    mimetypes: ['image/*', 'text/plain'],
		    container: 'modal',
		    services:['COMPUTER', 'FACEBOOK', 'GMAIL'],
		  },
		  function(FPFile){
			  console.log(that.model);
			  console.log(JSON.stringify(FPFile));
			  console.log(FPFile.url);
			  
		    that.model.save({ filepicker_url : FPFile.url }, {
		    	success: that.renderCallback
		    })
		  },
		  function(FPError){
		    console.log(FPError.toString());
		  }
		);
	},

	render: function() {
		var that = this;
		that.model.url = that.model.escape('id')

		that.model.fetch({
			success: function() {

			var active_sittings_requested = new FLG.Collections.Requests;	
			active_sittings_requested.url = "current_requests" + that.model.escape("id");
			var renderedContent = JST["dashboards/dashboard"]({
				user: that.model,
				phone: that.model.escape('phone_number'),
				uid: that.model.escape('uid')
			});
			that.$el.html(renderedContent);
			$('#verify-phone').click(function(){
				$("#phonevar").html("<input id='phonenumfield' type='text' placeholder='Ex: 123-456-7890'><button id='phone-button'>Send SMS</button>");
		
				$('#phone-button').click(function(){
					var num = $('#phonenumfield').val()
					$("#phonevar").html("<input id='phonecodefield' type='text' placeholder='Ex: 000000'><button id='phone-code-button'>Submit</button>");
			
					$.post('/users/' + that.model.escape('id') + '/verify', { "phone": num }, function(data) {

						console.log("sent sms");
						$('#phone-code-button').click(function() {
							console.log("clicked code button");
							var usercode = $('#phonecodefield').val()
							$.post('/users/' + that.model.escape('id') + '/confirm', { "code": usercode, "phone": num }, function(data) {
						
							console.log("passwords compared")
							console.log(data);
							if(data) {
								
								console.log(num);
								$("#phonevar").html("<img src='/assets/phone-icon.jpg' alt='phone-icon' width='25' height='25'>" + "  " + num);

							}
							else {
								$("#profstuff").append("<p>Please Try Again</p>");
							}

						}, "json");


					});
					}, "json");
				});
			});
			}
		});
		return that;
	}
})