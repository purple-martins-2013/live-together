window.LiveTogether = {
  Models: {
  },
  Collections: {
  },
  Views: {
  },
  Routers: {},
  initialize: function() {
    this.router = new LiveTogether.Routers.Main();
    Backbone.history.start();
  }
};

