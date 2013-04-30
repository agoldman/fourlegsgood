FLG.Views.HistoryView = Backbone.View.extend({

render: function() {
	
	var that = this;
	var sat_for_dogs = new FLG.Collections.SatForDogs;
	sat_for_dogs.url = that.model.escape("id") + "/sat_for_dogs";
	sat_for_dogs.fetch({

		success: function() {

			var sitters = new FLG.Collections.Sitters
			sitters.url = that.model.escape("id") + "/sitters";
			sitters.fetch({

			success: function() {
				var renderedContent = JST["sittings/index"]({
					mysittings: sat_for_dogs,
					mysitters: sitters
				});
				that.$el.html(renderedContent);
			}
			});
		}
	});
	return that;
}

})