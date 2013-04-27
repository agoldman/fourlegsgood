window.FLG = {

	Models: {},
	Collections: {},
	Views: {},
	Routers: {},

	initialize: function($holder, userData) {
		var user = new FLG.Models.User(userData);
		var MSGSrouter = new FLG.Routers.MessagesRouter(user);
		new FLG.Routers.DashboardRouter($holder, user, MSGSrouter);
		Backbone.history.start();
	}
}