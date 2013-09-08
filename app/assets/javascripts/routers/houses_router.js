LiveTogether.Routers.Houses = Backbone.Router.extend({

  routes: {
    "test": "test"
  },

  test: function(){
    console.log('test backbone route triggered');
  }

});
