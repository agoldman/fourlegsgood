window.FLG = {

	Models: {},
	Collections: {},
	Views: {},
	Routers: {},

	initialize: function($holder, userData) {
	var user = new FLG.Models.User(userData);
	new FLG.Routers.DashboardRouter($holder, user);
	Backbone.history.start();
	}
}