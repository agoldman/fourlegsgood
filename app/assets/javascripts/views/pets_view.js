FLG.Views.PetView = Backbone.View.extend({

render: function() {
	
	var that = this;
	var pets = new FLG.Collections.Pets
	pets.url = that.model.escape("id") + "/pets"
	pets.fetch({
		success: function() {
			var renderedContent = JST["pets/index"]({
				mypets: pets
			});
			that.$el.html(renderedContent);
		}
	});
	return that;
}

})