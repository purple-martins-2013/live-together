window.LiveTogether = {
  Models: {
    Created: {}
  },
  Collections: {
    Created: {}
  },
  Views: {
    Created: {}
  },
  Routers: {},
  initialize: function(houseJSON) {
    window.router = new LiveTogether.Routers.Main();
    Backbone.history.start();
    router.navigate("house", {trigger:true});
  }
};

