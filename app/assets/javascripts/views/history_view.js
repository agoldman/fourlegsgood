FLG.Views.HistoryView = Backbone.View.extend({

render: function() {
	
	var that = this;
	var sat_for_owners = new FLG.Collections.SatForOwners;
	sat_for_owners.url = that.model.escape("id") + "/sittings";
	sat_for_owners.fetch({

		success: function() {
			var renderedContent = JST["sittings/index"]({
				mysittings: sat_for_owners
			});
			that.$el.html(renderedContent);
		}
	});
	// var sitters = new FLG.Collection.Sitters
	// sitters.url = that.model.escape("id") + "/sitters";
	// sitters.fetch({

	// 	success: function() {
	// 		var renderedContent = JST["sitters/index"]({
	// 			mysitters: sitters
	// 		});
	// 		$(".sitters").html(renderedContent);
	// 	}
	// });
	return that;
}

})