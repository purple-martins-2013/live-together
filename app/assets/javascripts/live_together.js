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

    setTimeout(function(){
      $('.button.success.disabled').slideUp();
    }, 2000);

    this.current_user = new LiveTogether.Models.CurrentUser();
    this.current_user.fetch({
      success: function(){
        console.log(LiveTogether.current_user);
      }
    });
  }
};

