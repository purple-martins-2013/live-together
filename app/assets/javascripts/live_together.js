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
  initialize: function() {
    Backbone.history.start();
    this.router = new this.Routers.Houses();
    this.router.navigate("house", {trigger:true});
  }
};

