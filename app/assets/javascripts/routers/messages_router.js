FLG.Routers.MessagesRouter = Backbone.Router.extend({

	initialize: function(user) {
	this.user = user;
	},

	addEl: function(detailEl) {
	this.detailEl = detailEl;
	},

	routes: {

		"msgs/inbox": "inbox",
		"msgs/sent" : "sent",
		"msgs/all" : "all",
		"msgs/new" : "new"
	},

	removeTab: function() {
		window.$(".selectedmsgs").addClass("msglink").removeClass("selectedmsgs");
	},

	addTab: function(title){
		window.$(title).removeClass("msglink").addClass("selectedmsgs");
	},

	switchMessageShow: function(title, view) {
		var that = this;
		that.detailEl.html(view.render().$el);
		that.removeTab();
		that.addTab(title);
	},

	inbox: function() {
		var that = this;
		var MessagesInboxView = new FLG.Views.MessagesInboxView({
			model: that.user
		});
		that.switchMessageShow(".inboxlist", MessagesInboxView);
	},

	sent: function(){
		var that = this;
		var SentMessagesView = new FLG.Views.SentMessagesView({
			model: that.user
		});
		that.switchMessageShow(".sentlist", SentMessagesView);
	},

	all: function(){
		var that = this;
		var MessagesHistoryView = new FLG.Views.MessagesHistoryView({
			model: that.user
		});
		that.switchMessageShow(".historylist", MessagesHistoryView);
	}

})