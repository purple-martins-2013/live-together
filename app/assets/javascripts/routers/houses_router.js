LiveTogether.Routers.Houses = Backbone.Router.extend({

  routes: {
    "house": "houseDash"
  },

  houseDash: function(){
    console.log('main house dash route triggered');
  }

});
