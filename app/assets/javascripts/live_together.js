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
    // this.router.navigate("house", {trigger:true});

    // Map links with a backbone attribute to the backbone router
    $(document).on('click', 'a[backbone]', function(e){
      e.preventDefault();
      console.log('link clicked:', e);
      LiveTogether.router.navigate( $(this).attr('href'), {trigger: true} );
    });
  }
};

