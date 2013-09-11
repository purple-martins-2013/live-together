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
    if (!window.location.hash) {
      this.router.navigate('house', {trigger: true});
    }
  }
};

